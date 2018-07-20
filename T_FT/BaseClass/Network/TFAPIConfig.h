//
//  TFAPIConfig.h
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TFAPIConfigNetworkType) {
    TFAPIConfigNetworkTypeNone,
     TFAPIConfigNetworkTypeLocal,
    TFAPIConfigNetworkTypeTest,
    TFAPIConfigNetworkTypePublish NS_ENUM_AVAILABLE_IOS(8_0)
};

@interface TFAPIConfig : NSObject

@property (nonatomic,readonly) TFAPIConfigNetworkType networkType;

+(instancetype)shareInstance;

-(void)networkType:(TFAPIConfigNetworkType)type;
@end
