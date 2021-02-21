//
//  UITextView+Category.m
//  6666
//
//  Created by sword on 2021/2/21.
//

#import "UITextView+Category.h"
#import "NSObject+Category.h"

@implementation UITextView (Category)

+ (void)load
{
    [[self class] runtimeReplaceFunctionWithSelector:@selector(initWithCoder:) swizzleSelector:@selector(customInitWithCoder:) isClassMethod:NO];
}

- (instancetype)customInitWithCoder:(NSCoder *)coder
{
    if ([self customInitWithCoder:coder]) {
        self.font = [UIFont fontWithName:self.font.familyName size:self.font.pointSize];
    }
    return self;
}

@end
