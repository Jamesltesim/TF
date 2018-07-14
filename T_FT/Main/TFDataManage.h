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

+ (TFDataManage *)manager;
@end
