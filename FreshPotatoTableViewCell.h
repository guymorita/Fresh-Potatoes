//
//  FreshPotatoTableViewCell.h
//  freshpotatoes
//
//  Created by Guy Morita on 6/6/14.
//  Copyright (c) 2014 geemoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreshPotatoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *freshPosterView;
@property (weak, nonatomic) IBOutlet UILabel *freshTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *freshSynopsisLabel;


@end
