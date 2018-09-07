//
//  ShoppingCarCell.h
//  T_FT
//
//  Created by James on 2018/9/7.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideFoodModel.h"
@interface ShoppingCarCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;

- (void)addSlideFood:(NSDictionary *)dict;
- (void)addSlideFoods:(NSArray<NSArray<SlideFoodModel *> *> *)array;
@end
