//
//  SubHomeViewController.m
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "SubHomeViewController.h"
#import "ShopInfoController.h"
#import "SelectController.h"
#import "SubHomeCell.h"
#import "KeyboardToolBar.h"
@interface SubHomeViewController ()<UIScrollViewDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIView *hearView;
//    BOOL isSelect;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView2;
@property (nonatomic, strong) UITableView *tableView3;
@property (nonatomic, strong) UITableView *tableView4;
@property(nonatomic,strong) UIScrollView *m_scrollView;
@property (nonatomic, strong) UIView *m_slideView;
@property (nonatomic, strong) UITextField *seachTextField;
@property (nonatomic, strong)UILabel *label;
@end

@implementation SubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    //手动滑动的范围
    self.m_scrollView.contentSize = CGSizeMake(ScreenWidth*4, 0);
    // 分页属性
    self.m_scrollView.pagingEnabled = YES;
    self.m_scrollView.delegate = self;
    [self.view addSubview:self.m_scrollView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 34, ScreenWidth, ScreenHeight-69-34)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.m_scrollView addSubview:_tableView];
   
    //
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth, 34, ScreenWidth, ScreenHeight-69-34)];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.m_scrollView addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth*2, 34, ScreenWidth, ScreenHeight-69-34)];
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.m_scrollView addSubview:_tableView3];
    
    _tableView4 = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth*3, 34, ScreenWidth, ScreenHeight-69-34)];
    _tableView4.delegate = self;
    _tableView4.dataSource = self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.m_scrollView addSubview:_tableView4];
    
    [self hearView];
    [self createTopView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView头视图
- (void)hearView{
    
    hearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
//    hearView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:hearView];
    _seachTextField = [[UITextField alloc] initWithFrame:CGRectMake(38, 8, SCREEN_WIDTH*0.5, 25)];
    //    seachTextField.backgroundColor = [UIColor whiteColor];
    _seachTextField.delegate = self;
    _seachTextField.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
    _seachTextField.layer.borderWidth = 1.0; // set borderWidth as you want.
    _seachTextField.layer.cornerRadius = 3.0f;
    _seachTextField.layer.masksToBounds=YES;
    [KeyboardToolBar registerKeyboardToolBar:_seachTextField];
    [hearView addSubview:_seachTextField];
    
    
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [seachBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [seachBtn setTitle:@"搜索" forState:UIControlStateNormal];
    seachBtn.frame = CGRectMake(SCREEN_WIDTH*0.5+33, 8, 50, 25);
    seachBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    //    [seachBtn addTarget:seachTextField action:@selector(seachOnSeach) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:seachBtn];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    leftBtn.layer.borderWidth = 1;
    leftBtn.layer.cornerRadius = 3;
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn setTitle:self.btnTitle forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 8, 35, 25);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:leftBtn];
    self.navigationItem.titleView = hearView;
}

- (void)createTopView
{
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.frame = CGRectMake(0, 56, ScreenWidth, 40);
    backgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backgroundView];
    
    NSArray *titleArray = @[@"销量", @"价格指数",@"利润率",@"更多"];
    CGFloat labelW = ScreenWidth / 4;  //数组里面有几个就除以几
    //遍历titleArray数组(从下标0开始) 返回obj(label的内容),idx(从下标0开始)
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(idx * labelW, 0,labelW, 40);
        label.text = obj;
        label.font = [UIFont systemFontOfSize:15];
        //设置文本内容居中
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        label.tag = idx;
        [backgroundView addSubview:label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
        [label addGestureRecognizer:tap];
        
    }];
    
    //滑动条
    self.m_slideView = [[UIView alloc] init];
    self.m_slideView.frame = CGRectMake(0, 40-3, labelW, 3);
    self.m_slideView.backgroundColor = [UIColor redColor];
    [backgroundView addSubview:self.m_slideView];
}


//单击label的时候scrollView滑动范围
- (void)tapHandler:(UITapGestureRecognizer *)tap
{
    //view(表示当前对应的label)  获取视图对应的Tag值
    NSInteger i = tap.view.tag;
    
    [self.m_scrollView setContentOffset:CGPointMake(i * ScreenWidth, -66) animated:YES];
    
}



#pragma mark - UIScrollViewDelegate
// 手势滑动视图减速完成后调用方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        NSInteger i = self.m_scrollView.contentOffset.x / ScreenWidth;
        self.m_slideView.frame = CGRectMake((ScreenWidth/4)*i, 40-3,ScreenWidth/4,3);
    }];
}


//点击手势视图完成后调用方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        NSInteger i = self.m_scrollView.contentOffset.x / ScreenWidth;
        self.m_slideView.frame = CGRectMake((ScreenWidth/4)*i, 40-3,ScreenWidth/4,3);
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    SubHomeCell *cell = [SubHomeCell selectedCell:tableView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopInfoController *sub = [[ShopInfoController alloc] init];
    [self.navigationController pushViewController:sub animated:YES];

}
#pragma mark - btnAction
- (void)btnAction:(UIButton *)btn
{

    SelectController *sub = [[SelectController alloc] init];
    sub.title = @"选择产品分类";
    [self.navigationController pushViewController:sub animated:YES];
    sub.block = ^(NSString *str)
    {
        [btn setTitle:str forState:UIControlStateNormal];
    };


}
@end
