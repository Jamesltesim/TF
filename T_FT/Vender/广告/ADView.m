//
//  ADView.m
//  T_FT
//
//  Created by James on 2018/6/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ADView.h"

@implementation ADView

- (instancetype)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:0.7];
        
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
        imgView.frame = CGRectMake(0, 0, 230, 280);
        imgView.center = CGPointMake(self.center.x, self.center.y+20);
        
        [self addSubview:imgView];
        
        
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        close.frame = CGRectMake(0, 0, 44, 44);
        close.center = CGPointMake(self.center.x, imgView.bottom  + 100);
        [close setBackgroundImage:[UIImage imageNamed:@"ad_close"] forState:UIControlStateNormal];
        [close addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:close];
    }
    return self;
}

- (void)closeAction{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
