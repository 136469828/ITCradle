//
//  SubHomeCell.m
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "SubHomeCell.h"

@implementation SubHomeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)selectedCell:(UITableView *)tableView
{
    static NSString *ID = @"SubHomeCell";
    
    SubHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SubHomeCell" owner:self options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

@end
