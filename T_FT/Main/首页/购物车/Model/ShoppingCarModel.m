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


/**
 屏蔽掉了父类中的该属性

 @return nil
 */
- (NSMutableArray<SlideFoodModel *> *)slideFood{
    return nil;
}

- (NSMutableArray<NSArray<SlideFoodModel *> *> *)slideFoods{
    if(!_slideFoods){
        _slideFoods = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _slideFoods;
}

+ (instancetype)initWithGoodModel:(GoodModel *)good{
    ShoppingCarModel *model = [[ShoppingCarModel alloc] init];
    model.goodId = good.goodId;
    model.title = good.title;
    model.price = good.price;
    return model;
}

//+ (instancetype)initWithGoodModel:(GoodModel *)good slideFoode:(NSArray< NSDictionary *> *)slideFood{
//    ShoppingCarModel *model = [self initWithGoodModel:good];
//    model.slideFood = slideFood;
//    return model;
//}

- (NSString *)description{
    return [NSString stringWithFormat:@"goodID:%@ count:%ld title:%@ price:%.2f slideFoods:%@",self.goodId,self.count,self.title,self.price,self.slideFoods];
}
@end
