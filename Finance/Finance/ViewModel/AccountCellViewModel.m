//
//  AccountCellViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "AccountCellViewModel.h"
#import "Account.h"

@implementation AccountCellViewModel

- (instancetype)initWithAccount:(Account *)account
{
    self = [super init];
    if (!self) return nil;

    _account = account;
    _accountString = account.name;

    return self;
}

@end
