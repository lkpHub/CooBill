//
//  CountryCodeTableViewController.m
//  CooBill
//
//  Created by admin on 2017/5/18.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "CountryCodeTableViewController.h"

@interface CountryCodeTableViewController ()

@end

@implementation CountryCodeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择国家码";
    //设置左上角返回键
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_back" highlightImage:@"nav_back" target:self action:@selector(leftBtnClick)];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (void)leftBtnClick{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
