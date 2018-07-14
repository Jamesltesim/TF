//
//  UINavigationController+StatusBar.m
//  T_FT
//
//  Created by xian on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}

@end
