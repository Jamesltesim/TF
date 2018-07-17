//
//  macros_color.h
//  T_FT
//
//  Created by James on 2018/7/17.
//  Copyright © 2018年 James. All rights reserved.
//

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]


// 十六进制颜色
// 调用
//UIColor *redColor = COLOR_WITH_HEX(0xe4e5e5);
#define RGB_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]







#define THEME_BACKGROUND_VIEW_GRAY [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1]
#define THEME_COLOR_RED [UIColor colorWithRed:234/255.0 green:52/255.0 blue:107/255.0 alpha:1]

#define THEME_FONT_COLOR_GRAY RGBA(191,191,191,1)
#define THEME_FONT_COLOR_BLACK RGBA(51,51,51,1)


