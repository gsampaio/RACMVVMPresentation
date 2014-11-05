//
//  AddAccountViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "AddAccountViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "Account.h"
#import "Database.h"

@implementation AddAccountViewModel

- (instancetype)initWithDatabase:(Database *)database
{
    self = [super init];
    if (!self) return  nil;
    
    RACSignal *accountNameSignal = RACObserve(self, accountName);
    RACSignal *valueSignal = RACObserve(self, value);
    
    _enableSignal = [RACSignal combineLatest:@[accountNameSignal, valueSignal] reduce:^NSNumber *(NSString *accountName, NSString *value){
        
        return @(accountName.length > 0 && value.length > 0);
    }];
    
    _createAccountSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSNumberFormatter *numberFormatter  = [[NSNumberFormatter alloc] init];
        NSNumber *valueNumber = [numberFormatter numberFromString:self.value];
        
        Account *account = [[Account alloc] initWithName:self.accountName value:valueNumber];
        RACDisposable *disposable = [[database addAccountSignal:account] subscribeNext:^(id x) {
            [subscriber sendNext:x];
        } error:^(NSError *error) {
            [subscriber sendError:error];
        } completed:^{
            [subscriber sendCompleted];
        }];
        
        return disposable;
    }];
    
    return self;
}
@end
