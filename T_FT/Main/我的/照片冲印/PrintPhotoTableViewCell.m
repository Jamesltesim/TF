//
//  PrintPhotoTableViewCell.m
//  T_FT
//
//  Created by James on 2018/6/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "PrintPhotoTableViewCell.h"

@implementation PrintPhotoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    self.name.layer.shadowColor = [UIColor blackColor].CGColor;
    
    self.name.layer.shadowOffset = CGSizeMake(2, 2);
    
    self.name.layer.shadowOpacity = 1;
    
    self.name.layer.shadowRadius = 3.5;
    
    self.name.layer.cornerRadius = 3.5;
    
    self.name.clipsToBounds = NO;
    
    
   [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
