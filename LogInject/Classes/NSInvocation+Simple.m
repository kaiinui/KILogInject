//
//  NSInvocation+Simple.m
//  Objective-Gems
//
//  Created by Karl Stenerud on 4/20/11.
//  Copyright 2011 KarlStenerud. All rights reserved.
//

#import "NSInvocation+Simple.h"

@implementation NSInvocation (Simple)

+ (NSInvocation*) invocationWithTarget:(id) target selector:(SEL) selector
{
    NSMethodSignature* signature = [[target class] instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [self invocationWithMethodSignature:signature];
    [invocation setTarget:target];
    [invocation setSelector:selector];
    
    return invocation;
}

- (id) invokeAndReturn
{
    [self invoke];
    
    const char* returnType = [[self methodSignature] methodReturnType];
    if(0 == strcmp(returnType, @encode(id)))
    {
        NSUInteger length = [[self methodSignature] methodReturnLength];
        NSMutableData * dat = [NSMutableData dataWithLength:length];
        void * buffer = [dat mutableBytes];
        [self getReturnValue:&buffer];
        return (__bridge id)(buffer);
    }
    else if(0 == strcmp(returnType, @encode(void)))
    {
        return nil;
    }
    else if(0 == strcmp(returnType, @encode(BOOL)))
    {
        BOOL result;
        [self getReturnValue:&result];
        return [NSNumber numberWithBool:result];
    }
    else if(0 == strcmp(returnType, @encode(bool)))
    {
        bool result;
        [self getReturnValue:&result];
        return [NSNumber numberWithBool:result];
    }
    else if(0 == strcmp(returnType, @encode(char)))
    {
        char result;
        [self getReturnValue:&result];
        return [NSNumber numberWithInt:result];
    }
    else if(0 == strcmp(returnType, @encode(short)))
    {
        short result;
        [self getReturnValue:&result];
        return [NSNumber numberWithInt:result];
    }
    else if(0 == strcmp(returnType, @encode(int)))
    {
        int result;
        [self getReturnValue:&result];
        return [NSNumber numberWithInt:result];
    }
    else if(0 == strcmp(returnType, @encode(long)))
    {
        long result;
        [self getReturnValue:&result];
        return [NSNumber numberWithLong:result];
    }
    else if(0 == strcmp(returnType, @encode(long long)))
    {
        long long result;
        [self getReturnValue:&result];
        return [NSNumber numberWithLongLong:result];
    }
    else if(0 == strcmp(returnType, @encode(unsigned char)))
    {
        unsigned char result;
        [self getReturnValue:&result];
        return [NSNumber numberWithUnsignedInt:result];
    }
    else if(0 == strcmp(returnType, @encode(unsigned short)))
    {
        unsigned short result;
        [self getReturnValue:&result];
        return [NSNumber numberWithUnsignedInt:result];
    }
    else if(0 == strcmp(returnType, @encode(unsigned int)))
    {
        unsigned int result;
        [self getReturnValue:&result];
        return [NSNumber numberWithUnsignedInt:result];
    }
    else if(0 == strcmp(returnType, @encode(unsigned long)))
    {
        unsigned long result;
        [self getReturnValue:&result];
        return [NSNumber numberWithUnsignedLong:result];
    }
    else if(0 == strcmp(returnType, @encode(unsigned long long)))
    {
        unsigned long long result;
        [self getReturnValue:&result];
        return [NSNumber numberWithUnsignedLongLong:result];
    }
    else if(0 == strcmp(returnType, @encode(float)))
    {
        float result;
        [self getReturnValue:&result];
        return [NSNumber numberWithFloat:result];
    }
    else if(0 == strcmp(returnType, @encode(double)))
    {
        double result;
        [self getReturnValue:&result];
        return [NSNumber numberWithDouble:result];
    }
    return nil;
}

- (id) invokeWithObject:(id) object
{
    [self setArgument:&object atIndex:2];
    return [self invokeAndReturn];
}

- (id) invokeWithObject:(id) object withObject:(id) object2
{
    [self setArgument:&object atIndex:2];
    [self setArgument:&object2 atIndex:3];
    return [self invokeAndReturn];
}

@end