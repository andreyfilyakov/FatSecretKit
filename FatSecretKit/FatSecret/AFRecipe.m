//
//  AFRecipe.m
//  FatSecretKit
//
//  Created by Andrey Filyakov on 23.10.15.
//  Copyright © 2015 Mysterious Trousers. All rights reserved.
//

#import "AFRecipe.h"
#import "FSServing.h"
#import "AFIngredient.h"
#import "AFDirection.h"

@implementation AFRecipe

+ (instancetype)recipeWithJSON:(NSDictionary *)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _recipeId = [[json objectForKey:@"recipe_id"] integerValue];
        _recipeName = [json objectForKey:@"recipe_name"];
        _recipeURL = [json objectForKey:@"recipe_url"];
        _recipeDescription = [json objectForKey:@"recipe_description"];
        _numberOfServings = [[json objectForKey:@"number_of_servings"] integerValue];
        _preparationTime = [[json objectForKey:@"preparation_time_min"] integerValue];
        _cookingTime = [[json objectForKey:@"cooking_time_min"] integerValue];
        _rating = [[json objectForKey:@"rating"] integerValue];
        
        id servings = [json objectForKey:@"serving_sizes"];
        _servings = @[];
        if (servings) {
            servings = [servings objectForKey:@"serving"];
            if ([servings respondsToSelector:@selector(arrayByAddingObject:)]) {
                NSMutableArray *array = [@[] mutableCopy];
                for (NSDictionary *serving in servings) {
                    [array addObject:[FSServing servingWithJSON:serving]];
                }
                _servings = array;
            } else {
                if ([servings count] == 0) {
                    _servings = @[];
                } else {
                    _servings = @[ [FSServing servingWithJSON:servings] ];
                }
            }
        }
        
        id recipeImages = [json objectForKey:@"recipe_images"];
        _recipeImages = @[];
        if (recipeImages) {
            if ([recipeImages respondsToSelector:@selector(arrayByAddingObject:)]) {
                recipeImages = [recipeImages objectForKey:@"recipe_image"];
                NSMutableArray *array = [@[]mutableCopy];
                for (NSDictionary *recipeImage in recipeImages) {
                    [array addObject:[recipeImage objectForKey:@"recipe_image"]];
                }
                _recipeImages = array;
            } else {
                _recipeImages = @[[recipeImages objectForKey:@"recipe_image"]];
            }
        } else {
            recipeImages = [json objectForKey:@"recipe_image"];
            if (recipeImages) {
                _recipeImages = @[recipeImages];
            }
        }
        
        id ingredients = [json objectForKey:@"ingredients"];
        _ingredients = @[];
        if (ingredients) {
            ingredients = [ingredients objectForKey:@"ingredient"];
            if ([ingredients respondsToSelector:@selector(arrayByAddingObject:)]) {
                NSMutableArray *array = [@[]mutableCopy];
                for (NSDictionary *ingredient in ingredients) {
                    [array addObject:[AFIngredient ingredientWithJSON:ingredient]];
                }
                _ingredients = array;
            } else {
                if ([ingredients count] == 0) {
                    _ingredients = @[];
                } else {
                    _ingredients = @[[AFIngredient ingredientWithJSON:ingredients]];
                }
            }
        }
        
        id directions = [json objectForKey:@"directions"];
        _directions = @[];
        if (directions) {
            directions = [directions objectForKey:@"direction"];
            if ([directions respondsToSelector:@selector(arrayByAddingObject:)]) {
                NSMutableArray *array = [@[]mutableCopy];
                for (NSDictionary *direction in directions) {
                    [array addObject:[AFDirection directionWithJSON:direction]];
                }
                _directions = array;
            } else {
                if ([directions count] == 0) {
                    _directions = @[];
                } else {
                    _directions = @[[AFDirection directionWithJSON:directions]];
                }
            }
        }
    }
    return self;
}

@end
