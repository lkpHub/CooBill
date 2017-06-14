//
//  JKRSearchResultViewController.m
//  JKRSearchBar
//
//  Created by tronsis_ios on 17/3/31.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "JKRSearchResultViewController.h"

@interface JKRSearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JKRSearchResultViewController

static NSString *const cellID = @"RESULT_CELL_ID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor clearColor];
    [self effectViewWithFrame:self.tableView.bounds];
}

- (void)setFilterDataArray:(NSArray *)filterDataArray {
    _filterDataArray = filterDataArray;
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.filterDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = self.filterDataArray[indexPath.row];
    return cell;
}

- (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = frame;
    return effectView;
}

- (void)dealloc {
    NSLog(@"JKRSearchResultViewController dealloc");
}

@end
