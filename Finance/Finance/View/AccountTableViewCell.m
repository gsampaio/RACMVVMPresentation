//
//  AccountTableViewCell.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "AccountTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AccountCellViewModel.h"

@interface AccountTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *accountName;
@end

@implementation AccountTableViewCell

- (void)awakeFromNib {
    self.accessibilityElements = @[self.accountName];
    RAC(self.accountName, text) = RACObserve(self, viewModel.accountString);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
