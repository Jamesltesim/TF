//
//  TFUtils+Date.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFUtils.h"

@interface TFUtils (Date)


/**
 两个时间比较
 
 @param oneDate 第一个时间
 @param anotherDate 第二个时间
 
 @return    0 表示时间相同，
 1 表示 oneDay 比 anotherDay 晚
 -1 表示 oneDay 比 anotherDay 早
 */
+(int)compareOneDay:(NSDate *)oneDate withAnotherDay:(NSDate *)anotherDate;


/**
 当前时间跟 oneDate 比较
 
 @param oneDate nil
 
 @return    0 表示时间相同，
 1 表示 oneDay 比 现在时间 晚
 -1 表示 oneDay 比 现在时间 早
 */
+ (int)compareWithNow:(NSDate *)oneDate;


/**
 比较当前时间 是否在 oneDate 和twoDate之间 (包含等于)
 
 @param earlyDate oneDate
 @param laterDate twoDate
 @return bool
 */
+ (BOOL)compareWithNow:(NSDate *)earlyDate between:(NSDate *)laterDate;


/**
 在时间数组中判断，当前时间是在哪个时间段以内

 @param dates 时间数组
 @return 当前时间段的的开始时间，如果不在范围内 返回 nsnull
 */
+ (NSDate *)compareBetween:(NSArray <NSDate *> *)dates;

@end
