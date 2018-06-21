//
//  TFUtils.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFUtils : NSObject


/**
 两个时间比较

 @param oneDay 第一个时间
 @param anotherDay 第二个时间
 @return    0 表示时间相同，
            1 表示 oneDay 比 anotherDay 晚
            2 表示 oneDay 比 anotherDay 早
 */
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
@end
