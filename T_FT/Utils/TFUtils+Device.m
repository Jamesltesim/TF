//
//  TFUtils+Device.m
//  T_FT
//
//  Created by James on 2018/7/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFUtils+Device.h"
#import <sys/utsname.h>

@implementation TFUtils (Device)

+ (TFScreenSize)deviceScreenSize{
    // iPhone4
    if ([UIScreen mainScreen].bounds.size.height == 480.0) return TFScreenSize_3_5;
    // iPhone5
    if ([UIScreen mainScreen].bounds.size.height == 568.0) return TFScreenSize_4_0;
    // iPhone6
    if ([UIScreen mainScreen].bounds.size.height == 667.0) return TFScreenSize_4_7;
    // iPhone6p
    if ([UIScreen mainScreen].bounds.size.height == 736.0) return TFScreenSize_5_5;
    // iPhone x
    if ([UIScreen mainScreen].bounds.size.height == 812.0) return TFScreenSize_5_8;
    return TFUnknown;
}

+ (TFDeviceType)deviceType{
    
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    
    //simulator
    //------------------------------Samulitor------------------------------------
    
    if ([platform isEqualToString:@"i386"])          return Simulator;
    if ([platform isEqualToString:@"x86_64"])        return Simulator;
    
    //iPhone
    //------------------------------iPhone---------------------------
    if ([platform isEqualToString:@"iPhone1,1"])     return IPhone_1G;
    if ([platform isEqualToString:@"iPhone1,2"])     return IPhone_3G;
    if ([platform isEqualToString:@"iPhone2,1"])     return IPhone_3GS;
    if ([platform isEqualToString:@"iPhone3,1"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone3,2"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone4,1"])     return IPhone_4s;
    if ([platform isEqualToString:@"iPhone5,1"])     return IPhone_5;
    if ([platform isEqualToString:@"iPhone5,2"])     return IPhone_5;
    if ([platform isEqualToString:@"iPhone5,3"])     return IPhone_5C;
    if ([platform isEqualToString:@"iPhone5,4"])     return IPhone_5C;
    if ([platform isEqualToString:@"iPhone6,1"])     return IPhone_5S;
    if ([platform isEqualToString:@"iPhone6,2"])     return IPhone_5S;
    if ([platform isEqualToString:@"iPhone7,1"])     return IPhone_6P;
    if ([platform isEqualToString:@"iPhone7,2"])     return IPhone_6;
    if ([platform isEqualToString:@"iPhone8,1"])     return IPhone_6s;
    if ([platform isEqualToString:@"iPhone8,2"])     return IPhone_6s_P;
    if ([platform isEqualToString:@"iPhone8,4"])     return IPhone_SE;
    if ([platform isEqualToString:@"iPhone9,1"])     return IPhone_7;
    if ([platform isEqualToString:@"iPhone9,3"])     return IPhone_7;
    if ([platform isEqualToString:@"iPhone9,2"])     return IPhone_7P;
    if ([platform isEqualToString:@"iPhone9,4"])     return IPhone_7P;
    if ([platform isEqualToString:@"iPhone10,1"])    return IPhone_8;
    if ([platform isEqualToString:@"iPhone10,4"])    return IPhone_8;
    if ([platform isEqualToString:@"iPhone10,2"])    return IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,5"])    return IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,3"])    return IPhone_X;
    if ([platform isEqualToString:@"iPhone10,6"])    return IPhone_X;
    
    //------------------------------iPad--------------------------
//    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad";
//    if ([platform isEqualToString:@"iPad2,1"] ||
//        [platform isEqualToString:@"iPad2,2"] ||
//        [platform isEqualToString:@"iPad2,3"] ||
//        [platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
//    if ([platform isEqualToString:@"iPad3,1"] ||
//        [platform isEqualToString:@"iPad3,2"] ||
//        [platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
//    if ([platform isEqualToString:@"iPad3,4"] ||
//        [platform isEqualToString:@"iPad3,5"] ||
//        [platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
//    if ([platform isEqualToString:@"iPad4,1"] ||
//        [platform isEqualToString:@"iPad4,2"] ||
//        [platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
//    if ([platform isEqualToString:@"iPad5,3"] ||
//        [platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
//    if ([platform isEqualToString:@"iPad6,3"] ||
//        [platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7-inch";
//    if ([platform isEqualToString:@"iPad6,7"] ||
//        [platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9-inch";
//    if ([platform isEqualToString:@"iPad6,11"] ||
//        [platform isEqualToString:@"iPad6,12"]) return @"iPad 5";
//    if ([platform isEqualToString:@"iPad7,1"] ||
//        [platform isEqualToString:@"iPad7,2"]) return @"iPad Pro 12.9-inch 2";
//    if ([platform isEqualToString:@"iPad7,3"] ||
//        [platform isEqualToString:@"iPad7,4"]) return @"iPad Pro 10.5-inch";
//
//    //------------------------------iPad Mini-----------------------
//    if ([platform isEqualToString:@"iPad2,5"] ||
//        [platform isEqualToString:@"iPad2,6"] ||
//        [platform isEqualToString:@"iPad2,7"]) return @"iPad mini";
//    if ([platform isEqualToString:@"iPad4,4"] ||
//        [platform isEqualToString:@"iPad4,5"] ||
//        [platform isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
//    if ([platform isEqualToString:@"iPad4,7"] ||
//        [platform isEqualToString:@"iPad4,8"] ||
//        [platform isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
//    if ([platform isEqualToString:@"iPad5,1"] ||
//        [platform isEqualToString:@"iPad5,2"]) return @"iPad mini 4";
//
//    //------------------------------iTouch------------------------
//    if ([platform isEqualToString:@"iPod1,1"]) return @"iTouch";
//    if ([platform isEqualToString:@"iPod2,1"]) return @"iTouch2";
//    if ([platform isEqualToString:@"iPod3,1"]) return @"iTouch3";
//    if ([platform isEqualToString:@"iPod4,1"]) return @"iTouch4";
//    if ([platform isEqualToString:@"iPod5,1"]) return @"iTouch5";
//    if ([platform isEqualToString:@"iPod7,1"]) return @"iTouch6";
    
    
    return Unknown;
    
}


@end
