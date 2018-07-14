//
//  TFAPPInfo.m
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPPInfo.h"

@implementation TFAPPInfo

- (NSString *)appVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];//获取项目版本
}
@end
