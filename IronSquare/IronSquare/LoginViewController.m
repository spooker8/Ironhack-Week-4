//
//  LoginViewController.m
//  IronSquare
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "LoginViewController.h"
#import <AFNetworking/Afnetworking.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)loginButtonAction:(id)sender {
    
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
 
    
    NSDictionary *parameters = @{@"email": @"password"};
    
    [manager POST:@"http://ironsquare.herokuapp.com/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        // Store the data
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:email forKey:@"email"];
        [defaults setObject:password forKey:@"password"];
        
        [defaults synchronize];
        
        [self dismissViewControllerAnimated:YES completion:nil];  //this is for modal 
        
        NSLog(@"Data saved");
        

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
  

    
    

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
