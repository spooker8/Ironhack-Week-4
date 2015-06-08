//
//  CountryEntity.h
//  
//
//  Created by Anand Kumar on 5/28/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BeerEntity;

@interface CountryEntity : NSManagedObject

@property (nonatomic, retain) NSString * flag;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSSet *beers;
@end

@interface CountryEntity (CoreDataGeneratedAccessors)

- (void)addBeersObject:(BeerEntity *)value;
- (void)removeBeersObject:(BeerEntity *)value;
- (void)addBeers:(NSSet *)values;
- (void)removeBeers:(NSSet *)values;

@end
