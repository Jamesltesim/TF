//
//  ShoppingCarDelegate.h
//  T_FT
//
//  Created by James on 2018/7/10.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ScrollTitleView;

@protocol ShoppingCarDelegate <NSObject>

@optional
- (void)gotoPay;

//slidefood
- (void)slideCashierViewGotoBillView;

/**
 点击收银台
 */
- (void)cashierDeskTap;

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtIndex:(NSInteger)index;

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtTitle:(NSString *)title;


@end
