//
//  SubInfoController.m
//  ITYaoLan
//
//  Created by admin on 16/6/28.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "SubInfoController.h"

@interface SubInfoController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSArray *celltitles;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation SubInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    celltitles = @[@"头像",@"名称",@"地区"];
    [self setTableView];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 66;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *allCell = @"cell";
    UITableViewCell *cell = nil;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:allCell];
        cell.selectionStyle = UITableViewCellAccessoryNone;
    }
    // cell控件
    UIImageView *userImg = [[UIImageView alloc] init];
    UILabel *subTitleLabel = [[UILabel alloc] init];
    UILabel *mainLabel = [[UILabel alloc] init];
    UITextField *textFiled = [[UITextField alloc] init];
    UILabel *stetaLabel = [[UILabel alloc] init];
    subTitleLabel.font  = [UIFont systemFontOfSize:15];
    mainLabel.font      = [UIFont systemFontOfSize:15];
    stetaLabel.font     = [UIFont systemFontOfSize:15];
    if (indexPath.row == 0) {
        userImg.frame = CGRectMake(ScreenWidth-60, 5, 55, 55);
        userImg.layer.cornerRadius = 5;
        userImg.layer.masksToBounds = YES;
        userImg.image = [UIImage imageNamed:@"zq4.jpg"];
//        [userImg sd_setImageWithURL:[NSURL URLWithString:manger.userImg]];
        [cell.contentView addSubview:userImg];
    }// 头像
    else if (indexPath.row == 1)
    {
        textFiled.frame = CGRectMake(ScreenWidth*0.3, 5, ScreenWidth-ScreenWidth*0.3-10, 30);
        textFiled.tag = 999 + indexPath.row;
        textFiled.delegate = self;
        textFiled.font = [UIFont systemFontOfSize:15];
        textFiled.text = @"肇庆天宁电脑城供销商";
        textFiled.textColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:textFiled];
    }//用户昵称
    else if (indexPath.row == 2)
    {
        subTitleLabel.frame = CGRectMake(0, 2, ScreenWidth-10, 40);
        subTitleLabel.text = @"广东肇庆";
        subTitleLabel.textColor = [UIColor lightGrayColor];
//        if (sexStr.length != 0)
//        {
//            subTitleLabel.text = sexStr;
//        }
//        else
//        {
//            subTitleLabel.text = manger.userSex;
//        }
//        sexStr = subTitleLabel.text;
        [cell.contentView addSubview:subTitleLabel];
    }// 性别
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",celltitles[indexPath.row]];
    textFiled.textAlignment = NSTextAlignmentRight;
    subTitleLabel.textAlignment = NSTextAlignmentRight;
    mainLabel.textAlignment = NSTextAlignmentRight;
    stetaLabel.textAlignment = NSTextAlignmentRight;
    return cell;
}

@end
