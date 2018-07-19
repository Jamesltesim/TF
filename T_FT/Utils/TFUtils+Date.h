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
 @return 当前时间段的的开始时间，如果不在范围内 返回 -1
 */
+ (int)compareBetween:(NSArray <NSDate *> *)dates;


//  年月日
// yyyy-MM-dd HH:mm:ss 需要满足这种格式
+ (NSString *)getCurrentYearAndMonthAndDay;

+ (NSDate *)dateFromString:(NSString *)dateString;


/**************************************************************************************/

/**
 得到从今天开始 三天的 星期、月、日

 @[@{@"week":@"星期二",@"month":@"12",@"day":@"30"},@{},@{}]
 @return return value description
 */
+ (NSArray <NSDictionary *>*)getThreeDaysFromToday;



/**
 得到从当前时间开始到 今天关业之前 时间段的集合
 时间段为 每隔15分钟

 @param openTime 开业时间 （9:00）
 @param closeTime 关业时间 （20:00）
 @param time      送餐需要花费的时间 (默认一小时)
 @return return value description
 */
+ (NSArray<NSArray<NSString *> *> *)get_today_Interval_withOpenTime:(NSString *)openTime closeTime:(NSString *)closeTime deliveryTime:(NSInteger)deliveryTime;
@end
