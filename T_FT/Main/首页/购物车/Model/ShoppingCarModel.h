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


//初始化 购物车model 没有slidefood
+ (instancetype)initWithGoodModel:(GoodModel *)good;

/**
 //初始化 购物车model 带slidefood

 @param good 用户选择的商品
 @param slideFood 用户选择的slidefood
 @return 购物车model
 */
//+ (instancetype)initWithGoodModel:(GoodModel *)good slideFoode:(NSArray< NSDictionary *> *)slideFood;
@end
