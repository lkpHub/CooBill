//
//  AppDelegate.h
//  CooBill
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 跳转到登陆界面
 */
- (void)gotoLoginView;

/**
 跳转到主界面
 */
- (void)gotoMainView;
@end

