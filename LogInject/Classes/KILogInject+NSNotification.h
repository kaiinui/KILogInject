//
//  KILogInject+NSNotification.h
//  LogInject
//
//  Created by kaiinui on 2014/08/25.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KILogInject.h"

@interface KILogInject (NSNotification)

+ (void)notification:(NSString *)name;
+ (void)notification:(NSString *)name from:(id)sender;

@end
