//
//  UIImage+Category.h
//  CooBill
//
//  Created by admin on 2017/5/22.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 调整图片的大小

 @param name 图片名称
 @return 返回调整好的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
@end
