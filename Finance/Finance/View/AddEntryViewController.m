//
//  AddEntryViewController.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AddEntryViewController.h"
#import "AddEntryViewModel.h"

@interface AddEntryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *entryValueLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddEntryViewController
- (void)viewDidLoad {
    RAC(self.viewModel, entryName) = self.entryNameLabel.rac_textSignal;
    RAC(self.viewModel, entryValue) = self.entryValueLabel.rac_textSignal;
    
    self.doneButton.rac_command = [[RACCommand alloc] initWithEnabled:self.viewModel.enableSignal signalBlock:^RACSignal *(id input) {
        return self.viewModel.createEntrySignal;
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
    [self.entryNameLabel becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.entryNameLabel resignFirstResponder];
    [self.entryValueLabel resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

@end
