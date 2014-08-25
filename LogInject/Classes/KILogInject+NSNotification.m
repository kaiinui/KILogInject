//
//  KILogInject+NSNotification.m
//  LogInject
//
//  Created by kaiinui on 2014/08/25.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KILogInject+NSNotification.h"
#import "KINotificationObserver.h"

@implementation KILogInject (NSNotification)

+ (void)notification:(NSString *)name from:(id)sender {
    [[NSNotificationCenter defaultCenter] addObserver:[KINotificationObserver sharedInstance] selector:@selector(logNotification:) name:name object:sender];
}

@end
