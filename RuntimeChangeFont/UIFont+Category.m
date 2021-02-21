//
//  UIFont+Category.m
//  6666
//
//  Created by sword on 2021/2/21.
//

#import "UIFont+Category.h"
#import "NSObject+Category.h"

@implementation UIFont (Category)

+ (void)load
{
    //交换systemFontOfSize: 方法
    [[self class] runtimeReplaceFunctionWithSelector:@selector(systemFontOfSize:) swizzleSelector:@selector(customSystemFontOfSize:) isClassMethod:YES];
    //交称fontWithName:size:方法
    [[self class] runtimeReplaceFunctionWithSelector:@selector(fontWithName:size:) swizzleSelector:@selector(customFontWithName:size:) isClassMethod:YES];
}

+ (UIFont *)customSystemFontOfSize:(CGFloat)fontSize
{
    CGFloat size = [UIFont transSizeWithFontSize:fontSize];
    return [UIFont customSystemFontOfSize:size];
}

+ (UIFont *)customFontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
    CGFloat size = [UIFont transSizeWithFontSize:fontSize];
    return [UIFont customFontWithName:fontName size:size];
}

///屏幕宽度大于320的，字体加10
+ (CGFloat)transSizeWithFontSize:(CGFloat)fontSize
{
    CGFloat size = fontSize;
    CGFloat width = [UIFont getWidth];
    if (width > 320) {
        size += 10;
    }
    return size;
}

///获取竖屏状态下的屏幕宽度
+ (CGFloat)getWidth
{
    for (UIScreen *windowsScenes in UIApplication.sharedApplication.connectedScenes) {
        UIWindowScene * scenes = (UIWindowScene *)windowsScenes;
        UIWindow *window = scenes.windows.firstObject;
        if (scenes.interfaceOrientation == UIInterfaceOrientationPortrait) {
            return window.frame.size.width;
        }
        return window.frame.size.height;
    }
    return 0;
}

@end
