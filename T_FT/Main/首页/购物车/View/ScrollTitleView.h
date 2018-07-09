//
//  ScrollTitleView.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollTitleViewDelegate;

@interface ScrollTitleView : UIView

@property (nonatomic,strong) id<ScrollTitleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@end

@protocol ScrollTitleViewDelegate<NSObject>

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtIndex:(NSInteger)index;

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtTitle:(NSString *)title;

@end
