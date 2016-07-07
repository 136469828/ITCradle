//
//  MangerController.m
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MangerController.h"
#import "MangerCell.h"
@interface MangerController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIView *hearView;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MangerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTableView];
}
#pragma mark -
- (void)setTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self hearView];
    [self.view addSubview:_tableView];
}
#pragma mark - tableView头视图
- (void)hearView{
    
    hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 140)];
    hearView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:hearView];
    UITextField *seachTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 8, SCREEN_WIDTH-75, 35)];
//    seachTextField.backgroundColor = [UIColor whiteColor];
    seachTextField.delegate = self;
    seachTextField.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
    seachTextField.layer.borderWidth = 1.0; // set borderWidth as you want.
    seachTextField.layer.cornerRadius = 3.0f;
    seachTextField.layer.masksToBounds=YES;
    
    [hearView addSubview:seachTextField];
    
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [seachBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [seachBtn setTitle:@"搜索" forState:UIControlStateNormal];
    seachBtn.frame = CGRectMake(SCREEN_WIDTH-55, 8, 50, 35);
    seachBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    seachBtn.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
    seachBtn.layer.borderWidth = 1.0; // set borderWidth as you want.
    seachBtn.layer.cornerRadius = 3.0f;
    //    [seachBtn addTarget:seachTextField action:@selector(seachOnSeach) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:seachBtn];
//    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(8, hearView.bounds.size.height - 1, ScreenWidth - 16, 0.5)];
//    line.backgroundColor = [UIColor lightGrayColor];
//    [hearView addSubview:line];
    for (int i = 0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(ScreenWidth/12+i*ScreenWidth/3, hearView.bounds.size.height-80, ScreenWidth/6, ScreenWidth/6);
        [hearView addSubview:btn];
    }
    self.tableView.tableHeaderView = hearView;
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
    return 75;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MangerCell *cell = [MangerCell selectedCell:tableView];
    return cell;
}

@end
