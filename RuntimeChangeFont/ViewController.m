//
//  ViewController.m
//  RuntimeChangeFont
//
//  Created by sword on 2021/2/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 100, 50)];
    label.text = @"自己创建的label";
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = UIColor.blackColor;
    [self.view addSubview:label];
    [label sizeToFit];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 400, 100, 50);
    [button setTitle:@"代码创建的button" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button sizeToFit];
}


@end
