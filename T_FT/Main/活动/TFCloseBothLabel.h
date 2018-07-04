//
//  TFCloseBothLabel.h
//  T_FT
//
//  Created by James on 2018/7/3.
//  Copyright © 2018年 James. All rights reserved.
//







// 两个label上下紧挨着排列，根据字体大小自动设置高度

#import <UIKit/UIKit.h>

@interface TFCloseBothLabel : UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *hint;

@property (nonatomic,strong) UIFont *titleFont;
@property (nonatomic,strong) UIFont *hintFont;

@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor *hintColor;

@property (nonatomic) NSInteger numberOfLinesForTitle;
@property (nonatomic) NSInteger numberOfLinesForHint;

//默认 居中
@property (nonatomic) NSTextAlignment textAlignment;

@end
