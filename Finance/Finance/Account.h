//
//  Account.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "MTLModel.h"

@class Entry;
@interface Account : MTLModel

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSNumber *value;
@property (nonatomic, strong, readonly) NSArray *entries;

- (instancetype)initWithName:(NSString *)name value:(NSNumber *)value;

- (void)addEntry:(Entry *)entry;

@end
