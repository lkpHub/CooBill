//
//  PasswordLoginViewController.m
//  CooBill
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "PasswordLoginViewController.h"

@interface PasswordLoginViewController ()<UITextFieldDelegate>

@end

@implementation PasswordLoginViewController

#define Set_X 15
#define IconWH 25
#define TextFieldH 45
#define TopImageWH 100

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //搭建UI视图
    [self setUpView];
}

#pragma mark - 搭建UI视图
- (void)setUpView{
    
    //顶部视图
    UIImageView *topImageView = [[UIImageView alloc]init];
    topImageView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:topImageView];
    [topImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(TopImageWH, TopImageWH));
        make.top.equalTo(TopImageWH);
    }];
    
    CGFloat height = TopImageWH + TopImageWH + 15;
    
    //搭建输入框视图
    for (int i = 1; i < 4; i ++) {
        //设置输入框
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(Set_X, height, KPWidth - 2 * Set_X, TextFieldH)];
        [self.view addSubview:textField];
        
        textField.textAlignment = NSTextAlignmentLeft;
        textField.textColor = [UIColor blackColor];
        textField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.font = [UIFont fontWithName:@"Helvetica" size:18];
        textField.tag = 10 * i;
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.delegate = self;
        
        switch (textField.tag) {
            case 10://国家码点击界面
            {
                textField.text = @"中国";
                textField.enabled = NO;
                
                UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ViewLeftW, IconWH)];
                iconImage.backgroundColor = [UIColor magentaColor];
                iconImage.contentMode = UIViewContentModeScaleAspectFit;
                textField.leftView = iconImage;
                
                //添加点击事件
                UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                tapBtn.frame = textField.frame;
                tapBtn.tag = 11;
                [tapBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:tapBtn];
            }
                break;
            case 20://手机号行
            {
                textField.placeholder = @"请输入手机号";
                
                UITextField *codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, ViewLeftW, TextFieldH)];
                codeTextField.textAlignment = NSTextAlignmentLeft;
                codeTextField.textColor = [UIColor blackColor];
                codeTextField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
                codeTextField.font = [UIFont fontWithName:@"Helvetica" size:18];
                codeTextField.delegate = self;
                codeTextField.text = @"+86";
                codeTextField.tag = 21;
                //添加文字监听
                [codeTextField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
                textField.leftView = codeTextField;
            }
                break;
            case 30://密码输入框
            {
                textField.placeholder = @"请输入密码";
                //默认为NO，设置为YES时，当文本零内容时，将禁用返回键，有内容则放开返回键
                textField.secureTextEntry = YES;
            }
                break;
                
            default:
                break;
        }
        height += textField.frame.size.height;
        //添加分割线
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(Set_X, height, KPWidth - 2 * Set_X, lineH)];
        lineView.backgroundColor = RGB(217, 217, 217, 1);
        [self.view addSubview:lineView];
        height += lineView.frame.size.height;
    }
    
    //搭建登陆按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor orangeColor];
//    loginBtn setFrame:CGRectMake(Set_X, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

#pragma mark - 按钮点击
- (void)btnClick:(UIButton *)sender{
    
    KPLog(@"点击了国家码");
}

#pragma mark - 文件改变监听
- (void)textFieldChange:(UITextField *)sender{
    
}

#pragma mark - textFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    switch (textField.tag) {
        case 20://手机号码输入框
        {
            
        }
            break;
        case 21://国家码输入框
        {
            if (!string.length) {//删除点击
                if (!range.location) {//保留+
                    return NO;
                }
            }else if (textField.text.length >= 5){//超出国家码位数
                return NO;
            }
        }
            break;
        case 22://登陆密码输入框
        {
            
        }
            break;
        default:
            break;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
