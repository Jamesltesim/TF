//
//  UIView+UITapGestureRecognizer.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UIView+UITapGestureRecognizer.h"

@implementation UIView (UITapGestureRecognizer)

//- (void)addGestureRecognizerWithAction:(SEL)action{
//    [self addGestureRecognizerWithTarget:self action:action];
//}

- (void)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    
    [self addGestureRecognizer:tap];
}
@end
