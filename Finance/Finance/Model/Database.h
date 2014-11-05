//
//  Database.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@class Account;

@interface Database : NSObject
@property (nonatomic, strong, readonly) NSArray *accounts;

- (RACSignal *)accountSignals;
- (RACSignal *)addAccountSignal:(Account *)account;
- (RACSignal *)deleteAccountSignal:(Account *)account;

@end
