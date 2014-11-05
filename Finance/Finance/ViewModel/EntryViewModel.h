//
//  EntryViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "RVMViewModel.h"

@class Entry;

@interface EntryViewModel : RVMViewModel
@property (nonatomic, strong, readonly) Entry *entry;
@property (nonatomic, strong, readonly) NSString *entryName;
@property (nonatomic, strong, readonly) NSString *entryValue;

- (instancetype)initWithEntry:(Entry *)entry;

@end
