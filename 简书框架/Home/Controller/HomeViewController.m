//
//  HomeViewController.m
//  模仿简书自定义Tabbar（纯代码）
//
//  Created by 余钦 on 16/5/30.
//  Copyright © 2016年 yuqin. All rights reserved.
//

#import "HomeViewController.h"
#import "SubHomeViewController.h"
#import "KeyboardToolBar.h"
#import "SDCycleScrollView.h"
#import "NetManger.h"
@interface HomeViewController()<UIScrollViewDelegate,UITextFieldDelegate,SDCycleScrollViewDelegate>
{
    UIView *hearView;
    NSArray *btnTitles;
    NetManger *manger;
}
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UITextField *seachTextField;
@end

@implementation HomeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    manger = [NetManger shareInstance];
    [manger loadData:RequestOfGetarticlelist];
    btnTitles = @[@"台式机",@"笔记本",@"手机"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self hearView];
    [self btnScrollView];
    NSArray *titles = @[@"选机中心", @"供应查询", @"订单查询", @"客户管理",@"培训促销",@"消息推送",@"广告预约",@"数据分析",@"财务管理"];
    NSArray *imageNames = @[@"homeIcon01",@"homeIcon02",@"homeIcon03",@"homeIcon04",@"homeIcon05",@"homeIcon06",@"homeIcon07",@"homeIcon08",@"homeIcon09"];
    [self drawHoneViewWithAppviewW:ScreenWidth/3 AppviewH:ScreenWidth/4 Totalloc:3 Count:9 ImageArray:imageNames TitleArray:titles];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [super.navigationController setNavigationBarHidden:YES animated:TRUE];
    [super.navigationController setToolbarHidden:YES animated:TRUE];
}
#pragma mark - tableView头视图
- (void)hearView
{
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenWidth*0.6) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    NSArray *datas = @[@"http://itcradle.meidp.com/upload/201607/2b680d362fe541bab8316ff283d28362.jpg",
                       @"http://itcradle.meidp.com/upload/201607/f802574a81ba47f6bbb3af362e0cbd91.jpg"];
    cycleScrollView3.imageURLStringsGroup = datas;
    [self.view addSubview:cycleScrollView3];
    
    hearView = [[UIView alloc] initWithFrame:CGRectMake(20,cycleScrollView3.bounds.size.height - 35, SCREEN_WIDTH-40, 30)];
    hearView.layer.borderColor = [UIColor whiteColor].CGColor;
    hearView.layer.borderWidth = 1;
    hearView.layer.cornerRadius = 8;
    hearView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:hearView];

    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    seachBtn.backgroundColor = [UIColor redColor];
    [seachBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [seachBtn setTitle:@"请输入商品型号或名称" forState:UIControlStateNormal];
    [seachBtn setImage:[UIImage imageNamed:@"seachImg2"] forState:UIControlStateNormal];
    [seachBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    seachBtn.frame = CGRectMake(80, 2, hearView.bounds.size.width - 80, 25);
    seachBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    seachBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [seachBtn addTarget:self action:@selector(seachOnSeach) forControlEvents:UIControlEventTouchDown];
    [hearView addSubview:seachBtn];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftBtn.backgroundColor = [UIColor redColor];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"深圳市" forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(10, 2, 60, 25);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    UIImageView *downImg = [[UIImageView alloc] initWithFrame:CGRectMake(leftBtn.bounds.size.width-20, 8, 10, 10)];
    downImg.image = [UIImage imageNamed:@"downImg"];
    [leftBtn addSubview:downImg];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(72, 4, 1, hearView.bounds.size.height-8)];
    line.backgroundColor = [UIColor lightGrayColor];
    [hearView addSubview:line];
    [hearView addSubview:leftBtn];
}
#pragma mark - 中间滑动按钮
- (void)btnScrollView
{
    NSArray *imageNames = @[@"scoll1", @"scoll2", @"scoll3", @"scoll4", @"scoll3", @"scoll2", @"scoll1"];
    NSArray *titles = @[@"台式机", @"笔记本", @"服务器", @"手机", @"平板", @"办公设备", @"其他"];
    UIView *topButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenWidth*0.6+8, ScreenWidth,ScreenWidth*0.25)];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, topButtonView.bounds.size.height-15, ScreenWidth, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [topButtonView addSubview:line];
    [self.view addSubview:topButtonView];
    
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, 160)];
    
    _scroll.contentSize = CGSizeMake(2*[UIScreen mainScreen].bounds.size.width, 160);
    _scroll.bounces = YES;
    _scroll.pagingEnabled = YES;
    _scroll.delegate = self; // 实现协议
    _scroll.showsHorizontalScrollIndicator = NO;
    [topButtonView addSubview:_scroll];
    
    
    
    for (int i = 0; i < imageNames.count; i++) {
        NSInteger index = i % 8;
        CGFloat xCoordinate;
        xCoordinate = ScreenWidth/4;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(index * xCoordinate, 0,ScreenWidth/4,topButtonView.bounds.size.height);
        button.tag = i+1;
//        button.backgroundColor = [UIColor redColor];
//        [button setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        
        UIImageView *btnView = [[UIImageView alloc] initWithFrame:CGRectMake((button.bounds.size.width/2)-(button.bounds.size.width*0.5)/2, 8, button.bounds.size.width*0.5, button.bounds.size.width*0.5)];
        btnView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageNames[i]]];
        [button addSubview:btnView];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, button.bounds.size.height-button.bounds.size.height*0.4, button.bounds.size.width, 10)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = [UIColor blackColor];
        lab.text = [NSString stringWithFormat:@"%@",titles[i]];
        lab.font = [UIFont systemFontOfSize:10];
        [button addSubview:lab];
        [_scroll.viewForFirstBaselineLayout addSubview:button];
    }

}
#pragma mark - 创建九宫格
- (void)drawHoneViewWithAppviewW:(CGFloat)appviewWith AppviewH:(CGFloat)appviewHeght Totalloc:(int)totalloc Count:(int)count ImageArray:(NSArray *)images TitleArray:(NSArray *)titles{
    //    三列
    //    int totalloc=3;
    //    CGFloat appvieww=80;
    //    CGFloat appviewh=100;
    CGFloat margin=([UIScreen mainScreen].bounds.size.width-totalloc*appviewWith)/(totalloc+1);
    //    int count = 8;
    for (int i=0; i<count; i++) {
        int row=i/totalloc;//行号
        //1/3=0,2/3=0,3/3=1;
        int loc=i%totalloc;//列号
        
        CGFloat appviewx=margin+(appviewWith + .5)*loc;
        CGFloat appviewy=margin+(appviewHeght + .5)*row;
        
        //创建uiview控件
        UIView *appview=[[UIView alloc]initWithFrame:CGRectMake(appviewx,self.view.bounds.size.height-appviewy-ScreenHeight*0.25, appviewWith, appviewHeght)];
//        appview.backgroundColor = [UIColor redColor];
        [self.view addSubview:appview];
        
        // 创建按钮
        UIButton *bTn = [UIButton buttonWithType:UIButtonTypeCustom];
        bTn.frame = CGRectMake(0, 0, appviewWith,appviewHeght);
//        [bTn addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchDown];
//        [bTn setBackgroundColor:[UIColor redColor]];
        bTn.tag = 1000 + i;
        [appview addSubview:bTn];
        
        //创建uiview控件中的子视图
        UIImageView *appimageview=[[UIImageView alloc]initWithFrame:CGRectMake((appviewWith*0.6)/2,appviewWith*0.14, appviewWith-appviewWith*0.6,appviewWith-appviewWith*0.6)];
        UIImage *appimage=[UIImage imageNamed:images[i]];
        appimageview.image=appimage;
        [appimageview setContentMode:UIViewContentModeScaleAspectFit];
        // NSLog(@"%@",self.apps[i][@"icon"]);
        [appview addSubview:appimageview];
        
        //创建文本标签
        UILabel *applable=[[UILabel alloc]initWithFrame:CGRectMake(0, appview.bounds.size.height - 20, appview.bounds.size.width, 20)];
        //        applable.backgroundColor = [UIColor redColor];
        [applable setText:titles[i]];
        [applable setTextAlignment:NSTextAlignmentCenter];
        [applable setFont:[UIFont systemFontOfSize:12.0]];
        [appview addSubview:applable];
        
    }
    
}
#pragma mark - btnAction
- (void)seachOnSeach
{
    SubHomeViewController *sub = [[SubHomeViewController alloc] init];
    sub.title = @"搜索结果";
    sub.btnTitle = @"全部";
    sub.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sub animated:YES];

}

- (void)tagBtnAction:(UIButton *)btn
{
    SubHomeViewController *sub = [[SubHomeViewController alloc] init];
    sub.title = @"搜索结果";
    sub.btnTitle = btn.titleLabel.text;
    sub.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sub animated:YES];
}
- (void)btnAction:(UIButton *)btn
{
    NSLog(@"11");
}
@end
