//
//  ShoppingCarModel.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "GoodModel.h"

@interface ShoppingCarModel : GoodModel

@property (nonatomic) NSInteger count;

+ (instancetype)initWithGoodModel:(GoodModel *)good;

@end
