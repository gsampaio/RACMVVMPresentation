//
//  AddAccountTest.m
//  Finance
//
//  Created by Guilherme Sampaio on 10/11/14.
//  Copyright (c) 2014 Guilherme Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import <KIF/KIFTypist.h>
#import <Specta/Specta.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

SpecBegin(Application)

describe(@"Account Test", ^{
   
    describe(@"Add account", ^{
        it (@"should show add view controller when I tap the Add Button", ^{
            [tester waitForTimeInterval:0.5];
            [tester tapViewWithAccessibilityLabel:@"Add"];
            [tester waitForViewWithAccessibilityLabel:@"New Account"];
        });
        
        it (@"should have a disabled Done button", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beFalsy();
        });
        
        it (@"should have a text field to enter the account name", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"HSBC" intoViewWithAccessibilityLabel:@"Account Name"];
        });
        
        it (@"should still have a disabled Done button", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beFalsy();
        });
        
        it (@"should have a value field to enter the initial account value", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"10" intoViewWithAccessibilityLabel:@"Initial Value"];
        });
        
        it (@"should enabled Done button after the text being entered", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beTruthy();
        });
        
        it (@"should pop view controller after tapping the done button", ^{
            [tester tapViewWithAccessibilityLabel:@"Done"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"New Account"];
        });
        
        it (@"should have the added cell on the accounts view controller", ^{
            [tester waitForViewWithAccessibilityLabel:@"HSBC"];
        });
    });
    
    describe(@"Remove account", ^{
    
        it (@"should show delete button after swipe left", ^{
            [tester waitForTimeInterval:0.5];
            [tester swipeViewWithAccessibilityLabel:@"HSBC" inDirection:KIFSwipeDirectionLeft];
            [tester waitForViewWithAccessibilityLabel:@"Delete"];
        });
        
        it (@"should delete the row after pressing the delete button", ^{
            [tester tapViewWithAccessibilityLabel:@"Delete"];
            
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"HSBC"];

        });
        
    });
    
    describe(@"No Account", ^{
        it (@"should have a No Accounts label on the screen.", ^{
            [tester waitForViewWithAccessibilityLabel:@"No Accounts"];
        });
        
        it (@"should show add view controller when I tap the Continue button", ^{
            [tester tapViewWithAccessibilityLabel:@"Continue"];
            [tester waitForViewWithAccessibilityLabel:@"New Account"];
        });
        
        it (@"should have a text field to enter the account name", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"Itau" intoViewWithAccessibilityLabel:@"Account Name"];
        });
        
        it (@"should not save the account when pressed back", ^{
            [tester tapViewWithAccessibilityLabel:@"Accounts"];
            [tester waitForViewWithAccessibilityLabel:@"No Accounts"];
        });
        
    });
});

describe(@"Add Entry", ^{
    describe(@"Add account", ^{
        it (@"should show add view controller when I tap the Add Button", ^{
            [tester waitForTimeInterval:0.5];
            [tester tapViewWithAccessibilityLabel:@"Add"];
            [tester waitForViewWithAccessibilityLabel:@"New Account"];
        });
        
        it (@"should have a disabled Done button", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beFalsy();
        });
        
        it (@"should have a text field to enter the account name", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"Santander" intoViewWithAccessibilityLabel:@"Account Name"];
        });
        
        it (@"should still have a disabled Done button", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beFalsy();
        });
        
        it (@"should have a value field to enter the initial account value", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"1024" intoViewWithAccessibilityLabel:@"Initial Value"];
        });
        
        it (@"should enabled Done button after the text being entered", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beTruthy();
        });
        
        it (@"should pop view controller after tapping the done button", ^{
            [tester tapViewWithAccessibilityLabel:@"Done"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"New Account"];
        });
        
        it (@"should have the added cell on the accounts view controller", ^{
            [tester waitForViewWithAccessibilityLabel:@"Santander"];
        });
    });
    
    describe(@"Add Entry", ^{
        it (@"should show entries view controller when I tap the cell", ^{
            [tester waitForTimeInterval:0.5];
            [tester tapViewWithAccessibilityLabel:@"Santander"];
            [tester waitForViewWithAccessibilityLabel:@"Santander"];
        });
        
        it (@"should have a add button and a continue button", ^{
            [tester waitForViewWithAccessibilityLabel:@"Continue"];
            [tester waitForViewWithAccessibilityLabel:@"Add"];
            
        });
        
        it (@"should show add view controller when I tap the Add Button", ^{
            [tester waitForTimeInterval:0.5];
            [tester tapViewWithAccessibilityLabel:@"Add"];
            [tester waitForViewWithAccessibilityLabel:@"New Entry"];
        });
        
        it (@"should still have a disabled Done button", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beFalsy();
        });
        
        it (@"should have a text field to enter the account name", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"Banana" intoViewWithAccessibilityLabel:@"Entry Name"];
        });
        
        it (@"should still have a disabled Done button", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beFalsy();
        });
        
        it (@"should have a value field to enter the initial account value", ^{
            [tester waitForTimeInterval:0.5];
            [tester enterText:@"1" intoViewWithAccessibilityLabel:@"Value"];
        });
        
        it (@"should enabled Done button after the text being entered", ^{
            UIButton *doneButton = (UIButton *) [tester waitForViewWithAccessibilityLabel:@"Done"];
            expect(doneButton.enabled).to.beTruthy();
        });
        
        it (@"should pop view controller after tapping the done button", ^{
            [tester tapViewWithAccessibilityLabel:@"Done"];
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"New Entry"];
        });
        
        it (@"should have the added cell on the accounts view controller", ^{
            [tester waitForViewWithAccessibilityLabel:@"Banana"];
            [tester waitForViewWithAccessibilityLabel:@"1"];
        });
        
        it (@"should not have the continue button", ^{
            [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Continue"];
        });
    });
});

SpecEnd
