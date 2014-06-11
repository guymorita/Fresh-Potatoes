//
//  MoviesViewController.m
//  freshpotatoes
//
//  Created by Guy Morita on 6/6/14.
//  Copyright (c) 2014 geemoo. All rights reserved.
//

#import "MoviesViewController.h"
#import "FreshPotatoTableViewCell.h"
#import "FreshMovieViewController.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"

@interface MoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@property (strong, nonatomic) NSArray *rottenTomatoesData;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Fresh Potatoes";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // basically like document.ready
    
    // table views have no concept of how many there are and also what each should look like. so you have to make those explicit.
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self loadMovies];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.moviesTableView addSubview:self.refreshControl];
    
    
    // it's an async call. so you have to tell the table to reload itself once it returns
    self.moviesTableView.dataSource = self;
    self.moviesTableView.rowHeight = 130;
    
    self.moviesTableView.delegate = self;
    
    [self.moviesTableView registerNib:[UINib nibWithNibName:@"FreshPotatoTableViewCell" bundle:nil] forCellReuseIdentifier:@"FreshMovieCell"];

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self loadMovies];
}

- (void)loadMovies {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError){
            NSLog(@"Broken");
        } else {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //        NSLog(@"%@", object);
            self.rottenTomatoesData = object[@"movies"];
            [self.moviesTableView reloadData];
            // watch out for sending messages to a nil the first time.
            
        }
        [self.refreshControl endRefreshing];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rottenTomatoesData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FreshPotatoTableViewCell *freshMovieCell = [tableView dequeueReusableCellWithIdentifier:@"FreshMovieCell"];
    
    NSDictionary *movie = self.rottenTomatoesData[indexPath.row];
    
    freshMovieCell.freshTitleLabel.text = movie[@"title"];
    freshMovieCell.freshSynopsisLabel.text = movie[@"synopsis"];
    
    NSDictionary *posters = movie[@"posters"];
    
    NSURL *url = [NSURL URLWithString:posters[@"thumbnail"]];
    
    [freshMovieCell.freshPosterView setImageWithURL:url];
    
//    NSDictionary *posters = movie[@"posters"];
    
//    freshMovieCell.freshPosterView.image = posters[@"thumbnail"];
    
    return freshMovieCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FreshMovieViewController *freshMovie = [[FreshMovieViewController alloc] init];
    NSDictionary *movie = self.rottenTomatoesData[indexPath.row];
    freshMovie.movieDetails = movie;
    freshMovie.navigationItem.title = movie[@"title"];
    
    [self.navigationController pushViewController:freshMovie animated:YES];
    
}
@end