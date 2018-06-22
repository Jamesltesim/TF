//
//  TFUtils+Date.m
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFUtils+Date.h"

@implementation TFUtils (Date)

+ (NSDate *)compareBetween:(NSArray<NSDate *> *)dates{

    NSDate *first = dates[0];
    NSDate *last = dates.lastObject;
    
    if( [self compareWithNow:first between:last]){
        
        for(int i=1;i<dates.count;i++){
            NSDate * tmp= dates[i-1];
            if([self compareWithNow:tmp between:dates[i]]){
                return tmp;
            }
        }
        
    }
    
    return nil;
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

@end
