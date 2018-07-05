//
//  MeNavView.m
//  T_FT
//
//  Created by James on 2018/6/18.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeNavView.h"

@interface MeNavView()

@property (nonatomic,strong) UIImageView *backImgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIView *bottomLine;

@end

@implementation MeNavView


+ (instancetype)creatNavView{
    MeNavView *nav = [[MeNavView alloc]init];
    
    
    return nav;
}

- (instancetype)init
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self = [super initWithFrame:CGRectMake(0, 0,width , NAV_HEIGHT)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _backImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_backImgView];
        
        [self addSubview:self.titleLab];
        [self addSubview:self.bottomLine];
    }
    return self;
}
- (void)setTitle:(NSString *)title{
    if(title)
    self.titleLab.text = title;
}

- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLab.textColor = titleColor;
}

- (void)setHidenBottomLine:(BOOL)hidenBottomLine{
//    _hidenBottomLine = hidenBottomLine;
    self.bottomLine.alpha = (hidenBottomLine == YES?1:0);
}

- (void)setClearColor:(BOOL)clearColor{
    if(clearColor){
        self.backgroundColor = [UIColor clearColor];
        self.titleColor = [UIColor clearColor];
//        self.hidenBottomLine = YES;
        self.bottomLine.alpha = (clearColor == NO?1:0);
    }else{
        self.backgroundColor = [UIColor whiteColor];
        self.titleColor = [UIColor whiteColor];
//        self.hidenBottomLine = NO;
        self.bottomLine.alpha = (clearColor == NO?1:0);
        
    }
  
}

- (void)setBottomLineAlpha:(CGFloat)bottomLineAlpha{
    self.bottomLine.alpha = bottomLineAlpha;
}

- (UIView *)bottomLine{
    if(!_bottomLine){
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.bottom-0.5, self.width, 0.5)];
        _bottomLine.backgroundColor = [UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:0.6];
    }
    return _bottomLine;
}

- (UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, STATUSVIEW_HEIGHT, self.width, self.height-STATUSVIEW_HEIGHT)];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (void)setBackImage:(UIImage *)backImage{
    
    if(backImage)
    [self.backImgView setImage:backImage];
}

- (void)addLeftButtonWithAction:(SEL)action{
    
}

- (void)addLeftButtonWithTarget:(id)target action:(SEL)action{
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat width = 25.0;
    back.frame = CGRectMake(10, 0, width, width);
    back.center = CGPointMake(10+width/2, (self.height- STATUSVIEW_HEIGHT)/2+STATUSVIEW_HEIGHT);
    [back addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:back];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
