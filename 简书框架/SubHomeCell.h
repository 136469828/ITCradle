//
//  SubHomeCell.h
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubHomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *clickAndSalesLab;
@property (weak, nonatomic) IBOutlet UIButton *supplierBtn;
@property (weak, nonatomic) IBOutlet UILabel *mediaLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
+ (instancetype)selectedCell:(UITableView *)tableView;
@end
