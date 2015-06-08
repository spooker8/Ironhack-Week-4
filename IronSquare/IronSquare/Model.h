//
//  Model.h
//  IronSquare
//
//  Created by Anand Kumar on 5/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Model : MTLModel <MTLJSONSerializing>



@property (strong, nonatomic) NSString *text;
@property  float latitude;
@property  float longitude;
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *map_image;



@end


