//
//  MacroHeader.h
//  CooBill
//
//  Created by admin on 2017/5/5.
//  Copyright © 2017年 lkp. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h


#endif /* MacroHeader_h */
//常用的宏定义

#pragma mark - 颜色
//三原色
#define RGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 字体颜色16进制0x
#define GmColorWith0xColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - 位置
//设备物理宽度宽高
#define KPHeight ([UIScreen mainScreen].bounds.size.height)
#define KPWidth ([UIScreen mainScreen].bounds.size.width)

// 界面宽高度
#define KPScreenViewWidth self.view.frame.size.width
#define KPScreenViewHeight self.view.frame.size.height

//分割线高度
#define lineH 1
//输入栏左视图宽度
#define ViewLeftW 80

// 系统delegate
#define KPAppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate

//验证码重发时间
#define CodeTimerNum 60

#pragma mark - 其他信息
//APP版本
#define kAppVersion         @"appVersion"
//设备号
#define kDeviceId           @"deviceId"
//账号
#define kTelNo              @"telNo"
