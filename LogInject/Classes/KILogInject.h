#import <Foundation/Foundation.h>

@interface KILogInject : NSObject

+ (void)inspect:(SEL)selector of:(NSObject *)object;
+ (void)inspect:(SEL)selector ofClass:(Class)klass;
+ (void)inspect:(SEL)selector ofInstanceMethods:(Class)klass;

@end
