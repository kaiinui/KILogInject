//
//  KILogInject+Properties.m
//  LogInject
//
//  Created by kaiinui on 2014/08/28.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KILogInject+Properties.h"
#import "NSObject+PropertyArray.h"
#import "KIKeyValueObserver.h"
#import <FBKVOController.h>
#import <Aspects.h>

@implementation KILogInject (Properties)

+ (void)properties:(NSObject *)object {
    for (NSString *key in [object allKeys]) {
        [self observeKeyPath:key ofObject:object];
    }
}

# pragma mark - Helpers

+ (void)observeKeyPath:(NSString *)keyPath ofObject:(NSObject *)object {
    [[[KIKeyValueObserver sharedInstance] kvo] observe:object
                                               keyPath:keyPath
                                               options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                                                 block:^(id observer, id object, NSDictionary *change) {
                                                     [self logChange:change ofObject:object ofKeyPath:keyPath];
                                                 }];
}

+ (void)logChange:(NSDictionary *)change ofObject:(id)object ofKeyPath:(NSString *)keyPath {
    id old = change[NSKeyValueChangeOldKey];
    id new = change[NSKeyValueChangeNewKey];
    NSLog(@"\n\u27A0 %@.%@ = %@ \u21E6 %@", object, keyPath, new, old);
}

@end
