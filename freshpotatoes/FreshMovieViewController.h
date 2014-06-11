//
//  FreshMovieViewController.h
//  freshpotatoes
//
//  Created by Guy Morita on 6/6/14.
//  Copyright (c) 2014 geemoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreshMovieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *freshMovieScrollView;

@property (strong, nonatomic) NSDictionary *movieDetails;
@property (weak, nonatomic) IBOutlet UILabel *freshMovieTitle;
@property (weak, nonatomic) IBOutlet UILabel *freshMovieSynopsis;
@property (weak, nonatomic) IBOutlet UILabel *freshMovieCast;


@end
