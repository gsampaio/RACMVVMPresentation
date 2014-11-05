//
//  AddAccountViewController.h
//  Finance
//
//  Created by Guilherme Sampaio on 10/9/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Database;

@interface AddAccountViewController : UIViewController
@property (nonatomic, weak) Database *database;
@end
