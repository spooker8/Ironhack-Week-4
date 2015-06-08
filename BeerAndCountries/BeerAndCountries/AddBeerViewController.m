//
//  AddBeerViewController.m
//  BeerAndCountries
//
//  Created by Anand Kumar on 5/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "AddBeerViewController.h"



@interface AddBeerViewController ()

@property (weak, nonatomic) IBOutlet UITextField *beerNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *countryNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryImageURLTextField;
@property (weak, nonatomic) IBOutlet UITextField *stockAmtTextField;



@property BeersCountriesDataManager *manager;

@end

@implementation AddBeerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.manager = [BeersCountriesDataManager shareManager];
    
    
}




- (IBAction)saveBeerAction:(id)sender {


NSString *beerName = self.beerNameTextField.text;
NSString *countryName = self.countryNameTextField.text;
NSString *countryURL= self.countryImageURLTextField.text;
NSInteger stockNo = [self.stockAmtTextField.text integerValue];
    
    
  
    
    CountryEntity *countryURL2 = [self.manager createCountryWithName:countryName flag:countryURL];

    [self.manager createBeerWithName:beerName stock:stockNo image:countryURL country:countryURL2];
    
    
    
   
    
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
