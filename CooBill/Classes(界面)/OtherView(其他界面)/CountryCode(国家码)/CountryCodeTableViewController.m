//
//  CountryCodeTableViewController.m
//  CooBill
//
//  Created by admin on 2017/5/18.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "CountryCodeTableViewController.h"
#import "CountrySearchResultViewController.h"

static NSString *const CellIdentifier = @"WEICHAT_ID";

@interface CountryCodeTableViewController ()<UISearchControllerDelegate,UISearchBarDelegate,UISearchResultsUpdating>

//搜索控制器
@property (nonatomic, strong) UISearchController *searchController;
//数据源
@property (nonatomic, strong) NSArray<NSString *> *dataArray;

@end

@implementation CountryCodeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择国家码";
    //设置左上角返回键
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_back" highlightImage:@"nav_back" target:self action:@selector(leftBtnClick)];
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)leftBtnClick{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - JKRSearchControllerhResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(SELF CONTAINS %@)", searchText];
    CountrySearchResultViewController *resultController = (CountrySearchResultViewController *)searchController.searchResultsController;
    if (!(searchText.length > 0)){
        resultController.filterDataArray = @[];
    }else{
        resultController.filterDataArray = [self.dataArray filteredArrayUsingPredicate:predicate];
    }
}

#pragma mark - 懒加载
//搜索控制界面
- (UISearchController *)searchController{
    if (!_searchController) {
        CountrySearchResultViewController *resultSearchController = [[CountrySearchResultViewController alloc]init];
        _searchController = [[UISearchController alloc]initWithSearchResultsController:resultSearchController];
        _searchController.searchBar.placeholder = @"搜索";
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchResultsUpdater = self;
        _searchController.searchBar.delegate = self;
        _searchController.delegate = self;
        //设置搜索框外层颜色
        _searchController.searchBar.barTintColor = RGB(228, 228, 228, 0.8);
        //清楚搜索框黑线
        UIImageView *barImageView = [[[_searchController.searchBar.subviews firstObject] subviews] firstObject];
        barImageView.layer.borderColor = RGB(228, 228, 228, 1.0).CGColor;
        barImageView.layer.borderWidth = 1;
        _searchController.view.backgroundColor = RGB(222, 222, 222, 0.5);
    }
    return _searchController;
}

//数据源
- (NSArray<NSString *> *)dataArray {
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"country" ofType:@"txt"];
        NSError *error;
        NSString *countriesString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        if (!error){
            _dataArray = [countriesString componentsSeparatedByString:@"\n"];
        }
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
