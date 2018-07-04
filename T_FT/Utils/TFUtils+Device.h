//
//  TFUtils+Device.h
//  T_FT
//
//  Created by James on 2018/7/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFUtils.h"


typedef NS_ENUM(NSInteger,TFDeviceType) {
    
    Unknown = 0,
    Simulator,
    IPhone_1G,          //基本不用
    IPhone_3G,          //基本不用
    IPhone_3GS,         //基本不用
    IPhone_4,           //基本不用
    IPhone_4s,          //基本不用
    IPhone_5,
    IPhone_5C,
    IPhone_5S,
    IPhone_SE,
    IPhone_6,
    IPhone_6P,
    IPhone_6s,
    IPhone_6s_P,
    IPhone_7,
    IPhone_7P,
    IPhone_8,
    IPhone_8P,
    IPhone_X,


};


typedef NS_ENUM(NSInteger,TFScreenSize) {
    
    TFUnknown = 0,
    TFScreenSize_Simulator,
    TFScreenSize_3_5,
    TFScreenSize_4_0,
    TFScreenSize_4_7,
    TFScreenSize_5_5,
    TFScreenSize_5_8     //iphone X
    
};


@interface TFUtils (Device)

+ (TFDeviceType)deviceType;

+ (TFScreenSize)deviceScreenSize;


@end
