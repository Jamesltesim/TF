//
//  MeNavView.h
//  T_FT
//
//  Created by James on 2018/6/18.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFNavView : UIView

@property (nonatomic,strong) UIImage *backImage;
@property (nonatomic,strong) NSString *title;
//
@property (nonatomic) BOOL hidenBottomLine;  //defuit No

//0 ~ 1
@property (nonatomic) CGFloat bottomLineAlpha;

//隐藏底部线，背景色 title字体颜色
@property (nonatomic) BOOL clearColor;
@property (nonatomic,strong) UIColor *titleColor;



- (void)addLeftButtonWithAction:(SEL)action;
- (void)addLeftButtonWithTarget:(id)target action:(SEL)action;

- (void)addTapGestureOnTitleWithTarget:(id)target action:(SEL)action;
+ (instancetype)creatNavView;


@end
