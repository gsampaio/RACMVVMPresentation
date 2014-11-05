//
//  Entry.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/26/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "Entry.h"

@implementation Entry
- (instancetype)initWithName:(NSString *)name value:(NSNumber *)value
{
    self = [super init];
    if (self) {
        _name = name;
        _value = value;
    }
    
    return self;
}
@end
