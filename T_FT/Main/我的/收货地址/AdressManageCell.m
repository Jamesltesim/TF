//
//  AdressManageCell.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "AdressManageCell.h"

@implementation AdressManageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.topView.layer.cornerRadius = 8;
    self.bottomView.layer.cornerRadius = 8;
    
    self.address.textColor = [UIColor colorWithRed:171/255.0 green:171/255.0 blue:171/255.0 alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
