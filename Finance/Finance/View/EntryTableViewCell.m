//
//  EntryTableViewCell.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "EntryTableViewCell.h"
#import "EntryViewModel.h"

@interface EntryTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation EntryTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.accessibilityElements = @[self.nameLabel, self.valueLabel];
    RAC(self.nameLabel, text) = RACObserve(self, viewModel.entryName);
    RAC(self.valueLabel, text) = RACObserve(self, viewModel.entryValue);
}

@end
