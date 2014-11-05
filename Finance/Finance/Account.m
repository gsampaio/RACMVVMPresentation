//
//  Account.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "Account.h"

@interface Account ()
@property (nonatomic, strong, readwrite) NSArray *entries;
@end

@implementation Account

- (instancetype)initWithName:(NSString *)name value:(NSNumber *)value
{
    self = [super init];
    if (self) {
        _name = name;
        _value = value;
        _entries = @[];
    }
    return self;
}

- (void)addEntry:(Entry *)entry
{
    NSMutableArray *mutableEntries = [self.entries mutableCopy];
    [mutableEntries addObject:entry];
    self.entries = [mutableEntries copy];
}

@end
