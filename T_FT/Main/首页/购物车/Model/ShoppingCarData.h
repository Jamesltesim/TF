//
//  ShoppingCarData.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodModel.h"
#import "ShoppingCarModel.h"



#define GOODS_KEY   @"GOODS_KEY"
#define PRICE_KEY   @"PRICE_KEY"

@interface ShoppingCarData : NSObject

+(instancetype)shareInstance;

+ (void)addGood:(GoodModel *)model;
+ (void)addGood:(GoodModel *)model slideFood:(SlideFoodModel *)slideFood;
+ (void)subGood:(GoodModel *)model;
+ (void)subGood:(GoodModel *)model slideFood:(SlideFoodModel *)slideFood;


/**
 判断是否存在当前商品

 @param model model description
 @return return value description
 */
+ (BOOL)existGood:(GoodModel *)model;

/**
 当前商品的数量

 @param model model description
 @return return value description
 */
+ (NSInteger)countOfGood:(GoodModel *)model;


/**
 购物车的商品数量

 @return return value description
 */
+ (NSInteger)getCount;

/**
 购物车总价

 @return return value description
 */
+ (CGFloat)getTotalPrices;


/**
 得到购物车中的所有商品

 @return dict
 */
+ (NSDictionary *)getAllGoods;


/**
 打印当前购物车内容
 */
+ (void)showOrder;
@end
