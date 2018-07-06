//
//  UIImage+imgaeWithColor.h
//  5-个人详情页
//
//  Created by gouzi on 2017/5/21.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (imgaeWithColor)

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  对图片进行模糊
 *
 *  @param image 要处理图片
 *  @param blur  模糊系数 (0.0-1.0)
 *
 *  @return 处理后的图片
 */
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;



@end
