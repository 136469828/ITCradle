//
//  MyInfoCell.m
//  ITYaoLan
//
//  Created by admin on 16/6/27.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MyInfoCell.h"

@implementation MyInfoCell

+ (instancetype)selectedCell:(UITableView *)tableView
{
    static NSString *ID = @"MyInfoCell";
    
    MyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyInfoCell" owner:self options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
