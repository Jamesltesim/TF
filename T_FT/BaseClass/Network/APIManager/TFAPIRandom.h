//
//  TFAPIRandom.h
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFAPIRandom : NSObject

//生成 人民币 金额
+ (CGFloat)randomRMB;

//生成指定长度的中文字符串
+ (NSMutableString*)randomCreatChinese:(NSInteger)count;

//生成指定长度的英文字符串
+(NSString *)randomStringWithLength:(NSInteger)len;

@end
