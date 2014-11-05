//
//  AddAccountViewController.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AddAccountViewController.h"
#import "AddAccountViewModel.h"

@interface AddAccountViewController ()
@property (nonatomic, strong) AddAccountViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *accountNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *intialValueTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.viewModel = [[AddAccountViewModel alloc] initWithDatabase:self.database];
    
    RAC(self.viewModel, accountName) = self.accountNameTextField.rac_textSignal;
    RAC(self.viewModel, value) = self.intialValueTextField.rac_textSignal;
    
    self.doneButton.rac_command = [[RACCommand alloc] initWithEnabled:self.viewModel.enableSignal signalBlock:^RACSignal *(id input) {
        return self.viewModel.createAccountSignal;
    }];
    
    [self.doneButton.rac_command.executionSignals subscribeNext:^(RACSignal *signal) {
        
        [signal subscribeError:^(NSError *error) {
            NSLog(@"ERROR :(");
        } completed:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.accountNameTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.accountNameTextField resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

@end
