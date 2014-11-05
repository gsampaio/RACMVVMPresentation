//
//  AddEntryViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AddEntryViewModel.h"
#import "Entry.h"
#import "Account.h"

@implementation AddEntryViewModel
- (instancetype)initWithAccount:(Account *)account {
    self = [super init];
    if (!self) return nil;
    
    _account = account;
    
    RACSignal *entryNameSignal = RACObserve(self, entryName);
    RACSignal *entryValueSignal = RACObserve(self, entryValue);
    
    _enableSignal = [RACSignal combineLatest:@[entryNameSignal, entryValueSignal] reduce:^NSNumber *(NSString *entryName, NSString *entryValue){
        return @(entryName.length > 0 && entryValue.length > 0);
    }];
    
    _createEntrySignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSNumberFormatter *numberFormatter  = [[NSNumberFormatter alloc] init];

        NSNumber *valueNumber = [numberFormatter numberFromString:self.entryValue];
        
        Entry *entry = [[Entry alloc] initWithName:self.entryName value:valueNumber];
        [self.account addEntry:entry];
        
        [subscriber sendCompleted];
        
        return nil;
    }];
    
    return self;
}
@end
