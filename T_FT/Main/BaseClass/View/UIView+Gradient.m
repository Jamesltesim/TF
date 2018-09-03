//
//  UIView+Gradient.m
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)gradualColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.frame = self.bounds;
//    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
