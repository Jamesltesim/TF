//
//  GoodModel.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "GoodModel.h"

@implementation GoodModel

- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}

- (NSMutableArray<SlideFoodModel *> *)slideFood{
    if(!_slideFood){
        _slideFood = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _slideFood;
}
@end
