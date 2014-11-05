//
//  AddAccountViewModelTests.m
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
#import "AddAccountViewModel.h"

SpecBegin(AddAccountViewModel)

describe(@"Add Account View Model", ^{

    __block Database *database;
    __block Account *account;
    __block AddAccountViewModel *viewModel;
    
    beforeEach(^{
        database = [Database new];
        account = [[Account alloc] initWithName:@"HSBC" value:@(10)];
        viewModel = [[AddAccountViewModel alloc] initWithDatabase:database];
    });
    
        
    it (@"should not be able to create an account without a name and value", ^{
        __block BOOL enabled = YES;
        [viewModel.enableSignal subscribeNext:^(NSNumber *enabledValue) {
            enabled = [enabledValue boolValue];
        }];
        
        expect(enabled).to.beFalsy();
        
    });
    
    
    it (@"should not be able to create an account with only a name", ^{
        RAC(viewModel, accountName) = [RACSignal return:@"HSBC"];
        
        __block BOOL enabled = YES;
        [viewModel.enableSignal subscribeNext:^(NSNumber *enabledValue) {
            enabled = [enabledValue boolValue];
        }];
        
        expect(enabled).to.beFalsy();
    });
    
    it (@"should not be able to create an account with only a value", ^{
        RAC(viewModel, value) = [RACSignal return:@"10"];
        
        __block BOOL enabled = YES;
        [viewModel.enableSignal subscribeNext:^(NSNumber *enabledValue) {
            enabled = [enabledValue boolValue];
        }];
        
        expect(enabled).to.beFalsy();
    });
    
    it (@"should be able to create an account having value and name", ^{
        RAC(viewModel, value) = [RACSignal return:@"10"];
        RAC(viewModel, accountName) = [RACSignal return:@"HSBC"];
        
        __block BOOL enabled = NO;
        [viewModel.enableSignal subscribeNext:^(NSNumber *enabledValue) {
            enabled = [enabledValue boolValue];
        }];
        
        expect(enabled).to.beTruthy();
    });
    
    it (@"should call the database when adding an account", ^{
        id databaseMock = [OCMockObject partialMockForObject:database];
        [[databaseMock expect] addAccountSignal:OCMOCK_ANY];
        
        RAC(viewModel, accountName) = [RACSignal return:@"HSBC"];
        
        RAC(viewModel, value) = [RACSignal return:@"10"];
        
        [[viewModel createAccountSignal] subscribeNext:^(id x) {}];
        
        [databaseMock verify];
    });
    
    it (@"should return after creating an account", ^{
        RAC(viewModel, accountName) = [RACSignal return:@"HSBC"];
        RAC(viewModel, value) = [RACSignal return:@"10"];
        
        
        __block BOOL completed = NO;
        __block BOOL sentYES = NO;
        [viewModel.createAccountSignal subscribeNext:^(id x) {
            sentYES = [x boolValue];
        } completed:^{
            completed = YES;
        }];
        expect(completed).will.beTruthy();
        expect(sentYES).will.beTruthy();
    });
    
});

SpecEnd
