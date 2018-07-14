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
 
 当前网络情况 （4g wifi 等）
 */


#import <Foundation/Foundation.h>
#import "Reachability.h"


@interface TFDeviceInfo : NSObject

@property (nonatomic,readonly) CGSize screenSize;
//手机型号
@property (nonatomic,strong,readonly) NSString *phoneModel;
@property (nonatomic,strong,readonly) NSString *uuid;

#warning ip未实现
//未实现
@property (nonatomic,strong,readonly) NSString *ip;
@property (nonatomic,strong,readonly) NSString *systemLanguage;
@property (nonatomic,strong,readonly) NSString *currentTime;

@property (nonatomic,readonly) NetworkStatus remoteHostNetworkStatus;
@property (nonatomic,readonly) NetworkStatus internetConnectionStatus;

//typedef enum : NSInteger {
//    NotReachable = 0,
//    ReachableViaWiFi,
//    ReachableViaWWAN
//} NetworkStatus;
//当前屏幕亮度
@property (nonatomic,readonly)        CGFloat brightness;

+ (NSString *)getCurrentTime;

@end
