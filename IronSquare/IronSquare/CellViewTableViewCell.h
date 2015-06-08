//
//  CellViewTableViewCell.h
//  IronSquare
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *IimageView;

@property (weak, nonatomic) IBOutlet UILabel *text;

@property (weak, nonatomic) IBOutlet UILabel *latitude;

@property (weak, nonatomic) IBOutlet UILabel *longitude;

@property (weak, nonatomic) IBOutlet UILabel *user;
@end
