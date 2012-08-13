//
//  LinkToMyAppManager.h
//  LinkToMyApp
//
//  Created by Vincent Daubry on 08/08/12.
//  Copyright (c) 2012 Vincent Daubry. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "LinkToMyAppService.h"

//Local
#define SERVER_URL @"http://localhost:3000"

//Heroku
//#define SERVER_URL @"http://youboox-bi.herokuapp.com"

@interface LinkToMyAppManager : NSObject {
	NSString *appID;
    LinkToMyAppService *linkToMyAppService;
}

@property (nonatomic, retain) LinkToMyAppService *linkToMyAppService;
@property (nonatomic, retain) NSString *appID;

+ (LinkToMyAppManager *)sharedManager;

- (void) setupWithAppId:(NSString*)appId;
- (void) userSuscribedToApp;
- (void) userPurchasedInApp;

@end
