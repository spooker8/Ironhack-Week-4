//
//  BeersCountriesDataManager.m
//  BeerAndCountries
//
//  Created by Anand Kumar on 5/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "BeersCountriesDataManager.h"


/**
 
 For special comment.
 
 */

@interface BeersCountriesDataManager ()
@property CoreDataStack *stack;
@end

@implementation BeersCountriesDataManager




- (instancetype)init {
    self = [super init];
    if (self) {
        self.stack=[[CoreDataStack alloc] initWithModelName:@"BeersCountries"];
    }
    return self;
}



+(id)shareManager {
    
    static BeersCountriesDataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    sharedManager = [[self alloc] init];
       
    });
    
    return sharedManager;
    
}

-(void)save{
    
    NSError *error;
    [self.stack.managedObjectContext save:&error];
    if (error) {
        
        NSLog(@"Error saving MOC!!!!");
    }
    
    
}



#pragma mark - CRUD methods for Country
//Create

-(CountryEntity *)createCountryWithName:(NSString *)name flag:
    (NSString *)flag {
    //Create country using the core data stack
    
    CountryEntity *country = [NSEntityDescription
                              insertNewObjectForEntityForName:@"CountryEntity" inManagedObjectContext:self.stack.managedObjectContext];
    
    country.name = name;
    country.flag = flag;
    
    
    
    [self save];
    
    return country;
    
}


//Find a country by name

-(CountryEntity *)countryWithName:(NSString *)name {
    
  //Counstruct our query to search the database by name
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Country"];
    
    fetchRequest.predicate = searchPredicate;
    
    
    NSArray *results = [self.stack.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return [results firstObject];
    
    
    //Results will ha
    
};



//List all countries

-(NSArray *)allBeers {
    
    NSPredicate *truePredicate = [NSPredicate predicateWithValue:YES];
    
    NSFetchRequest *fetchrequest = [NSFetchRequest fetchRequestWithEntityName:@"BeerEntity"];
    fetchrequest.predicate = truePredicate;
    
    NSArray *results = [self.stack.managedObjectContext executeFetchRequest:fetchrequest error:nil];
    
    return results;
    
    
    
};





#pragma mark - CRUD methods for Beer

-(BeerEntity *)createBeerWithName:(NSString *)name stock:
(int32_t)stock image:(NSString *)image country:(CountryEntity *)country  {
    //Create country using the core data stack
    
    BeerEntity *beer= [NSEntityDescription
                              insertNewObjectForEntityForName:@"BeerEntity" inManagedObjectContext:self.stack.managedObjectContext];
  
    beer.name = name;
    beer.stock = (int32_t)stock;
    beer.image = image;
    beer.country= country;
    
    
    [self save];
    
    return beer;
    
}


//List all beers





//Delete beer



@end
