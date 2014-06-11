//
//  FreshMovieViewController.m
//  freshpotatoes
//
//  Created by Guy Morita on 6/6/14.
//  Copyright (c) 2014 geemoo. All rights reserved.
//

#import "FreshMovieViewController.h"

@interface FreshMovieViewController ()

@end

@implementation FreshMovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.freshMovieSynopsis.preferredMaxLayoutWidth = 280;
    self.freshMovieTitle.text = self.movieDetails[@"title"];
    self.freshMovieSynopsis.text = self.movieDetails[@"synopsis"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
