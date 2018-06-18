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
        self.backgroundColor = [UIColor clearColor];
        _backImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_backImgView];
    }
    return self;
}
- (void)setBackImage:(UIImage *)backImage{
    
    if(backImage)
    [self.backImgView setImage:backImage];
}

- (void)addLeftButtonWithAction:(SEL)action{
    
}

- (void)addLeftButtonWithTarget:(id)target action:(SEL)action{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
