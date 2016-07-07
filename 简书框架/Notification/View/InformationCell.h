//
//  InformationCell.h
//  ITCradle
//
//  Created by admin on 16/7/7.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
+ (instancetype)selectedCell:(UITableView *)tableView;
@end
