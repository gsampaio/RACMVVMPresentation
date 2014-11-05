//
//  AccountsEmptyViewModel.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/26/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "RVMViewModel.h"
#import <UIKit/UIKit.h>

@interface AccountsEmptyViewModel : RVMViewModel
@property (nonatomic, strong, readonly) NSAttributedString *titleForEmptyDataSet;
@property (nonatomic, strong, readonly) NSAttributedString *descriptionForEmptyDataSet;
@property (nonatomic, strong, readonly) NSAttributedString *buttonTitleForEmptyDataSet;
@property (nonatomic, strong, readonly) UIColor *backgroundColor;
@property (nonatomic, strong, readonly) UIImage *imageForEmptyDataSet;

@end
