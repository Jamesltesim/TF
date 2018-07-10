//
//  ShoppingTableViewCell.m
//  T_FT
//
//  Created by James on 2018/7/10.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingTableViewCell.h"

@implementation ShoppingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
