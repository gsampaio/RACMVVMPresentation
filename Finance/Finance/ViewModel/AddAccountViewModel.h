//
//  AddAccountViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "RVMViewModel.h"
#import <ReactiveViewModel/ReactiveViewModel.h>

@class RACCommand;
@class Database;
@interface AddAccountViewModel : RVMViewModel

@property (nonatomic, strong, readonly) NSString *accountName;
@property (nonatomic, strong, readonly) NSString *value;

@property (nonatomic, strong, readonly) RACSignal *enableSignal;
@property (nonatomic, strong, readonly) RACSignal *createAccountSignal;

- (instancetype)initWithDatabase:(Database *)database;
@end
