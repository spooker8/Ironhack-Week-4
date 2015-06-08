//
//  BeersCountriesDataManager.h
//  BeerAndCountries
//
//  Created by Anand Kumar on 5/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "CountryEntity.h"
#import "BeerEntity.h"

@interface BeersCountriesDataManager : NSObject


+(id)shareManager;

-(CountryEntity *)createCountryWithName:(NSString *)name flag:(NSString *)flag;

-(BeerEntity *)createBeerWithName:(NSString *)name stock:
(int32_t)stock image:(NSString *)image country:(CountryEntity *)country;

@end
