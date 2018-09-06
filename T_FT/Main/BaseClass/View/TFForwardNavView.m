//
//  TFForwardNavView.m
//  T_FT
//
//  Created by James on 2018/7/27.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFForwardNavView.h"

@interface TFForwardNavView()

@property (nonatomic,strong) UIView *contentBackgroundView;
@property (nonatomic,strong) UIView *clearBackgroundView;

@property(nonatomic,strong) UIImageView *backButton;


@end

@implementation TFForwardNavView


- (instancetype)init
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self = [super initWithFrame:CGRectMake(0, 0,width , NAV_HEIGHT)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.contentBgView = [[TFContentBackgroundView alloc]initWithFrame:self.bounds];
        self.clearBgView = [[TFClearBackgroundView alloc]initWithFrame:self.bounds];
        
        [self addSubview:self.contentBgView];
        [self addSubview:self.clearBgView];

    }
    return self;
}

- (void)scrollToChangeAlpha:(CGFloat)alpha{
    self.contentBgView.alpha = alpha;
    self.clearBgView.alpha = 1-alpha;
}

- (void)addBackButtonWithTarget:(id)target action:(SEL)action{
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = 25.0;
    back.frame = CGRectMake(10, 0, width, width);
    back.center = CGPointMake(10+width/2, (self.height- STATUSVIEW_HEIGHT)/2+STATUSVIEW_HEIGHT);
    [back addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width,width)];
    imgV.image = [UIImage imageNamed:@"back"];
    imgV.center = CGPointMake(back.frame.size.width/2, back.frame.size.height/2);
    [back addSubview:imgV];
    

    
    UIButton *back1 = [UIButton buttonWithType:UIButtonTypeCustom];
    back1.frame = CGRectMake(10, 0, width, width);
    back1.center = CGPointMake(10+width/2, (self.height- STATUSVIEW_HEIGHT)/2+STATUSVIEW_HEIGHT);
    [back1 addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imgV1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width,width)];
    imgV1.center = CGPointMake(back.frame.size.width/2, back.frame.size.height/2);
    imgV1.image = [UIImage imageNamed:@"back"];
    [back1 addSubview:imgV1];
    
    [self.contentBgView addSubview:back];
    [self.clearBgView addSubview:back1];
}

- (void)addRightButtonWithTarget:(id)target action:(SEL)action backgroundImage:(UIImage *)image{
    
}
@end


@implementation TFContentBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 0;
    }
    return self;
}

@end

@implementation TFClearBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end

