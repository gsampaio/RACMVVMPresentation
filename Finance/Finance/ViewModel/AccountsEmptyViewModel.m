//
//  AccountsEmptyViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/26/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "AccountsEmptyViewModel.h"

@implementation AccountsEmptyViewModel
- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    NSString *text;
    NSDictionary *attributes;
    
    // Title For Empty Data Set
    text = @"No Accounts";
    
    attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    _titleForEmptyDataSet = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
    // Description For Empty Data Set
    text = @"Click on the add button to create your first account.";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    _descriptionForEmptyDataSet = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
    // Button Title For Empty Data Set
    attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0]};
    
    _buttonTitleForEmptyDataSet = [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
    
    // Background Color
    _backgroundColor = [UIColor whiteColor];
    
    // Image
    _imageForEmptyDataSet = [UIImage imageNamed:@"wallet_icon"];
    
    return self;
}
@end
