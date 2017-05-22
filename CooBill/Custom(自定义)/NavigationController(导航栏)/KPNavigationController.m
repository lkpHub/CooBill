//
//  KPNavigationController.m
//  CooBill
//
//  Created by admin on 2017/5/18.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "KPNavigationController.h"

@interface KPNavigationController ()

@end

@implementation KPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置颜色渐变
    [self.navigationBar.layer insertSublayer:[self gradientLayer] atIndex:0];
}

+ (void)initialize{
    
    //获取bar
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置字体颜色
    [bar setTintColor:[UIColor whiteColor]];
    //设置返回样式
    bar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_back"];
    bar.backIndicatorImage = [UIImage imageNamed:@"nav_back"];
    
    //去掉导航栏底部的线
    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[UIImage new]];
    
    //设置文字样式
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:attrs];
    
}

#pragma mark - 设置渐变颜色
- (CAGradientLayer *)gradientLayer{
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc]init];
    // CGColor是无法放入数组中的，必须要转型
    gradientLayer.colors = @[
                             (__bridge id)[UIColor colorWithRed:78 / 255.0 green:143 / 255.0 blue:1.0 alpha:1.0].CGColor,
                             (__bridge id)[UIColor colorWithRed:39 / 255.0 green:196 / 255.0 blue:254 / 255.0 alpha:1.0].CGColor,
                             (__bridge id)[UIColor colorWithRed:60 / 255.0 green:143 / 255.0 blue:1.0 alpha:1.0].CGColor,
                             ];
    //设置颜色分割线
    gradientLayer.locations = @[@0,@0.7,@1.5];
    // 颜色渐变的起点和终点，范围为 (0~1.0, 0~1.0)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, -20, self.navigationBar.bounds.size.width, 20 + self.navigationBar.bounds.size.height);
    return gradientLayer;
}

#pragma mark - pushView
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count) {
        //跳转其他界面时候隐藏TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    viewController.navigationItem.backBarButtonItem = [UIBarButtonItem backItemWithTitle:@"" target:nil action:nil];
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
