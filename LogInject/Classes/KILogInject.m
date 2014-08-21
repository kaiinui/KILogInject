#import "KILogInject.h"
#import <Aspects.h>
#import "NSInvocation+Simple.h"

@implementation KILogInject

+ (void)inspect:(SEL)selector of:(NSObject *)object {
    id insteadBlock = [self insteadBlock:selector];
    [object aspect_hookSelector:selector withOptions:AspectPositionInstead usingBlock:insteadBlock error:NULL];
}

+ (void)inspectInstanceMethod:(SEL)selector ofClass:(Class)klass {
    id insteadBlock = [self insteadBlock:selector];
    [klass aspect_hookSelector:selector withOptions:AspectPositionInstead usingBlock:insteadBlock error:NULL];
}

#pragma mark - Helpers

+ (id)insteadBlock:(SEL)selector {
    return ^(id<AspectInfo> aspectInfo) {
        [self logBeforeInvoke:aspectInfo ofSelector:selector];
        NSDate *start = [NSDate date];
        id result = [self invoke:aspectInfo.originalInvocation];
        NSTimeInterval milliInterval = [self intervalInMilliSecond:start];
        [self logAfterInvoke:aspectInfo ofSelector:selector withResult:result withInterval:milliInterval];
    };
}

+ (NSTimeInterval)intervalInMilliSecond:(NSDate *)startTime {
    return [startTime timeIntervalSinceNow] * -1000.0;
}

+ (id)invoke:(NSInvocation *)invocation {
    return [invocation invokeAndReturn]; // THANK YOU @kstenerud!
}

+ (void)logBeforeInvoke:(id<AspectInfo>)aspectInfo ofSelector:(SEL)selector {
    NSLog(@"\n%@ \u21E2 -%s%@", aspectInfo.instance, sel_getName(selector) , aspectInfo.arguments);
}

+ (void)logAfterInvoke:(id<AspectInfo>)aspectInfo ofSelector:(SEL)selector withResult:(id)result withInterval:(NSTimeInterval)milliInterval{
    NSLog(@"\n%@ \u21E0 -%s [%.2fms] = %@", aspectInfo.instance, sel_getName(selector) , milliInterval, result);
}

@end
