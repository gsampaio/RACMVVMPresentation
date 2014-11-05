//
//  EntryListViewController.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/28/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "EntryListViewController.h"
#import "UIScrollView+EmptyDataSet.h"

#import "EntryListViewModel.h"
#import "EntryTableViewCell.h"
#import "EntryListEmptyViewModel.h"

#import "AddEntryViewController.h"
#import "AddEntryViewModel.h"

@interface EntryListViewController ()<DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

@end

@implementation EntryListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.viewModel.title;
    
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    // Subscribe for view models changes
    [RACObserve(self.viewModel, entryViewModels) subscribeNext:^(id value){
        [self.tableView reloadData];
    }];
    
    [[self rac_signalForSelector:@selector(prepareForSegue:sender:)] subscribeNext:^(RACTuple *tuple) {
        UIStoryboardSegue *segue = [tuple first];
        
        AddEntryViewController *addEntryViewController = segue.destinationViewController;
        
        AddEntryViewModel *addEntryViewModel = [[AddEntryViewModel alloc] initWithAccount:self.viewModel.account];
        addEntryViewController.viewModel = addEntryViewModel;
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.entryViewModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell"];
    cell.viewModel = self.viewModel.entryViewModels[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.viewModel deleteAccountViewModel:self.viewModel.accountViewModels[indexPath.row]];
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
    [self performSegueWithIdentifier:@"add account" sender:self];
}

@end
