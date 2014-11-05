//
//  EntryListViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "EntryListViewModel.h"
#import "EntryViewModel.h"
#import "EntryListEmptyViewModel.h"
#import "Account.h"

@implementation EntryListViewModel
- (instancetype)initWithAccount:(Account *)account
{
    self = [super init];
    if (!self) return nil;
    
    _emptyViewModel = [[EntryListEmptyViewModel alloc] init];
    _account = account;
    
    _title = account.name;
    
    RAC(self, entryViewModels) = [RACObserve(account, entries) map:^NSArray *(NSArray *entries) {
        return [[entries.rac_sequence map:^EntryViewModel *(Entry *entry) {
            EntryViewModel *entryViewModel = [[EntryViewModel alloc] initWithEntry:entry];
            return entryViewModel;
        }] array];
    }];
    
    return self;
}
@end
