//
//  SelectController.h
//  ITYaoLan
//
//  Created by admin on 16/7/1.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^mblock)(NSString *str);
@interface SelectController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) mblock block;

@end
