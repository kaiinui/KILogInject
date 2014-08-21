#import "KILogInject.h"
#import <Aspects.h>

@implementation KILogInject

+ (void)inspect:(SEL)selector of:(NSObject *)object {
    id beforeBlock = ^(id<AspectInfo> aspectInfo) {
        NSLog(@"\n\u21E2 %s of %@ with %@", sel_getName(selector), aspectInfo.instance, aspectInfo.arguments);
    };
    id afterBlock = ^(id<AspectInfo> aspectInfo) {
        NSLog(@"\n\u21E0 %s of %@", sel_getName(selector), aspectInfo.instance);
    };
    [object aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:beforeBlock error:NULL];
    [object aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:afterBlock error:NULL];
}

+ (void)inspect:(SEL)selector ofClass:(Class)klass {
    NSError *error = nil;
    id beforeBlock = ^{
        NSLog(@"UMA!");
    };
    [klass aspect_hookSelector:selector withOptions:AspectPositionBefore usingBlock:beforeBlock error:&error];
}

+ (void)inspect:(SEL)selector ofInstanceMethods:(Class)klass {
    NSError *error = nil;
    id afterInit = ^(id<AspectInfo> aspectInfo) {
        NSLog(@"%@: %@", aspectInfo.instance, aspectInfo.arguments);
    };
    [klass aspect_hookSelector:@selector(init) withOptions:AspectPositionAfter usingBlock:afterInit error:&error];
    
}

@end
