//
//  Database.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "Database.h"

@interface Database ()
@property (nonatomic, strong, readwrite) NSArray *accounts;
@end

@implementation Database

- (instancetype)init
{
    self = [super init];
    if (self) {
        _accounts = [NSMutableArray new];
    }
    return self;
}

- (RACSignal *)accountSignals {
    RACSignal *accountsSignals = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        for (id account in self.accounts) {
            [subscriber sendNext:account];
        }
        [subscriber sendCompleted];
        return nil;
    }];
    
    return accountsSignals;
}

- (RACSignal *)addAccountSignal:(Account *)account {
    RACSignal *addAccountSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        self.accounts = [self.accounts arrayByAddingObject:account];
        [subscriber sendNext:@YES];
        [subscriber sendCompleted];
        return nil;
    }];
    
    return addAccountSignal;
}

- (RACSignal *)deleteAccountSignal:(Account *)account {
    RACSignal *deleteAccountSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableArray *accountsArray = [self.accounts mutableCopy];
        [accountsArray removeObject:account];
        self.accounts = [accountsArray copy];
        [subscriber sendNext:@YES];
        [subscriber sendCompleted];
        return nil;
    }];
    
    return deleteAccountSignal;
}

@end
