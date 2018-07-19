//
//  TFUtils+Date.m
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFUtils+Date.h"

@implementation TFUtils (Date)

+ (int)compareBetween:(NSArray<NSDate *> *)dates{

    NSDate *first = dates[0];
    NSDate *last = dates.lastObject;
    
    if( [self compareWithNow:first between:last]){
        
        for(int i=1;i<dates.count;i++){
            NSDate * tmp= dates[i-1];
            if([self compareWithNow:tmp between:dates[i]]){
                return i-1;
            }
        }
        
    }
    
    return -1;
}

+ (BOOL)compareWithNow:(NSDate *)earlyDate between:(NSDate *)laterDate{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:earlyDate];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:laterDate];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    
    if([[NSDate date]compare:dateA] == NSOrderedAscending || [[NSDate date]compare:dateB] == NSOrderedDescending){
        return NO;
    }
    return YES;
}

+ (int)compareWithNow:(NSDate *)oneDate{
    return [self compareOneDay:oneDate withAnotherDay:[NSDate date]];
}

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay比 anotherDay时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay比 anotherDay时间早");
        return -1;
    }
    //NSLog(@"两者时间是同一个时间");
    return 0;
    
}

+ (NSString *)getCurrentYearAndMonthAndDay{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//东八区时间
    fmt.dateFormat = @"yyyy-MM-dd";
    return [fmt stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString{
    // 时间字符串
//    NSString *string = @"2016-10-03 14:01:00";
    
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//东八区时间
    // 设置日期格式(为了转换成功)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:dateString];
    return date;
}


/********************************************************************************************/

+ (NSArray<NSDictionary *> *)getThreeDaysFromToday{
    NSArray *array = @[];
    
    NSDate *今天 = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//东八区时间
    fmt.dateFormat = @"MM-dd";
    
    NSString *today = [fmt stringFromDate:今天];
    NSString *week_today = [self weekdayStringFromDate:今天];
    NSString*today_month = [today componentsSeparatedByString:@"-"][0];
    NSString*today_day = [today componentsSeparatedByString:@"-"][1];
    
    
    //明天
    NSDate *明天 = [self getTomorrowDay:今天];
    NSString *tomorrow = [fmt stringFromDate:明天];
     NSString *week_tomorrow = [self weekdayStringFromDate:明天];
    NSString*tomorrow_month = [tomorrow componentsSeparatedByString:@"-"][0];
    NSString*tomorrow_day = [tomorrow componentsSeparatedByString:@"-"][1];
    //后天
    NSDate *后天 = [self getTomorrowDay:明天];
    NSString *theDayAfterTomorrow = [fmt stringFromDate:后天];
     NSString *week_theDayAfterTomorrow = [self weekdayStringFromDate:后天];
    
    NSString*theDayAfterTomorrow_month = [theDayAfterTomorrow componentsSeparatedByString:@"-"][0];
    NSString*theDayAfterTomorrow_day = [theDayAfterTomorrow componentsSeparatedByString:@"-"][1];
    
    
    array = @[@{@"week":week_today,@"month":[self capitalFromLower:today_month],@"day":today_day},
              @{@"week":week_tomorrow,@"month":[self capitalFromLower:tomorrow_month],@"day":tomorrow_day},
              @{@"week":week_theDayAfterTomorrow,@"month":[self capitalFromLower:theDayAfterTomorrow_month],@"day":theDayAfterTomorrow_day}];
    return array;
}

/**
 
 传入今天的时间，返回明天的时间
 
 @param aDate 当前的时间NSDate类型，上面的方法可获取当前时间的NSDate类型
 
 @return 明天时间
 
 */

+ (NSDate *)getTomorrowDay:(NSDate *)aDate {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday |NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    
    [dateday setDateFormat:@"MM-dd"];
    
//    return [dateday stringFromDate:beginningOfWeek];
    return beginningOfWeek;
}



/**
 月份 字符串转换
 07月 -> 七月

 @param month month description
 @return return value description
 */
+ (NSString *)capitalFromLower:(NSString *)month{
    NSString *capital = @"";
    if([month isEqualToString:@"01"]){
        capital = @"一月";
    }
    if([month isEqualToString:@"02"]){
        capital = @"二月";
    }
    if([month isEqualToString:@"03"]){
        capital = @"三月";
    }
    if([month isEqualToString:@"04"]){
        capital = @"四月";
    }
    if([month isEqualToString:@"05"]){
        capital = @"五月";
    }
    if([month isEqualToString:@"06"]){
        capital = @"六月";
    }
    if([month isEqualToString:@"07"]){
        capital = @"七月";
    }
    if([month isEqualToString:@"08"]){
        capital = @"八月";
    }
    if([month isEqualToString:@"09"]){
        capital = @"九月";
    }
    if([month isEqualToString:@"10"]){
        capital = @"十月";
    }
    if([month isEqualToString:@"11"]){
        capital = @"十一月";
    }
    if([month isEqualToString:@"12"]){
        capital = @"十二月";
    }
    
    return capital;
}


/**
 根据时间返回当前是星期几

 @param inputDate date
 @return return 星期
 */
+(NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/SuZhou"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


/********************************************************************************************/

+ (NSArray<NSArray<NSString *> *> *)get_today_Interval_withOpenTime:(NSString *)openTime closeTime:(NSString *)closeTime deliveryTime:(NSInteger)deliveryTime{
    
    if(deliveryTime == 0){
        deliveryTime = (60*60);
    }
    
    NSInteger oneHour = (60*60);
    
    NSInteger open_hour = [[openTime componentsSeparatedByString:@":"][0] integerValue];
    NSInteger open_minute = [[openTime componentsSeparatedByString:@":"][1] integerValue];
    NSInteger close_hour = [[closeTime componentsSeparatedByString:@":"][0] integerValue];
    NSInteger close_minute = [[closeTime componentsSeparatedByString:@":"][1] integerValue];
    
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970] + deliveryTime;// *1000 是精确到毫秒，不乘就是精确到秒
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    NSInteger hour = [[currentDateStr componentsSeparatedByString:@":"][0] integerValue];
    NSInteger minute = [[currentDateStr componentsSeparatedByString:@":"][1] integerValue];
    
    if(hour < open_hour){
        //没开业
    }else if (hour > close_hour){
        //当天关业之前 可能不能送达
    }else{
        if(minute < 15){
            minute =0;
        }else if (minute>15 && minute < 30){
            minute = 15;
        }else if (minute>30 && minute <45){
            minute =30;
        }else if (minute >45 && minute <60){
//            hour ++;
            minute =45;
        }
    }
    
    NSMutableArray *marr1 = [[NSMutableArray alloc]initWithCapacity:0];
    //今天
    for(NSInteger i=hour;i<=close_hour-deliveryTime/oneHour;i++){
        for(NSInteger j=0;j<60;j+=15){
            
            if(i == hour && j >= minute){
                if(marr1.count == 0){
                    [marr1 addObject:@"现在"];
                    continue;
                }
                if(j == 0){
                    [marr1 addObject:[NSString stringWithFormat:@"%ld:%ld0",i,j]];
                }else{
                    [marr1 addObject:[NSString stringWithFormat:@"%ld:%ld",i,j]];
                }
            }else if(i > hour){
                if(j == 0){
                    [marr1 addObject:[NSString stringWithFormat:@"%ld:%ld0",i,j]];
                }else{
                    [marr1 addObject:[NSString stringWithFormat:@"%ld:%ld",i,j]];
                }
            }
        }
    }
    
    //明天
    NSMutableArray *marr2 = [[NSMutableArray alloc]initWithCapacity:0];
    for(NSInteger i=open_hour;i<=close_hour-deliveryTime/oneHour;i++){
        for(NSInteger j=open_minute;j<60;j+=15){
            
            if(j == 0){
                [marr2 addObject:[NSString stringWithFormat:@"%ld:%ld0",i,j]];
            }else{
                [marr2 addObject:[NSString stringWithFormat:@"%ld:%ld",i,j]];
            }
            
//            NSLog(@"%ld:%ld",i,j);
        }
    }
    return @[marr1,marr2,marr2];
}

@end
