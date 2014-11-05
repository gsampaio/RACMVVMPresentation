//
//  AccountCellViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "RVMViewModel.h"

@class Account;
@interface AccountCellViewModel : RVMViewModel
@property (nonatomic, strong, readonly) Account *account;
@property (nonatomic, strong, readonly) NSString *accountString;

- (instancetype)initWithAccount:(Account*)account;

@end
