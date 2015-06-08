//
//  BeersViewController.m
//  BeerAndCountries
//
//  Created by Anand Kumar on 5/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "BeersViewController.h"
#import "BeersCountriesDataManager.h"
// #import "BeerEntity.h"
#import "CountryEntity.h"
#import "BeerInfoViewController.h"

@interface BeersViewController ()

@property BeersCountriesDataManager *manager;

@end

@implementation BeersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.dataSource = self;
    self.delegate = self;
    
    BeerInfoViewController *firstController = [self.storyboard instantiateViewControllerWithIdentifier:@"BeerPage"];
    
    NSArray *controllerArray = @[firstController];
    
    [self setViewControllers:controllerArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
    
    
    
    
    //Test Core Data CRUD
    
    self.manager = [BeersCountriesDataManager shareManager];
    
    CountryEntity *greece = [self.manager createCountryWithName:@"Greece" flag:@"http://www.yahoo.com/logo.png"];
    
    int32_t stock = 20;
    
    BeerEntity *beer = [self.manager createBeerWithName:@"Estrella" stock:stock image:@"http://onlinecashandcarry.co.uk/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/e/s/estrella_damm_nrb_330ml.jpg" country:greece];
    
    
};


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    
    BeerInfoViewController *previousViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BeerPage"];
    
    return previousViewController;
};




- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    BeerInfoViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BeerPage"];
    
    return nextViewController;
    
    
};







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

