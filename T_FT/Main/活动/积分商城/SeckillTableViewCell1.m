//
//  SeckillTableViewCell.m
//  T_FT
//
//  Created by James on 2018/6/22.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SeckillTableViewCell1.h"

@implementation SeckillTableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.progressBar.layer.borderColor = [UIColor colorWithRed:202/255.0 green:121/255.0 blue:129/255.0 alpha:1].CGColor;
//    self.progressBar.layer.borderWidth = 1;
//    self.progressBar.layer.cornerRadius = 3.5;
//    self.progressBar.layer.masksToBounds = YES;
//    
//    self.button.layer.cornerRadius = 2;
    
    self.shifouxiaoshou.layer.cornerRadius = 8;
    self.shifouxiaoshou.layer.masksToBounds = YES;
    self.shifouxiaoshou.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
