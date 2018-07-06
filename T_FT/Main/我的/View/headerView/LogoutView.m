//
//  LogoutView.m
//  T_FT
//
//  Created by James on 2018/7/6.
//  Copyright © 2018年 James. All rights reserved.
//

#import "LogoutView.h"

@interface LogoutView()

@property (nonatomic,strong) UIImageView *headerView;

@end

@implementation LogoutView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headerView];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.headerView.right+10, self.headerView.top, 100, 30)];
        label.text = @"登陆/注册";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        
    }
    return self;
}

- (UIImageView *)headerView{
    if(!_headerView){
        CGFloat width =self.height/3;
        _headerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header"]];
        _headerView.frame = CGRectMake(0, 0, width, width);
        _headerView.center = CGPointMake(20+width/2, self.height/2);
        
        
//        //  把头像设置成圆形
//        _headerView.layer.cornerRadius=_headerView.width/2;//裁成圆角
//        _headerView.layer.masksToBounds=YES;//隐藏裁剪掉的部分
//        //  给头像加一个圆形边框
//        _headerView.layer.borderWidth = 1.5f;//宽度
//        _headerView.layer.borderColor = [UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:0.6].CGColor;//颜色
        
    }
    return _headerView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
