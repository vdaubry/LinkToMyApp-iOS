//
//  LinkToMyAppService.m
//  ipTest
//
//  Created by Vincent Daubry on 07/08/12.
//  Copyright (c) 2012 Vincent Daubry. All rights reserved.
//

#import "LinkToMyAppService.h"

@implementation LinkToMyAppService

@synthesize receivedData, serviceSuccesBlock;

- (void) runConnectionWithRequest:(NSMutableURLRequest*)request serviceBlock:(OnServiceSuccesBlock)serviceBlock {
    self.serviceSuccesBlock = serviceBlock;
    [NSURLConnection connectionWithRequest:request delegate:self];
    self.receivedData = [NSMutableData data];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self performSelector:@selector(waitForCallEnd) withObject:nil afterDelay:0.1];
}

- (void) waitForCallEnd {
    NSString *responseStr = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    self.serviceSuccesBlock(responseStr);
}


@end
