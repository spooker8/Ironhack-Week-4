//
//  ViewController.m
//  IronSquare
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()  <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property  (strong, nonatomic) NSMutableArray *ironSquareArray;
@property (assign) id delegate;


@end



@implementation ViewController


@synthesize  delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.ironSquareArray = [NSMutableArray array];
    
    
     // Do any additional setup after loading the view, typically from a nib.
   [delegate performSelector:@selector(editDone) withObject:nil];

    
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
       
    
    // 1. Check if the user is logged in (NSUserDefaults
    
    NSString *userEmail = [[NSUserDefaults standardUserDefaults]stringForKey:@"email"];
    
    //2.Show login screen if its not signed up
    // if the segue identifier to show the modal screen view controller
    
    if (userEmail == nil) {
        
        [self performSegueWithIdentifier:@"modalPush" sender:self];
        
        
        }
    
    
    NSString *getString = @"http://ironsquare.herokuapp.com/updates.json";

    //Create a manager that will perform the request
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:getString parameters:nil success:
     
     
     ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
       
        
        NSArray *ironSquareArray= responseObject;  //cal; the array of the json model
        
        
        for (NSDictionary *ironSquareDict in ironSquareArray) {
            //Create the beer objects using Mantle
            //call the dictionary file in the array of the json model
            
            NSError *error;
            
            Model *ironSquareArray =  [MTLJSONAdapter modelOfClass:[Model class] fromJSONDictionary:ironSquareDict error:&error];
            
            
            if (error !=nil) {
                NSLog(@"Error in creating something: %@", error);
            } else {
                
                [self.ironSquareArray addObject:ironSquareArray];
                
                
                
            }
        }
        
        [self.tableView reloadData];  //reload data from the table

     }
  
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         //Something wrong happened show the error below
         NSLog(@"Error: %@", error);

     }];
    
}

- (IBAction)AddAction:(id)sender {
    
   
}
     


- (IBAction)logoutAction:(id)sender {
    
    
  // NSString *email = self.emailTextField.text;
  //  NSString *password = self.passwordTextField.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:@"email"];
    [defaults removeObjectForKey:@"password"];
    
    [defaults synchronize];
    
    NSLog(@"Data Erased");
    
    NSString *userEmail = [[NSUserDefaults standardUserDefaults]stringForKey:@"email"];
    
    if (userEmail == nil) {
        
        [self performSegueWithIdentifier:@"modalPush" sender:self];
        
        
    }
    
}

//UITableView Codes

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.ironSquareArray.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CellViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell"];
    
    Model *modelCall = self.ironSquareArray[indexPath.row];
    
   NSString *stringLatitude = [NSString stringWithFormat:@"%f", modelCall.latitude];
   NSString *stringLongitude = [NSString stringWithFormat:@"%f", modelCall.longitude];

    
    
    cell.text.text = modelCall.text;
    
    cell.latitude.text = stringLatitude;
    cell.longitude.text = stringLongitude;
    cell.user.text = modelCall.user;
    [cell.IimageView setImageWithURL:[NSURL URLWithString:modelCall.map_image]];
    
   
    return cell;
     
}


-(void)editDone {
    [self.tableView reloadData];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
