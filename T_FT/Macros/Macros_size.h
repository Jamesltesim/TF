//
//  Macros_size.h
//  T_FT
//
//  Created by xian on 2018/7/13.
//  Copyright © 2018年 James. All rights reserved.
//

//iPhone X
#define iPhoneX             ([[UIScreen mainScreen] bounds].size.width == 375.f && [[UIScreen mainScreen] bounds].size.height == 812.f)
#define STATUSVIEW_HEIGHT   (iPhoneX ? 44.f : 20.f)

#define NAV_HEIGHT          (STATUSVIEW_HEIGHT + 44)

#define TABNAR_HEIGHT 48
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

#define CONTENT_HEIGHT_NO_BAR_HERGHT     (iPhoneX ? [[UIScreen mainScreen] bounds].size.height - NAV_HEIGHT - HOME_INDICATOR_HEIGHT : [[UIScreen mainScreen] bounds].size.height - NAV_HEIGHT)
#define CONTENT_HEIGHT_WITH_BAR_HERGHT     (iPhoneX ? [[UIScreen mainScreen] bounds].size.height - NAV_HEIGHT - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT: [[UIScreen mainScreen] bounds].size.height - NAV_HEIGHT - TABNAR_HEIGHT)


#define RECT_NAVBAR_AND_TABBAR          CGRectMake(0, NAV_HEIGHT, [[UIScreen mainScreen] bounds].size.width, CONTENT_HEIGHT_WITH_BAR_HERGHT)
#define RECT_NAVBAR_AND_NOTABBAR        CGRectMake(0, NAV_HEIGHT, [[UIScreen mainScreen] bounds].size.width, CONTENT_HEIGHT_NO_BAR_HERGHT)
#define RECT_NAVBAR_AND_NOTABBAR_REMOVEHEIGHT(height)       CGRectMake(0, NAV_HEIGHT, [[UIScreen mainScreen] bounds].size.width, CONTENT_HEIGHT_NO_BAR_HERGHT - height)

#define RECT_NONAVBAR_AND_TABBAR        CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, CONTENT_HEIGHT_WITH_BAR_HERGHT + NAV_HEIGHT)


#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
