//
//  InfoViewController.m
//  ITYaoLan
//
//  Created by admin on 16/6/24.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "InfoViewController.h"
#import "SubInfoController.h"
#import "MangerController.h"
#import "MyInfoCell.h"
@interface InfoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titles;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    titles = @[@" ",@"库存管理",@"订单管理",@"客户管理",@"我的库存周转率",@"我的应收周转率",@"我的利润率",@"市场数据分析",@"我的足迹",@"消息中心",@"设置"];
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
    return titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 80;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInfoCell *cell = [MyInfoCell selectedCell:tableView];
    if (indexPath.row == 0)
    {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 8, 80-16, 80-16)];
        imgV.image = [UIImage imageNamed:@"zq4.jpg"];
        [cell.contentView addSubview:imgV];
        
        UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, ScreenWidth-90, 20)];
        nameLab.text = @"肇庆天宁电脑城";
        nameLab.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:nameLab];
        
        UILabel *areaLab = [[UILabel alloc] initWithFrame:CGRectMake(90, 80-30, ScreenWidth-90, 20)];
        areaLab.text = @"肇庆";
        areaLab.font = [UIFont systemFontOfSize:11];
        [cell.contentView addSubview:areaLab];
        cell.imgV.hidden = YES;
    }
    else
    {
        cell.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row]];
    }

    cell.titleLab.text = titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            SubInfoController *sub = [[SubInfoController alloc] init];
            //    sub.title = @"官方教程";
            sub.hidesBottomBarWhenPushed = YES;
            //    [self.navigationController pushViewController:sub animated:YES];
            [self.navigationController pushViewController:sub animated:YES];
        }
            break;
        case 1:
        {
            MangerController *sub = [[MangerController alloc] init];
//            sub.title = @"官方教程";
            sub.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:sub animated:YES];

        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }


}
@end
