//
//  ShowInfoCell.m
//  ITYaoLan
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "ShowInfoCell.h"

@implementation ShowInfoCell

- (void)awakeFromNib {
    // Initialization code
    self.bookBtn.layer.borderWidth = 1;
    self.bookBtn.layer.borderColor = [UIColor blueColor].CGColor;
    self.lookShop.layer.borderWidth = 1;
    self.lookShop.layer.borderColor = [UIColor blueColor].CGColor;
    self.bookBtn.layer.cornerRadius = 3;
    self.lookShop.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
+ (instancetype)selectedCell:(UITableView *)tableView
{
    static NSString *ID = @"ShowInfoCell";
    
    ShowInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShowInfoCell" owner:self options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

@end
