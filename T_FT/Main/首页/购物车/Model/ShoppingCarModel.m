//
//  ShoppingCarModel.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingCarModel.h"

@implementation ShoppingCarModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.count = 1;
    }
    return self;
}

+ (instancetype)initWithGoodModel:(GoodModel *)good{
    ShoppingCarModel *model = [[ShoppingCarModel alloc] init];
    model.goodId = good.goodId;
    return model;
}

@end
