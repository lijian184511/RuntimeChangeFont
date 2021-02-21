//
//  UIButton+Category.m
//  6666
//
//  Created by sword on 2021/2/21.
//

#import "UIButton+Category.h"
#import "NSObject+Category.h"

@implementation UIButton (Category)

+ (void)load
{
    [[self class] runtimeReplaceFunctionWithSelector:@selector(initWithCoder:) swizzleSelector:@selector(customInitWithCoder:) isClassMethod:NO];
}

- (instancetype)customInitWithCoder:(NSCoder *)coder
{
    if ([self customInitWithCoder:coder]) {
        if (self.titleLabel != nil) {
            self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.familyName size:self.titleLabel.font.pointSize];
        }
    }
    return self;
}

@end
