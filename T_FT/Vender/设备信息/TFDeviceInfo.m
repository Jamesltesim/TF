//
//  TFDeviceInfo.m
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//



#import "TFDeviceInfo.h"
#import "TBKeyChain.h"

@implementation TFDeviceInfo

- (CGSize)screenSize{
    return [UIScreen mainScreen].bounds.size;
}

- (NSString *)uuid{
    NSString * strUUID = (NSString *)[TBKeyChain load:KEY_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain  @"com.company.app.usernamepassword"
        [TBKeyChain save:KEY_PASSWORD data:strUUID];
        
    }
    return strUUID;
}

- (NSString *)ip{
    return @"";
}

- (NSString *)systemLanguage{
    //获取当前设备语言
    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    return  [appLanguages objectAtIndex:0];
}

- (NSString *)currentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

@end
