//
//  TFAPPInfo.h
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//


/*
 
 当前app版本号
 build 号
 bundle id
 
 
 */



#import <Foundation/Foundation.h>

@interface TFAPPInfo : NSObject

@property (nonatomic,strong,readonly) NSString *appVersion;
@property (nonatomic,strong,readonly) NSString *buildCode;
@property (nonatomic,strong,readonly) NSString *bundleIdentifier;

@end
