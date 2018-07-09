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

+ (NSInteger)getCount;
+ (CGFloat)getTotalPrices;

+ (void)showOrder;
@end
