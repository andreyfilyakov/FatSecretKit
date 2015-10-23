//
//  AFDirection.h
//  FatSecretKit
//
//  Created by Andrey Filyakov on 23.10.15.
//  Copyright © 2015 Mysterious Trousers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFDirection : NSObject

@property (nonatomic, assign, readonly) NSInteger directionNumber;
@property (nonatomic, strong, readonly) NSString *directionDescription;

+ (instancetype)directionWithJSON:(NSDictionary *)json;

@end
