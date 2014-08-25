//
//  KINotificationObserver.h
//  LogInject
//
//  Created by kaiinui on 2014/08/25.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KINotificationObserver : NSObject

+ (instancetype)sharedInstance;

- (void)logNotification:(NSNotification *)notification;

@end
