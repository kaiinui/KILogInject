#import "KILogInject.h"
#import <Aspects.h>

@implementation KILogInject

+ (void)inspect:(SEL)selector of:(NSObject *)object {
    id beforeBlock = [self beforeBlock];
    id afterBlock = [self afterBlock];
    [object aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:beforeBlock error:NULL];
    [object aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:afterBlock error:NULL];
}

+ (void)inspectInstanceMethod:(SEL)selector ofClass:(Class)klass {
    id beforeBlock = [self beforeBlock];
    id afterBlock = [self afterBlock];
    [klass aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:beforeBlock error:NULL];
    [klass aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:afterBlock error:NULL];
}

#pragma mark - Helpers

+ (NSString *)methodDescription:(id<AspectInfo>)aspectInfo {
    return [NSString stringWithFormat:@"%@-%s", aspectInfo.instance, sel_getName(aspectInfo.originalInvocation.selector)];
}

+ (id)beforeBlock {
    return ^(id<AspectInfo> aspectInfo) {
        [self logBeforeInvoke:aspectInfo];
    };
}

+ (id)afterBlock {
    return ^(id<AspectInfo> aspectInfo) {
        [self logAfterInvoke:aspectInfo];
    };
}

+ (void)logBeforeInvoke:(id<AspectInfo>)aspectInfo {
    NSLog(@"\n\u21E2 %@ with %@", [self methodDescription:aspectInfo], aspectInfo.arguments);
}

+ (void)logAfterInvoke:(id<AspectInfo>)aspectInfo {
    NSLog(@"\n\u21E0 %@", [self methodDescription:aspectInfo]); // WANT INSPECT RETURN VALUE!
}

@end
