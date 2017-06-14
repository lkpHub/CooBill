//
//  PublicMethod.m
//  CooBill
//
//  Created by admin on 2017/5/23.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "PublicMethod.h"

@implementation PublicMethod

#pragma mark 是否首字母开头
+ (BOOL)isFirstLetter:(NSString *)sender{
    
    NSString *letter = @"^[A-Za-z]+$";
    NSPredicate *regexFirstLetter = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",letter];
    return [regexFirstLetter evaluateWithObject:[sender substringToIndex:1]];
}

#pragma mark 返回可自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

#pragma mark 获取当前系统语言
+ (NSString*)getPreferredLanguage
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defs objectForKey:@"AppleLanguages"];
    NSString *preferredLang = [languages objectAtIndex:0];
    return preferredLang;
}

#pragma mark 获取当前时间
//format: @"yyyy-MM-dd HH:mm:ss"或者@"yyyy年MM月dd日 HH时mm分ss秒"
+ (NSString *)currentDateWithFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:[NSDate date]];
}

#define TIME_Formatter @"yyyy-MM-dd HH:mm:ss"
+ (NSString *)date:(NSString *)dateTime{
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:[dateTime longLongValue]/1000.0];
    NSDateFormatter *dateformat = [[NSDateFormatter  alloc]init];
    [dateformat setDateFormat:TIME_Formatter];
    
    return [dateformat stringFromDate:date];
}

@end
