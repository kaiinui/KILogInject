#import "NSObject+PropertyArray.h"
#import <objc/runtime.h>

@implementation NSObject (PropertyArray)

// The implementation derived from StackOverflow.
// @see http://stackoverflow.com/questions/830673/instantiating-custom-class-from-nsdictionary
- (NSArray *)allKeys {
    Class clazz = [self class];
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++) {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject:[NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
    }
    free(properties);
    
    return [NSArray arrayWithArray:propertyArray];
}

@end
