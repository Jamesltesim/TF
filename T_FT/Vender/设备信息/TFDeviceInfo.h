//
//  TFDeviceInfo.h
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//




/*
 手机屏幕尺寸
 手机型号 （iphone6 iphone 7plus，iphone X）
 手机唯一设备码 uuid
 手机 ip
 系统语言
 当前时间
 当前屏幕亮度
 */


#import <Foundation/Foundation.h>

@interface TFDeviceInfo : NSObject

@property (nonatomic,readonly) CGSize screenSize;
//手机型号
@property (nonatomic,strong,readonly) NSString *phoneModel;
@property (nonatomic,strong,readonly) NSString *uuid;
@property (nonatomic,strong,readonly) NSString *ip;
@property (nonatomic,strong,readonly) NSString *systemLanguage;
@property (nonatomic,strong,readonly) NSString *currentTime;

//当前屏幕亮度
@property (nonatomic,readonly)        CGFloat brightness;

@end
