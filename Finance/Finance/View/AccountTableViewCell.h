//
//  AccountTableViewCell.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccountCellViewModel;
@interface AccountTableViewCell : UITableViewCell
@property (nonatomic, strong) AccountCellViewModel *viewModel;
@end
