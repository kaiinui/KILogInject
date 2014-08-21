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
    id beforeBlock = [self beforeBlock:selector];
    id afterBlock = [self afterBlock:selector];
    [klass aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:beforeBlock error:NULL];
    [klass aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:afterBlock error:NULL];
}

#pragma mark - Helpers

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
