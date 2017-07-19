//
//  PublicMethod.h
//  CooBill
//
//  Created by admin on 2017/5/23.
//  Copyright © 2017年 lkp. All rights reserved.
//

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

+ (void)sadaasdas;
@end
