//
//  AccountsViewController.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AccountsViewController.h"
#import "AccountsViewModel.h"
#import "AccountCellViewModel.h"

#import "AddAccountViewController.h"
#import "AccountTableViewCell.h"
#import "AccountsEmptyViewModel.h"

#import "EntryListViewController.h"
#import "ENtryListViewModel.h"

#import "UIScrollView+EmptyDataSet.h"

@interface AccountsViewController () <DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>
@end

@implementation AccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    // Subscribe for view models changes
    [RACObserve(self.viewModel, accountViewModels) subscribeNext:^(id value){
        [self.tableView reloadData];
    }];
    
    [[self rac_signalForSelector:@selector(prepareForSegue:sender:)] subscribeNext:^(RACTuple *tuple) {
        UIStoryboardSegue *segue = [tuple first];
        if ([segue.identifier isEqualToString:@"AddAccount"]) {
            AddAccountViewController *addAccontViewController = segue.destinationViewController;
            addAccontViewController.database = self.viewModel.database;
        } else {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:[tuple second]];
            AccountCellViewModel *accountCellViewModel = self.viewModel.accountViewModels[indexPath.row];
            EntryListViewController *entryListViewController = segue.destinationViewController;
            entryListViewController.viewModel = [[EntryListViewModel alloc] initWithAccount:accountCellViewModel.account];
        }
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.accountViewModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accountCell"];
    cell.viewModel = self.viewModel.accountViewModels[indexPath.row];
    
    return cell;
}

#pragma mark Table View Delegate 
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.viewModel deleteAccountViewModel:self.viewModel.accountViewModels[indexPath.row]];
    }
}

#pragma mark Empty table view data set data source
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return self.viewModel.emptyViewModel.titleForEmptyDataSet;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    return self.viewModel.emptyViewModel.descriptionForEmptyDataSet;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.viewModel.emptyViewModel.backgroundColor;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return self.viewModel.emptyViewModel.buttonTitleForEmptyDataSet;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.viewModel.emptyViewModel.imageForEmptyDataSet;
}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
    [self performSegueWithIdentifier:@"AddAccount" sender:self];
}

@end
