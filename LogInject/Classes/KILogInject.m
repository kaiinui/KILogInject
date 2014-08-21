#import "KILogInject.h"
#import <Aspects.h>

@implementation KILogInject

+ (void)inspect:(SEL)selector of:(NSObject *)object {
    id beforeBlock = [self beforeBlock:selector];
    id afterBlock = [self afterBlock:selector];
    [object aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:beforeBlock error:NULL];
    [object aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:afterBlock error:NULL];
}

+ (void)inspectInstanceMethod:(SEL)selector ofClass:(Class)klass {
    id insteadBlock = ^(id<AspectInfo> aspectInfo) {
        [self logBeforeInvoke:aspectInfo ofSelector:selector];
        NSDate *start = [NSDate date];
        void *result = [self invoke:aspectInfo.originalInvocation];
        NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"\n\u21E0 %@ %@ in %.5f s", result ,[self methodDescription:aspectInfo withSelector:selector], interval);
    };
    [klass aspect_hookSelector:selector withOptions:AspectPositionInstead usingBlock:insteadBlock error:NULL];
}

#pragma mark - Helpers

+ (void *)invoke:(NSInvocation *)invocation {
    [invocation invoke];
    NSUInteger length = [[invocation methodSignature] methodReturnLength];
    void *result = (void *)malloc(length);
    [invocation getReturnValue:&result];
    return result;
}

+ (NSString *)methodDescription:(id<AspectInfo>)aspectInfo withSelector:(SEL)selector {
    return [NSString stringWithFormat:@"%@-%s", aspectInfo.instance, sel_getName(selector)];
}

+ (id)beforeBlock:(SEL)selector {
    return ^(id<AspectInfo> aspectInfo) {
        [self logBeforeInvoke:aspectInfo ofSelector:selector];
    };
}

+ (id)afterBlock:(SEL)selector {
    return ^(id<AspectInfo> aspectInfo) {
        [self logAfterInvoke:aspectInfo ofSelector:selector];
    };
}

+ (void)logBeforeInvoke:(id<AspectInfo>)aspectInfo ofSelector:(SEL)selector {
    NSLog(@"\n\u21E2 %@ with %@", [self methodDescription:aspectInfo withSelector:selector], aspectInfo.arguments);
}

+ (void)logAfterInvoke:(id<AspectInfo>)aspectInfo ofSelector:(SEL)selector{
    NSLog(@"\n\u21E0 %@", [self methodDescription:aspectInfo withSelector:selector]); // WANT INSPECT RETURN VALUE!
}

@end
