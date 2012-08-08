//
//  LinkToMyAppManager.m
//  ipTest
//
//  Created by Vincent Daubry on 08/08/12.
//  Copyright (c) 2012 Vincent Daubry. All rights reserved.
//

#import "LinkToMyAppManager.h"

@implementation LinkToMyAppManager

@synthesize appID, linkToMyAppService;

- (id) init
{
	self = [super init];
	if (self != nil) {
        linkToMyAppService = [[LinkToMyAppService alloc] init];
	}
	return self;
}


- (void) dealloc
{
    [super dealloc];
}

#pragma mark - Utility methods

- (NSURL*) serverUrlWithPath:(NSString*)path {
    NSString *fullUrl = [NSString stringWithFormat:@"%@/%@", SERVER_URL, path];
    return [NSURL URLWithString:fullUrl];
}



#pragma mark -
#pragma mark App installation calls


- (void) sendAppInstalled {
    NSString *myRequestString = [NSString stringWithFormat:@"app_id=%@", self.appID];
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [self serverUrlWithPath:@"api/app_installed/"]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    
    [linkToMyAppService runConnectionWithRequest:request serviceBlock:^(NSString *responseStr) {
        [[NSUserDefaults standardUserDefaults] setObject:responseStr forKey:APP_LINK_ID_KEY];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:APP_INSTALLED_USER_DEFAULT_KEY];
    }];
}



#pragma mark - Public methods


- (void) setupWithAppId:(NSString*)_appID {
    self.appID = _appID;
    
    bool appAlreadyInstalled = [[NSUserDefaults standardUserDefaults] boolForKey:APP_INSTALLED_USER_DEFAULT_KEY];
    if(!appAlreadyInstalled) {
        [self sendAppInstalled];
    }
}

- (void) userSuscribedToAppId:(NSString*)appId {
    
}


#pragma mark -
#pragma mark Singleton

static LinkToMyAppManager *sharedManager;

+ (LinkToMyAppManager *)sharedManager {
	@synchronized(self) {
		if (sharedManager == nil) {
			sharedManager = [[self alloc] init];
		}
	}
	return sharedManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedManager == nil) {
			sharedManager = [super allocWithZone:zone];
			return sharedManager;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}

@end