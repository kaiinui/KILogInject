//
//  KINotificationObserver.m
//  LogInject
//
//  Created by kaiinui on 2014/08/25.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KINotificationObserver.h"

@implementation KINotificationObserver

+ (instancetype)sharedInstance {
    static KINotificationObserver *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KINotificationObserver alloc] init];
    });
    return _instance;
}

- (void)logNotification:(NSNotification *)notification {
    NSLog(@"NSNotification<%@> from %@", notification.name, notification.object);
}

@end
