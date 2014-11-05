//
//  EntryListEmptyViewModel.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import "EntryListEmptyViewModel.h"

@implementation EntryListEmptyViewModel
- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    NSString *text;
    NSDictionary *attributes;
    
    // Title For Empty Data Set
    text = @"No Entries";
    
    attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
                   NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    _titleForEmptyDataSet = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
    // Description For Empty Data Set
    text = @"Click on the add button to add your first entry.";
    
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
    _imageForEmptyDataSet = [UIImage imageNamed:@"money_icon"];
    
    return self;
}

@end
