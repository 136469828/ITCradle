//
//  MangerCell.m
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MangerCell.h"

@implementation MangerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)selectedCell:(UITableView *)tableView
{
    static NSString *ID = @"MangerCell";
    
    MangerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MangerCell" owner:self options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

@end
