//
//  EntryListViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "RVMViewModel.h"

@class EntryListEmptyViewModel;
@class Account;

@interface EntryListViewModel : RVMViewModel
@property (nonatomic, strong, readonly) NSArray *entryViewModels;
@property (nonatomic, strong, readonly) EntryListEmptyViewModel *emptyViewModel;
@property (nonatomic, strong, readonly) Account *account;

@property (nonatomic, strong, readonly) NSString *title;

- (instancetype)initWithAccount:(Account *)account;

@end
