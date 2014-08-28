//
//  KILogInject+Properties.m
//  LogInject
//
//  Created by kaiinui on 2014/08/28.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KILogInject+Properties.h"
#import "NSObject+PropertyArray.h"

@implementation KILogInject (Properties)

+ (void)properties:(NSObject *)object {
    for (NSString *key in [object allKeys]) {
        NSLog(@"%@", key);
    }
}

@end
