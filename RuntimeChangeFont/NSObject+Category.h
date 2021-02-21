//
//  NSObject+Category.h
//  6666
//
//  Created by sword on 2021/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Category)

+ (void)runtimeReplaceFunctionWithSelector:(SEL)originselector      swizzleSelector:(SEL)swizzleSelector isClassMethod:(BOOL)isClassMethod;

@end

NS_ASSUME_NONNULL_END
