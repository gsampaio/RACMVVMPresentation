//
//  Entry.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/26/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "MTLModel.h"

@interface Entry : MTLModel
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSNumber *value;

- (instancetype)initWithName:(NSString *)name value:(NSNumber *)value;

@end
