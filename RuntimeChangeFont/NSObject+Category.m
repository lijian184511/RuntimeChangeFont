//
//  NSObject+Category.m
//  6666
//
//  Created by sword on 2021/2/21.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)

+ (void)runtimeReplaceFunctionWithSelector:(SEL)originselector      swizzleSelector:(SEL)swizzleSelector isClassMethod:(BOOL)isClassMethod
{
    Method originMethod;
    Method swizzleMethod;
    if (isClassMethod == YES) {
        originMethod = class_getClassMethod([self class], originselector);
        swizzleMethod = class_getClassMethod([self class], swizzleSelector);
    }else{
        originMethod = class_getInstanceMethod([self class], originselector);
        swizzleMethod = class_getInstanceMethod([self class], swizzleSelector);
    }
    method_exchangeImplementations(originMethod, swizzleMethod);
}


@end
