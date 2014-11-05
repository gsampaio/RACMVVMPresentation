//
//  EntryViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "EntryViewModel.h"
#import "Entry.h"

@implementation EntryViewModel
- (instancetype)initWithEntry:(Entry *)entry
{
    self = [super init];
    if (!self) return nil;
    
    _entry = entry;
    
    _entryName = entry.name;
    _entryValue = [[[self class] numberFormatter] stringFromNumber:entry.value];
    
    return self;
}

// Static number formatter only for performance issues
+ (NSNumberFormatter *)numberFormatter {
    static NSNumberFormatter *numberFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
    });
    
    return numberFormatter;
}

@end
