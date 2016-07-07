//
//  ShowInfoCell.h
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *lookShop;
@property (weak, nonatomic) IBOutlet UIButton *bookBtn;
+ (instancetype)selectedCell:(UITableView *)tableView;
@end
