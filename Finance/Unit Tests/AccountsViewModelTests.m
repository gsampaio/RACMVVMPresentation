//
//  AccountsViewModelTests.m
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

#import <OCMock/OCMock.h>

#import "Database.h"
#import "Account.h"
#import "AccountsViewModel.h"
#import "AccountCellViewModel.h"

SpecBegin(AccountsViewModel)

describe(@"the accounts view model", ^{
    
    __block Account *account;
    __block Database *database;
    __block AccountsViewModel *viewModel;
    
    beforeAll(^{
        account = [[Account alloc] initWithName:@"HSBC" value:@(10)];
        database = [Database new];
        viewModel = [[AccountsViewModel alloc] initWithDatabase:database];
    });
    
    context(@"when adding a account to the database", ^{

        it (@"should have no accounts view model at begining", ^{
            expect([viewModel.accountViewModels count]).to.equal(0);
        });
        
        it (@"should have an account view model after adding to the database", ^{
            __block BOOL completed = NO;
            
            [[database  addAccountSignal:account] subscribeCompleted:^{
                completed = YES;
            }];
            
            expect(completed).will.beTruthy();
            expect([viewModel.accountViewModels count]).to.equal(1);
        });
        
        it (@"should have an account view model with the same account added", ^{
            AccountCellViewModel *accountCellViewModel = viewModel.accountViewModels[0];
            expect(accountCellViewModel.account).to.equal(account);
        });
    });
    
    context(@"when deleting an account from the database", ^{
        
        __block id databaseMock;
        before(^{
            database = [Database new];
            databaseMock = [OCMockObject partialMockForObject:database];
            viewModel = [[AccountsViewModel alloc] initWithDatabase:databaseMock];

            [[databaseMock addAccountSignal:account] subscribeCompleted:^{}];
        });
        
        it (@"should call remove account on the database", ^{
            [[databaseMock expect] deleteAccountSignal:account] ;
            [viewModel deleteAccountViewModel:viewModel.accountViewModels[0]];
            
            [databaseMock verify];
            
        });
        
        it (@"should have no accounts view model after deleting from database", ^{
            [databaseMock deleteAccountSignal:account] ;
            [viewModel deleteAccountViewModel:viewModel.accountViewModels[0]];
            
            expect([viewModel.accountViewModels count]).will.equal(0);
        });
        
    });
    
});

SpecEnd
