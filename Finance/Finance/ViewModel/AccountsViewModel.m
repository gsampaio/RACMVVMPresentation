//
//  AccountsViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AccountsViewModel.h"
#import "AccountCellViewModel.h"
#import "Database.h"
#import "AccountsEmptyViewModel.h"

@interface AccountsViewModel ()
@property (nonatomic, strong, readwrite) Database *database;
@property (nonatomic, strong, readwrite) NSArray *accountViewModels;
@end

@implementation AccountsViewModel
- (instancetype)initWithDatabase:(Database *)database {
    self = [super init];
    if (!self) return nil;
    
    _database = database;
    
    RAC(self, accountViewModels) = [RACObserve(database, accounts) map:^NSArray *(NSArray *accounts) {
        
        NSMutableArray *accountsViewModel = [NSMutableArray new];
        for (Account * account in accounts) {
            AccountCellViewModel *accountCellViewModel = [[AccountCellViewModel alloc] initWithAccount:account];
            [accountsViewModel addObject:accountCellViewModel];
        }
        
        return [accountsViewModel copy];
    }];
    
    _emptyViewModel = [[AccountsEmptyViewModel alloc] init];
    
    return self;
}

- (void)deleteAccountViewModel:(AccountCellViewModel *)accountCellViewModel {
    Account *account = accountCellViewModel.account;
    [[self.database deleteAccountSignal:account] subscribeCompleted:^{
        
    }];
}

@end
