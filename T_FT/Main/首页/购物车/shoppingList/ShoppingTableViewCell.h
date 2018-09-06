//
//  ShoppingTableViewCell.h
//  T_FT
//
//  Created by James on 2018/7/10.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingTableViewCell : UITableViewCell

- (void)setGoodsCount:(NSInteger)count;
- (void)showCount:(NSInteger)count;
- (void)hidenTriangle;
@end
