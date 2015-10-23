//
//  AFIngredient.m
//  FatSecretKit
//
//  Created by Andrey Filyakov on 23.10.15.
//  Copyright © 2015 Mysterious Trousers. All rights reserved.
//

#import "AFIngredient.h"

@implementation AFIngredient

+ (instancetype)ingredientWithJSON:(NSDictionary *)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _foodId = [[json objectForKey:@"food_id"] integerValue];
        _foodName = [json objectForKey:@"food_name"];
        _servingId = [[json objectForKey:@"serving_id"] integerValue];
        _numberOfUnits = [[json objectForKey:@"number_of_units"] integerValue];
        _measurementDescription = [json objectForKey:@"measurement_description"];
        _ingredientURL = [json objectForKey:@"ingredient_url"];
        _ingredientDescription = [json objectForKey:@"ingredient_description"];
    }
    return self;
}

@end
