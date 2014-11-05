//
//  AccountsViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveViewModel/RVMViewModel.h>

@class Database;
@class AccountCellViewModel;
@class AccountsEmptyViewModel;

@interface AccountsViewModel : RVMViewModel
@property (nonatomic, strong, readonly) Database *database;
@property (nonatomic, strong, readonly) NSArray *accountViewModels;
@property (nonatomic, strong, readonly) AccountsEmptyViewModel *emptyViewModel;
- (instancetype) initWithDatabase:(Database *)database;
- (void)deleteAccountViewModel:(AccountCellViewModel *)accountCellViewModel;

@end
