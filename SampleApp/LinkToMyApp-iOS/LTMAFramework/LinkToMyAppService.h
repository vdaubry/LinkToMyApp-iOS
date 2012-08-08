//
//  LinkToMyAppManager.h
//  LinkToMyApp
//
//  Created by Vincent Daubry on 08/08/12.
//  Copyright (c) 2012 Vincent Daubry. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APP_INSTALLED_USER_DEFAULT_KEY  @"LINK_TO_MY_APP_INSTALLED_USER_DEFAULT_KEY"
#define APP_LINK_ID_KEY  @"APP_LINK_ID_KEY"

typedef void (^OnServiceSuccesBlock)(NSString* responseStr);

@interface LinkToMyAppService : NSObject {
    NSMutableData *receivedData;
    OnServiceSuccesBlock serviceSuccesBlock;
}

@property (nonatomic, copy) OnServiceSuccesBlock serviceSuccesBlock;
@property (nonatomic, retain) NSMutableData *receivedData;

- (void) runConnectionWithRequest:(NSMutableURLRequest*)request serviceBlock:(OnServiceSuccesBlock)serviceBlock;

@end
