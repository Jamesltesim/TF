//
//  LostCollectionViewCell.m
//  T_FT
//
//  Created by James on 2018/6/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "LostCollectionViewCell.h"

@implementation LostCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.5;
}

@end
