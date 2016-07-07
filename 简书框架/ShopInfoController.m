//
//  ShopInfoController.m
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "ShopInfoController.h"
#import "ShowInfoCell.h"
@interface ShopInfoController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ShopInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
- (void)setTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:_tableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 230;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *allCell = @"cell";
//    UITableViewCell *cell = nil;
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:allCell];
//        cell.selectionStyle = UITableViewCellAccessoryNone;
//    }
    ShowInfoCell *cell = [ShowInfoCell selectedCell:tableView];
    return cell;
}


@end
