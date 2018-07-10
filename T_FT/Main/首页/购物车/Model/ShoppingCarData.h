//
//  ShoppingCarData.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodModel.h"

@interface ShoppingCarData : NSObject

+(instancetype)shareInstance;

+ (void)addGood:(GoodModel *)model;
+ (void)subGood:(GoodModel *)model;


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
 打印当前购物车内容
 */
+ (void)showOrder;
@end
