//
//  PasswordLoginViewController.m
//  CooBill
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "PasswordLoginViewController.h"
#import "CountryCodeTableViewController.h"

@interface PasswordLoginViewController ()<UITextFieldDelegate>
//是否有号码
@property (nonatomic, assign) BOOL isHavePhone;
//是否有密码
@property (nonatomic, assign) BOOL isHavePassword;
@end

@implementation PasswordLoginViewController

#define Set_X 15
#define IconWH 25
#define TextFieldH 45
#define TopImageWH 100

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHavePhone = NO;
    self.isHavePassword = NO;
    
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
        
        textField.tag = 10 * i;
        textField.textAlignment = NSTextAlignmentLeft;
        textField.textColor = [UIColor blackColor];
        textField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.font = [UIFont fontWithName:@"Helvetica" size:18];
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
                tapBtn.tag = 11;
                tapBtn.frame = textField.frame;
                [tapBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:tapBtn];
            }
                break;
            case 20://手机号行
            {
                textField.placeholder = @"请输入手机号";
                [textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
                
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
                [textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
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
    loginBtn.tag = 40;
    loginBtn.backgroundColor = RGB(165, 221, 165, 1.0);
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn setTitle:@"登 陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:RGB(220, 241, 220, 0.9) forState:UIControlStateNormal];
    [loginBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    loginBtn.userInteractionEnabled = NO;
    [loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setFrame:CGRectMake(Set_X, height + 15, KPWidth - 2 * Set_X, TextFieldH)];
    [self.view addSubview:loginBtn];
    
    //搭建遇到问题按钮
    UIButton *questionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    questionBtn.tag = 50;
    questionBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    questionBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [questionBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [questionBtn setTitle:@"遇到问题？" forState:UIControlStateNormal];
    [questionBtn setTitleColor:RGB(57, 87, 137, 1.0) forState:UIControlStateNormal];
    [questionBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:questionBtn];
    [questionBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.size.equalTo(CGSizeMake(100, 15));
    }];
    
    //搭建注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.tag = 60;
    [registerBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [registerBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:RGB(57, 87, 137, 1.0) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn.layer setBorderWidth:1.0];
    [registerBtn.layer setBorderColor:RGB(57, 87, 137, 0.8).CGColor];
    registerBtn.layer.cornerRadius = 5;
    registerBtn.layer.masksToBounds = YES;
    [self.view addSubview:registerBtn];
    [registerBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(- 15);
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(100, 30));
    }];
}

#pragma mark - 按钮点击
- (void)btnClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 11://国家码按钮点击
        {
            KPLog(@"国家码点击");
            CountryCodeTableViewController *codeView = [[CountryCodeTableViewController alloc]init];
            KPNavigationController *nav = [[KPNavigationController alloc]initWithRootViewController:codeView];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 40://登陆
        {
            KPLog(@"登陆点击");
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = @"加载中...";
            
            UITextField *telField = [self.view viewWithTag:20];
            UITextField *passWordField = [self.view viewWithTag:30];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            if ([telField.text isEqualToString:@"1"] && [passWordField.text isEqualToString:@"1"]) {
//                KPLog(@"登陆成功");
                [KPAppDelegate gotoMainView];
//            }else{
//                [SHToast showWithText:@"登陆失败" duration:1.0];
//                KPLog(@"登陆失败");
//            }
        }
            break;
        case 50://遇到问题
        {
            KPLog(@"遇到问题点击");
        }
            break;
        case 60://注册按钮
        {
            KPLog(@"注册点击");
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 文件改变监听
- (void)textFieldChange:(UITextField *)sender{
    
    NSLog(@"sender = %@",sender.text);
    switch (sender.tag) {
        case 20://手机号码输入框
        {
            if (sender.text.length) {
                self.isHavePhone = YES;
            }else{
                self.isHavePhone = NO;
            }
        }
            break;
        case 21://国家码输入框
        {
            
        }
            break;
        case 30://密码输入框
        {
            if (sender.text.length) {
                self.isHavePassword = YES;
            }else{
                self.isHavePassword = NO;
            }
        }
            break;
            
        default:
            break;
    }
    
    UIButton *btn = [self.view viewWithTag:40];
    if (self.isHavePhone && self.isHavePassword) {
        btn.userInteractionEnabled = YES;
        btn.backgroundColor = RGB(38, 171, 40, 0.9);
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        btn.userInteractionEnabled = NO;
        btn.backgroundColor = RGB(165, 221, 165, 1.0);
        [btn setTitleColor:RGB(220, 241, 220, 0.9) forState:UIControlStateNormal];
    }
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
        case 30://登陆密码输入框
        {
            
        }
            break;
        default:
            break;
    }
    return YES;
}


#pragma mark - 点击空白
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
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
