//
//  GoodModel.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodModel : NSObject

@property (nonatomic) NSNumber *goodId;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *imgUrl;
@property (nonatomic) CGFloat price;
@property (nonatomic,strong) NSArray *slideFood;

@property (nonatomic) BOOL isHaveSlideFood;

@end
