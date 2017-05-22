//
//  UIBarButtonItem+Category.m
//  CooBill
//
//  Created by admin on 2017/5/22.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)
//返回带图片的
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action{
    //初始化
    UIButton *item = [[UIButton alloc]init];
    //设置图片
    [item setBackgroundImage:[UIImage resizedImage:image] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage resizedImage:highlightImage] forState:UIControlStateHighlighted];
    //设置大小
    CGSize size = item.currentBackgroundImage.size;
    item.frame = CGRectMake(0, 0, size.width, size.height);
//    item.frame = cgmake
    //添加点击事件
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:item];
}

//返回带文字的
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor selectorColor:(UIColor *)selectorColor target:(id)target action:(SEL)action{
    //初始化
    UIButton *item = [[UIButton alloc]init];
    //设置文字
    [item setTitle:title forState:UIControlStateNormal];
    //设置颜色
    if (normalColor) {
        [item setTitleColor:normalColor forState:UIControlStateNormal];
    }else{
        [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (selectorColor) {
        [item setTitleColor:selectorColor forState:UIControlStateHighlighted];
    }else{
        [item setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    
    //设置大小
    item.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    item.titleLabel.font=[UIFont systemFontOfSize:16];
//    CGSize size = [item.currentTitle sizeWithAttributes:@{NSFontAttributeName:item.titleLabel.font}];
//    item.size = CGSizeMake(size.width, size.height);
    //监听按钮点击
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //返回创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:item];
}

+ (UIBarButtonItem *)backItemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}
@end
