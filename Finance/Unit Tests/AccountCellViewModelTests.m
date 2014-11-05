//
//  AccountCellViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/12/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Specta/Specta.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

#import "Account.h"
#import "AccountCellViewModel.h"

SpecBegin(AccountCellViewModel)

describe(@"Account cell", ^{
    
    __block Account *account;
    __block AccountCellViewModel *viewModel;
    
    beforeAll(^{
        account = [[Account alloc] initWithName:@"HSBC" value:@(10)];
        viewModel = [[AccountCellViewModel alloc] initWithAccount:account];
    });
    
    context(@"when initialized", ^{
        it (@"should have an account", ^{
            expect(viewModel.account).notTo.equal(nil);
        });
        
        it (@"should have the same account passed to the initilizer", ^{
            expect(viewModel.account).to.equal(account);
        });
        
        it (@"should have an account string with the same value of the account", ^{
            expect(viewModel.accountString).to.equal(account.name);
        });
        
    });
});


SpecEnd