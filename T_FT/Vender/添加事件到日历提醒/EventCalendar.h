//
//  EventCalendar.h
//  app添加到手机日历提醒事件
//
//  Created by 刘燕鲁 on 16/12/27.
//  Copyright © 2016年 刘燕鲁. All rights reserved.
//


//使用方法

//ps:在ios10以后,对于使用系统自带的隐私数据,比如相机,日历等,需要添加权限通知,这里只用到日历,只需要在xcode中的info.plist中添加上下面这句话,不然统会crash.
//
//<key>NSCalendarsUsageDescription</key>
//<string>App需要您的同意,才能访问日历</string>
//三: 实际使用,在你的项目中把EventCalendar导入要实现的地方即可.下图是demo中实现的实现.


//EventCalendar *calendar = [EventCalendar sharedEventCalendar];
//
//[calendar createEventCalendarTitle:@"极速现金侠还款提醒" location:@"1000元欠款" startDate:[NSDate dateWithTimeInterval:3600 sinceDate:[NSDate date]] endDate:[NSDate dateWithTimeInterval:7200 sinceDate:[NSDate date]] allDay:NO alarmArray:@[@"-3000"]];




#import <Foundation/Foundation.h>

@interface EventCalendar : NSObject
+ (instancetype)sharedEventCalendar;

/**
 *  将App事件添加到系统日历提醒事项，实现闹铃提醒的功能
 
 
  [calendar createEventCalendarTitle:@"极速现金侠还款提醒" location:@"1000元欠款" startDate:[NSDate dateWithTimeInterval:3600 sinceDate:[NSDate date]] endDate:[NSDate dateWithTimeInterval:7200 sinceDate:[NSDate date]] allDay:NO alarmArray:@[@"-3000"]];
     //-3000 提前50分钟
 *
 *  @param title      事件标题
 *  @param location   事件位置
 *  @param startDate  开始时间
 *  @param endDate    结束时间
 *  @param allDay     是否全天
 *  @param alarmArray 闹钟集合
 
 */
- (void)createEventCalendarTitle:(NSString *)title location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate allDay:(BOOL)allDay alarmArray:(NSArray *)alarmArray;

@end
