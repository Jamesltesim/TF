//
//  AdressManageCell.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "AddressManageCell.h"

@implementation AddressManageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.topView.layer.cornerRadius = 8;
    self.bottomView.layer.cornerRadius = 8;
    
    self.address.textColor = [UIColor colorWithRed:171/255.0 green:171/255.0 blue:171/255.0 alpha:1];
    
//    self.cancelBtn.imageEdgeInsets = UIEdgeInsetsMake(2, -2, 2, -2);
//    self.cancelBtn.
//    self.defaultBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
}
- (IBAction)defaultAction:(id)sender {
    
    if([self.delegate respondsToSelector:@selector(defaultAction:index:)]){
        [self.delegate defaultAction:self index:self.index];
    }
//    if(self.defaultBtn.tag == 0){
//        [self.defaultBtn setImage:[UIImage imageNamed:@"address_check@2x"] forState:UIControlStateNormal];
//        self.defaultBtn.tag =999;
//    }else{
//        [self.defaultBtn setImage:[UIImage imageNamed:@"address_circle@2x"] forState:UIControlStateNormal];
//        self.defaultBtn.tag =0;
//    }
}
- (IBAction)editAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(editAction:index:)]){
        [self.delegate editAction:self index:self.index];
    }
}

- (IBAction)cannelAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(cancelAction:index:)]){
        [self.delegate cancelAction:self index:self.index];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
