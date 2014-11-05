//
//  AddEntryViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "RVMViewModel.h"

@class Account;

@interface AddEntryViewModel : RVMViewModel

@property (nonatomic, strong, readonly) Account *account;
@property (nonatomic, strong, readonly) NSString *entryName;
@property (nonatomic, strong, readonly) NSString *entryValue;

@property (nonatomic, strong, readonly) RACSignal *enableSignal;
@property (nonatomic, strong, readonly) RACSignal *createEntrySignal;

- (instancetype)initWithAccount:(Account *)account;



@end
