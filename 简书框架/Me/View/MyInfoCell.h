//
//  MyInfoCell.h
//  ITYaoLan
//
//  Created by admin on 16/6/27.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
+ (instancetype)selectedCell:(UITableView *)tableView;
@end
