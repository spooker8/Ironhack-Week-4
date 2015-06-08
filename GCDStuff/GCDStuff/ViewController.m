//
//  ViewController.m
//  GCDStuff
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet  UILabel  *randomNumberLabel;
@property  int  randomNumber;


@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)randomNumberAction:(id)sender {
    
  
    
    self.randomNumber = arc4random();
    self.randomNumberLabel.text = [NSString stringWithFormat:@"%ld",(long)self.randomNumber];
    
}



- (IBAction)randomNumberActionDispatch:(id)sender {
    
    
    
    self.randomNumber = arc4random();
    self.randomNumberLabel.text = [NSString stringWithFormat:@"%ld",(long)self.randomNumber];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
