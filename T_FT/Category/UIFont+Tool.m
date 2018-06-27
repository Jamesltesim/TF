//
//  UIFont+Tool.m
//  T_FT
//
//  Created by James on 2018/6/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UIFont+Tool.h"

@implementation UIFont (Tool)

+ (nullable UIFont *)getFontSizeWithType:(TGFontType)fontType size:(CGFloat)fontSize {
    
    UIFont *font;
    
    switch (fontType) {
        case TGFontTypeOne:
            font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:fontSize];
            break;
        case TGFontTypeTwo:
            font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:fontSize];
            
            break;
        case TGFontTypeThree:
            font = [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
            
            break;
        case TGFontTypeFour:
            font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
            
            break;
        case TGFontTypeFive:
            font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize];
            
            break;
        case TGFontTypeSix:
            font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize];
            
            break;
            
        default:
            font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
            
            break;
    }
    
    return font;
}


@end
