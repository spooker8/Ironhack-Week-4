//
//  ViewController.m
//  AutoLayoutByCode
//
//  Created by Anand Kumar on 5/26/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import "AutolayoutHelper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *black;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Screen";
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createViewsAgain];
    
    

    
    
}


-(void)createViewsAgain
{
    
    UILabel *red = [[UILabel alloc ] init];
    red.backgroundColor = [UIColor redColor];
    red.text = @"red";
    red.textColor = [UIColor whiteColor];
    red.textAlignment = NSTextAlignmentCenter;
  //  [red setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    
    UILabel *blue = [[UILabel alloc] init];
    blue.text = @"blue";
    blue.backgroundColor = [UIColor blueColor];
    blue.textAlignment = NSTextAlignmentCenter;
 //   [blue setTranslatesAutoresizingMaskIntoConstraints:NO];
   
    
    UILabel *green = [[UILabel alloc] init];
    green.text = @"green";
    green.backgroundColor = [UIColor greenColor];
    green.textAlignment = NSTextAlignmentCenter;
  //  [green setTranslatesAutoresizingMaskIntoConstraints:NO];

    
    
//    
//    [self.black addSubview:red];
//    [self.black addSubview:blue];
//    [self.black addSubview:green];

    
    
    //NSDictionary *views = @{ @"blue":blue, @"red":red, @"green":green };  //why nsdictionary?? to store the color
    
    
    id top = self.topLayoutGuide;
    id bottom = self.bottomLayoutGuide;
    
    
    //NSDictionary *views = NSDictionaryOfVariableBindings(blue,red,green);
    NSDictionary *views = VarBindings(blue,red,green, top, bottom);
    
    
    [AutolayoutHelper configureView:self.view
                           subViews:views
                        constraints:@[
                                      @"H:|-[blue(50)]-(40)-[red]-|",
                                      
                                     // @"X:blue.width == red.widht /4" ,
                                      
                                       @"H:|-[blue(50)]-(40)-[red]-|",
                                      
                                      @"V:[top]-[blue(==green)]-[green]-[bottom]",
                                   
                                    //  @"V:|-[blue(==green)]-[green]-|",
                                      @"V:|-[red]-[green]-[bottom]",
                                      @"H:|-[green]-|"
                                      
                                      
                                      ]];
    
    
    
//    NSArray *cs1 = [NSLayoutConstraint
//                    constraintsWithVisualFormat:@"H:|-[blue(==red)]-[red]-|"
//                    options:0
//                    metrics:nil
//                    views:views];
//    
//    
//    NSArray *cs2 = [NSLayoutConstraint
//                    constraintsWithVisualFormat:@"V:|-[blue(==green)]-[green]-|"
//                    options:0
//                    metrics:nil
//                    views:views];
//    
//    
//    NSArray *cs3 = [NSLayoutConstraint
//                    constraintsWithVisualFormat:@"V:|-[red]-[green]-|"
//                    options:0
//                    metrics:nil
//                    views:views];
//
//    
//    NSArray *cs4 = [NSLayoutConstraint
//                    constraintsWithVisualFormat:@"H:|-[green]-|"
//                    options:0
//                    metrics:nil
//                    views:views];

    
 // relation blue width == red width * 0.5 + 0

    
//    NSLayoutConstraint *c = [NSLayoutConstraint constraintWithItem:blue
//                            attribute:NSLayoutAttributeWidth
//                              relatedBy:NSLayoutRelationEqual
//                               toItem:red
//                               attribute:NSLayoutAttributeWidth
//                               multiplier:0.5
//                              constant:0 ];
 
    
//    
//    [self.black addConstraints:cs1];
//    [self.black addConstraints:cs2];
//    [self.black addConstraints:cs3];
//    [self.black addConstraints:cs4];
    
 //    [self.black addConstraint:c];
    


 
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
