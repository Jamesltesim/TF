//
//  UIView+UITapGestureRecognizer.h
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UITapGestureRecognizer)

//- (void)addGestureRecognizerWithAction:(SEL)action;

- (void)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action;

@end
