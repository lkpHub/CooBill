#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//默认显示时间
#define DEFAULT_DISPLAY_DURATION 1.0f
//背景颜色
#define ToastBackGroundColor [[UIColor colorWithWhite:0.4 alpha:1] colorWithAlphaComponent:0.75];
//字体颜色
#define ToastTextColor [UIColor whiteColor] 

@interface SHToast : NSObject {
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
}

+ (void)showWithText:(NSString *) text_;
+ (void)showWithText:(NSString *) text_
            duration:(CGFloat)duration_;

+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset_;
+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset
            duration:(CGFloat) duration_;

+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_;
+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_
            duration:(CGFloat) duration_;

@end