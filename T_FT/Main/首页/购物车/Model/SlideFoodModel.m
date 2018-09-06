//
//  SlideFoodModel.m
//  T_FT
//
//  Created by James on 2018/9/6.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SlideFoodModel.h"

@implementation SlideFoodModel

- (instancetype)initWithTitle:(NSString *)title price:(CGFloat)price{
    if (self = [super init]){
        self.title = title;
        self.price = price;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"title:%@ price:%.2f ",self.title,self.price];
}
@end
