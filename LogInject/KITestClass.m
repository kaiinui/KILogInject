//
//  KITestClass.m
//  LogInject
//
//  Created by kaiinui on 2014/08/21.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KITestClass.h"

@implementation KITestClass

+ (NSString *)append:(NSString *)aString with:(NSString *)bString {
    return [NSString stringWithFormat:@"%@%@", aString, bString];
}

@end
