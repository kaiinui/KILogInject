#import <Foundation/Foundation.h>

@interface KILogInject : NSObject

+ (void)inspect:(SEL)selector of:(NSObject *)object;
+ (void)inspectInstanceMethod:(SEL)selector ofClass:(Class)klass;

@end
