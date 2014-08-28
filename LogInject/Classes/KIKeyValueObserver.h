//
//  KIKeyValueObserver.h
//  LogInject
//
//  Created by kaiinui on 2014/08/28.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBKVOController;

@interface KIKeyValueObserver : NSObject

@property FBKVOController *kvo;

+ (instancetype)sharedInstance;

@end
