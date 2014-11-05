//
//  DatabaseTests.m
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

#import "Database.h"
#import "Account.h"

SpecBegin(DatabaseTests)

describe(@"Database", ^{
    
    __block Database *database;
    __block Account *account;
    beforeAll(^{
        database = [Database new];
        account = [[Account alloc] initWithName:@"HSBC" value:@(10)];
    });
    
    context(@"accountSingal", ^{
        it (@"should have no accounts at begining", ^{
            __block BOOL completed = NO;
            __block BOOL sentValue = NO;
            
            [database.accountSignals subscribeNext:^(id x) {
                sentValue = YES;
            } completed:^{
                completed = YES;
            }];
            
            expect(completed).to.beTruthy();
            expect(sentValue).to.beFalsy;
        });
        
        it (@"should have empty account property", ^{
            expect([database.accounts count]).to.equal(0);
        });
        
        it (@"should add account with completion sending YES", ^{
            RACSignal *addAccountSignal = [database addAccountSignal:account];

            __block BOOL completed = NO;
            __block BOOL sentYES = NO;
            [addAccountSignal subscribeNext:^(id x) {
                sentYES = [x boolValue];
            } completed:^{
                completed = YES;
            }];
            
            expect(completed).will.beTruthy();
            expect(sentYES).will.beTruthy();
        });
        
        it (@"should have a account after we add it", ^{
            expect([database.accounts count]).to.equal(1);
        });
        
        it (@"should have the same account we added", ^{
            Account *databaseAccount = database.accounts[0];
            expect(databaseAccount).to.equal(account);
        });
        
        it (@"should delete account with completion sending YES", ^{
            RACSignal *deleteSignal = [database deleteAccountSignal:account];
            
            __block BOOL completed = NO;
            __block BOOL sentYES = NO;
            [deleteSignal subscribeNext:^(id x) {
                sentYES = [x boolValue];
            } completed:^{
                completed = YES;
            }];
            
            expect(completed).will.beTruthy();
            expect(sentYES).will.beTruthy();
        });
        
        it (@"should have no accounts after deletion", ^{
            expect([database.accounts count]).to.equal(0);
        });
    });
    
});

SpecEnd
