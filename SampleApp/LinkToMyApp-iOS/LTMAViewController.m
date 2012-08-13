//
//  LTMAViewController.m
//  LinkToMyApp-iOS
//
//  Created by Vincent Daubry on 08/08/12.
//  Copyright (c) 2012 Vincent Daubry. All rights reserved.
//

#import "LTMAViewController.h"
#import "LinkToMyApp.h"

@interface LTMAViewController ()

@end

@implementation LTMAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - User actions

- (IBAction) userDidCreateAccount:(id)sender {
    [[LinkToMyAppManager sharedManager] userSuscribedToApp];
}


- (IBAction) userDidBuySomething:(id)sender {
    [[LinkToMyAppManager sharedManager] userPurchasedInApp];
}

@end
