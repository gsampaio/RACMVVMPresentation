//
//  EntryListViewController.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EntryListViewModel;

@interface EntryListViewController : UITableViewController
@property (nonatomic, strong) EntryListViewModel *viewModel;

@end
