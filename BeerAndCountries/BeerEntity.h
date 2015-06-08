//
//  BeerEntity.h
//  
//
//  Created by Anand Kumar on 5/28/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CountryEntity;

@interface BeerEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t stock;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) CountryEntity *country;

@end
