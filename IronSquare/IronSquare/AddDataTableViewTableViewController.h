//
//  AddDataTableViewTableViewController.h
//  IronSquare
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/Afnetworking.h>
#import "Model.h"

@interface AddDataTableViewTableViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addText;

@property (weak, nonatomic) IBOutlet UITextField *addLatitude;

@property (weak, nonatomic) IBOutlet UITextField *addLongitude;

@property (weak, nonatomic) IBOutlet UITextField *addUser;

@property (weak, nonatomic) IBOutlet UITextField *addURL;

@end
