//
//  UIBarButtonItem+Category.h
//  CooBill
//
//  Created by admin on 2017/5/22.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义UIBarButtonItem
 */
@interface UIBarButtonItem (Category)
//返回带图片的
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

//返回带文字的,以及文字颜色
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor selectorColor:(UIColor *)selectorColor target:(id)target action:(SEL)action;

//返回带文字的
+ (UIBarButtonItem *)backItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
