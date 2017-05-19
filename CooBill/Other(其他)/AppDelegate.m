//
//  AppDelegate.m
//  CooBill
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "PasswordLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //配置界面逻辑
    [self setInterFaceView];
    
    return YES;
}

#pragma mark - 配置界面逻辑
- (void)setInterFaceView{
    
    //当前版本号
    NSString *currentVersion = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    //判断版本号(为nil，或者不为当前版本)
    if ([userDefault objectForKey:kAppVersion] == nil || ![[userDefault stringForKey:kAppVersion] isEqualToString:currentVersion]) {
        
        KPLog(@"出现启动图");
        //保存版本号
        [userDefault setValue:currentVersion forKey:kAppVersion];
        [userDefault synchronize];
        //进入引导界面
        [self gotoLoginView];
    }else{
        KPLog(@"不出现启动图片");
        //是否自动登录
        if ([userDefault objectForKey:kTelNo]) {
            //有密码跳转到主界面
        }else{
            //没有密码，跳转到登陆界面
            [self gotoLoginView];
        }
    }
}

#pragma mark - 跳转到登陆界面
- (void)gotoLoginView{
    
    PasswordLoginViewController *loginVc = [[PasswordLoginViewController alloc]init];
    self.window.rootViewController = loginVc;
}

#pragma mark - 跳转到主界面
- (void)gotoMainView{
    
    MainViewController *mainVc = [[MainViewController alloc]init];
    KPNavigationController *nav = [[KPNavigationController alloc]initWithRootViewController:mainVc];
    self.window.rootViewController = nav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
