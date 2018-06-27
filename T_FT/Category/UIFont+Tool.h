//
//  UIFont+Tool.h
//  T_FT
//
//  Created by James on 2018/6/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TGFontType){
    TGFontTypeNomal,
    TGFontTypeOne,
    TGFontTypeTwo,
    TGFontTypeThree,
    TGFontTypeFour,
    TGFontTypeFive,
    TGFontTypeSix,
};

@interface UIFont (Tool)

+ (nullable UIFont *)getFontSizeWithType:(TGFontType)fontType size:(CGFloat)fontSize;

@end
