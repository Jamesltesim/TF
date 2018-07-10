//
//  ShoppingListTextCell.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingTableViewCell.h"

@interface ShoppingListTextCell : ShoppingTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *price;
@end
