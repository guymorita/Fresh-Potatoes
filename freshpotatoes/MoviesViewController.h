//
//  MoviesViewController.h
//  freshpotatoes
//
//  Created by Guy Morita on 6/6/14.
//  Copyright (c) 2014 geemoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSString *url;

@end
