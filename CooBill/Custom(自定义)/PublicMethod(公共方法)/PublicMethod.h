//
//  PublicMethod.h
//  CooBill
//
//  Created by admin on 2017/5/23.
//  Copyright © 2017年 lkp. All rights reserved.
//

//公共方法添加的测试类，2017年08月04日11:16:14添加的！自己用来测试的！！！！

#import <Foundation/Foundation.h>

@interface PublicMethod : NSObject
//是否首字母开头
+ (BOOL)isFirstLetter:(NSString *)sender;

//返回可自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)name;

//获取当前系统语言
+ (NSString*)getPreferredLanguage;

+ (NSString *)currentDateWithFormat:(NSString *)format;

+ (NSString *)date:(NSString *)dateTime;

@end
