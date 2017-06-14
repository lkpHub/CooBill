//
//  MainViewController.m
//  CooBill
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"O(∩_∩)O~";
    BOOL a = [PublicMethod isFirstLetter:self.title];
    NSString *b = [PublicMethod getPreferredLanguage];
    NSString *c = [PublicMethod currentDateWithFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    KPLog(@"a = %d,b = %@,c = %@",a,b,c);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
