//
//  AFDirection.m
//  FatSecretKit
//
//  Created by Andrey Filyakov on 23.10.15.
//  Copyright © 2015 Mysterious Trousers. All rights reserved.
//

#import "AFDirection.h"

@implementation AFDirection

+ (instancetype)directionWithJSON:(NSDictionary *)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _directionNumber = [[json objectForKey:@"direction_number"] integerValue];
        _directionDescription = [json objectForKey:@"direction_description"];
    }
    return self;
}

@end
