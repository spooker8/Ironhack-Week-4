//
//  Model.m
//  IronSquare
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "Model.h"

@implementation Model



//Tell Mantle how we want to map our properties to the JSON keys when the beer objects are created
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"text" : @"text",
             @"latitude" : @"latitude",
               @"longitude" : @"longitude",
             @"user" : @"user",
             @"map_image" : @"map_image"
             
             };
    
    
}




@end

