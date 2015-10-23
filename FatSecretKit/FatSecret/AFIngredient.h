//
//  AFIngredient.h
//  FatSecretKit
//
//  Created by Andrey Filyakov on 23.10.15.
//  Copyright © 2015 Mysterious Trousers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFIngredient : NSObject

@property (nonatomic, assign, readonly) NSInteger foodId;
@property (nonatomic, strong, readonly) NSString *foodName;
@property (nonatomic, assign, readonly) NSInteger servingId;
@property (nonatomic, assign, readonly) NSInteger numberOfUnits;
@property (nonatomic, strong, readonly) NSString *measurementDescription;
@property (nonatomic, strong, readonly) NSString *ingredientURL;
@property (nonatomic, strong, readonly) NSString *ingredientDescription;

+ (instancetype)ingredientWithJSON:(NSDictionary *)json;

@end
