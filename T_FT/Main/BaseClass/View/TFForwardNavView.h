//
//  TFForwardNavView.h
//  T_FT
//
//  Created by James on 2018/7/27.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>


//@property (nonatomic,strong) UIView *contentBackgroundView;
//@property (nonatomic,strong) UIView *clearBackgroundView;


@interface TFContentBackgroundView : UIView

@property (nonatomic,strong) UIImageView *backBtton;

@end


@interface TFClearBackgroundView : UIView

@property (nonatomic,strong) UIImageView *backBtton;

@end

@interface TFForwardNavView : UIView

@property (nonatomic,strong) TFContentBackgroundView *contentBgView;
@property (nonatomic,strong) TFClearBackgroundView *clearBgView;


/**
 滚动 改变contentView 和 clearView的alpha值

 @param alpha alpha description
 */
- (void)scrollToChangeAlpha:(CGFloat)alpha;

- (void)addBackButtonWithTarget:(id)target action:(SEL)action;

@end
