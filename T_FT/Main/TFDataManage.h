//
//  TFDataManager.h
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFDeviceInfo.h"
#import "TFAPPInfo.h"

@interface TFDataManage : NSObject

@property (nonatomic,strong) TFAPPInfo *appInfo;
@property (nonatomic,strong) TFDeviceInfo *deviceInfo;

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *userID;

/*
 {
 uuid  : XXXXX
 启动时间 : XX
 结束时间 : XX
 结束时间 :
 app版本 :
 设备类型 :
 ip地址  :
 网络状态 :
 
 log记录:[
 
        @{time   :XXX
        日志类型 :
        action：xx
        }
 
        @{time   :XXX
        日志类型 :
        action：xx
        }
    ]
 }
 
 */
@property (nonatomic,strong,readonly) NSMutableDictionary *dataLog;

+ (TFDataManage *)manager;

//程序加载完毕
- (void)didFinishLaunching;

- (void)applicationDidBecomeActive;
//程序进入后台
- (void)applicationDidEnterBackground;

// 程序失去焦点
- (void)applicationWillResignActive;

//程序从后台回到前台
- (void)applicationWillEnterForeground;

//程序内存警告，可能要终止程序
- (void)applicationDidReceiveMemoryWarning;

//程序即将退出
- (void)applicationWillTerminate;



@end
