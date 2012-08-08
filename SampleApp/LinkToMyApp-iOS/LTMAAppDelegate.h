//
//  LTMAAppDelegate.h
//  LinkToMyApp-iOS
//
//  Created by Vincent Daubry on 08/08/12.
//  Copyright (c) 2012 Vincent Daubry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTMAViewController;

@interface LTMAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LTMAViewController *viewController;

@end
