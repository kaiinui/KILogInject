//
//  KIKeyValueObserver.m
//  LogInject
//
//  Created by kaiinui on 2014/08/28.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIKeyValueObserver.h"
#import <FBKVOController.h>

@implementation KIKeyValueObserver

+ (instancetype)sharedInstance {
    static KIKeyValueObserver *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KIKeyValueObserver alloc] init];
        _instance.kvo = [FBKVOController controllerWithObserver:_instance];
    });
    return _instance;
}

@end
