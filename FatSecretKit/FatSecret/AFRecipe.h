//
//  AFRecipe.h
//  FatSecretKit
//
//  Created by Andrey Filyakov on 23.10.15.
//  Copyright © 2015 Mysterious Trousers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFRecipe : NSObject

@property (nonatomic, assign, readonly) NSInteger recipeId;
@property (nonatomic, strong, readonly) NSString *recipeName;
@property (nonatomic, assign, readonly) NSString *recipeURL;
@property (nonatomic, strong, readonly) NSString *recipeDescription;
@property (nonatomic, assign, readonly) NSInteger numberOfServings;
@property (nonatomic, assign, readonly) NSInteger preparationTime;
@property (nonatomic, assign, readonly) NSInteger cookingTime;
@property (nonatomic, assign, readonly) NSInteger rating;

@property (nonatomic, strong, readonly) NSArray *recipeImages;
@property (nonatomic, strong, readonly) NSArray *servings;
@property (nonatomic, strong, readonly) NSArray *ingredients;
@property (nonatomic, strong, readonly) NSArray *directions;

+ (instancetype)recipeWithJSON:(NSDictionary *)json;

@end
