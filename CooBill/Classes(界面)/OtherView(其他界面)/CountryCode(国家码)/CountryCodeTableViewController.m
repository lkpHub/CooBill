//
//  CountryCodeTableViewController.m
//  CooBill
//
//  Created by admin on 2017/5/18.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "CountryCodeTableViewController.h"
#import "JKRSearchController.h"
#import "JKRSearchResultViewController.h"

static NSString *const CellIdentifier = @"WEICHAT_ID";

@interface CountryCodeTableViewController ()<JKRSearchControllerhResultsUpdating,JKRSearchControllerDelegate,JKRSearchBarDelegate>

//搜索界面控制器
@property (nonatomic, strong) JKRSearchController *searchController;
//数据源
@property (nonatomic, strong) NSArray<NSString *> *dataArray;

@end

@implementation CountryCodeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择国家码";
    //设置左上角返回键
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_back" highlightImage:@"nav_back" target:self action:@selector(leftBtnClick)];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    self.jkr_lightStatusBar = YES;
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
- (void)updateSearchResultsForSearchController:(JKRSearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(SELF CONTAINS %@)", searchText];
    JKRSearchResultViewController *resultController = (JKRSearchResultViewController *)searchController.searchResultsController;
    if (!(searchText.length > 0)){
        resultController.filterDataArray = @[];
    }else{
        resultController.filterDataArray = [self.dataArray filteredArrayUsingPredicate:predicate];
    }
}

#pragma mark - JKRSearchControllerDelegate
- (void)willPresentSearchController:(JKRSearchController *)searchController {
    NSLog(@"willPresentSearchController, %@", searchController);
}

- (void)didPresentSearchController:(JKRSearchController *)searchController {
    NSLog(@"didPresentSearchController, %@", searchController);
}

- (void)willDismissSearchController:(JKRSearchController *)searchController {
    NSLog(@"willDismissSearchController, %@", searchController);
}

- (void)didDismissSearchController:(JKRSearchController *)searchController {
    NSLog(@"didDismissSearchController, %@", searchController);
}

#pragma mark - JKRSearchBarDelegate
- (void)searchBarTextDidBeginEditing:(JKRSearchBar *)searchBar {
    NSLog(@"searchBarTextDidBeginEditing %@", searchBar);
}

- (void)searchBarTextDidEndEditing:(JKRSearchBar *)searchBar {
    NSLog(@"searchBarTextDidEndEditing %@", searchBar);
}

- (void)searchBar:(JKRSearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"searchBar:%@ textDidChange:%@", searchBar, searchText);
}

#pragma mark - 懒加载
//搜索控制界面
- (JKRSearchController *)searchController{
    if (!_searchController) {
        JKRSearchResultViewController *resultSearchController = [[JKRSearchResultViewController alloc]init];
        _searchController = [[JKRSearchController alloc]initWithSearchResultsController:resultSearchController];
        _searchController.searchBar.placeholder = @"搜索";
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchResultsUpdater = self;
        _searchController.searchBar.delegate = self;
        _searchController.delegate = self;
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
