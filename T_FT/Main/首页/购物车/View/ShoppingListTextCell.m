//
//  ShoppingListTextCell.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingListTextCell.h"
#import "TriangleView.h"

@interface ShoppingListTextCell()

@property (weak, nonatomic) IBOutlet TriangleView *triangle;

@end

@implementation ShoppingListTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
  self.triangle.hidden = YES;
}

- (void)hidenTriangle{
    if(!self.triangle.isHidden){
        self.triangle.hidden = YES;
    }
}

- (void)showCount:(NSInteger)count{
    [self.triangle showCount:count];
}

- (void)setGoodsCount:(NSInteger)count{
    if(count){
        [self showCount:count];
    }else{
        [self hidenTriangle];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
