
//
//  ConvertBannerHeaderView.m
//  T_FT
//
//  Created by James on 2018/9/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ConvertBannerHeaderView.h"
#import "ConvertHeaderView.h"

@interface ConvertBannerHeaderView()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *jifenLab;
@property (nonatomic,strong) UILabel *availableJifenLab;
@property (nonatomic,strong) UIImageView *levelImageView;

@property (nonatomic,strong) UIView *backgroundView;

//@property (nonatomic)        NSInteger level;
@end

@implementation ConvertBannerHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 208)];
//        _backgroundView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_backgroundView];
        
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 125, 125)];
        _imageView.backgroundColor = [UIColor purpleColor];
        _imageView.center = CGPointMake(_backgroundView.width/2, 125.0/2);
        [self.backgroundView addSubview:_imageView];
        
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, _imageView.bottom, 200, 45)];
        _titleLab.text = @"欧乐B电动牙刷";
        [self addSubview:_titleLab];
        
        _jifenLab = [[UILabel alloc]initWithFrame:CGRectMake(_titleLab.left, _titleLab.bottom, _titleLab.width, 35)];
        _jifenLab.text = @"需要积分：10000";
        [self addSubview:_jifenLab];
        
        _availableJifenLab = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width-200 -10, _jifenLab.top, 200, 35)];
        _availableJifenLab.text = @"可用积分: 100000";
        _availableJifenLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_availableJifenLab];
        
        
        
        ConvertHeaderView *headerView = [[ConvertHeaderView alloc]initWithFrame:CGRectMake(0, _backgroundView.bottom, frame.size.width, 40) title:title];
        [self addSubview:headerView];
    }
    return self;
}
/*
// Only override drawRect: if you perfYorm custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
