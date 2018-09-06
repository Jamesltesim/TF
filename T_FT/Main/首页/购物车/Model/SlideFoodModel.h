//
//  SlideFoodModel.h
//  T_FT
//
//  Created by James on 2018/9/6.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlideFoodModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic) CGFloat price;

- (instancetype)initWithTitle:(NSString *)title price:(CGFloat)price;
@end
