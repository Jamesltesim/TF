//
//  TFUtils+UIColor.h
//  T_FT
//
//  Created by xian on 2018/7/8.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFUtils.h"

@interface TFUtils (UIColor)
/* 从十六进制字符串获取颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/* 从十六进制字符串获取颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
