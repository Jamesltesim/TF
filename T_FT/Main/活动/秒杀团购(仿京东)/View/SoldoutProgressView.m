//
//  SoldoutProgressView.m
//  T_FT
//
//  Created by James on 2018/6/22.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SoldoutProgressView.h"
#import "Masonry.h"

@interface SoldoutProgressView()

@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *soldLab;
@property (nonatomic,strong) UIProgressView *progressView;

@property (nonatomic,strong) NSTimer *timer;


@end

@implementation SoldoutProgressView {
    NSInteger _soldCount;
    CGFloat _totalCount;
    CGFloat _flog;
}

#pragma mark 公开方法


- (void)sold:(NSInteger)sold total:(CGFloat)total{
    _soldCount = sold;
    _totalCount = total;
    _flog = 0;
    _progressView.progress = 0;
    self.soldLab.text = [NSString stringWithFormat:@"已售%.0lf%%",sold/total * 100.0];
    if(!_timer){
        _timer = [NSTimer timerWithTimeInterval:0.03 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer fire];
    }
 
}

#pragma mark 私有方法

- (void)timer:(NSTimer *)timer{
    if(_flog > _soldCount){
        [self.timer invalidate];
        self.timer = nil;
    }
    self.progressView.progress = _flog++/_totalCount;
    
//    NSLog(@"%@",self);
}

#pragma mark get set

- (UIButton *)button{
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor colorWithRed:221/255.0 green:63/255.0 blue:55/255.0 alpha:1];
        _button.layer.cornerRadius = 2;
    }
    return _button;
}

- (UILabel *)soldLab{
    if(!_soldLab){
        
        _soldLab = [UILabel new];
        _soldLab.font = [UIFont systemFontOfSize:10];
        _soldLab.textColor = [UIColor lightGrayColor];
        
    }
    return _soldLab;
}

- (UIProgressView *)progressView{
    if(!_progressView){
        _progressView = [UIProgressView new];
        _progressView.progress = 0.5;
        
        _progressView.layer.borderColor = [UIColor colorWithRed:202/255.0 green:121/255.0 blue:129/255.0 alpha:1].CGColor;
        _progressView.layer.borderWidth = 1;
        _progressView.layer.cornerRadius = 3.5;
        _progressView.layer.masksToBounds = YES;
        _progressView.progressTintColor = [UIColor colorWithRed:202/255.0 green:121/255.0 blue:129/255.0 alpha:1];
        _progressView.trackTintColor = [UIColor whiteColor];
        
    }
    return _progressView;
}

#pragma mark life cycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        
        
        __weak __typeof(self) weakSelf = self;
        
        [self addSubview:self.soldLab];
        [self addSubview:self.progressView];
        [self addSubview:self.button];
        [_soldLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(5);
            make.left.equalTo(@(0));
            make.height.equalTo(@(20));
            make.width.equalTo(weakSelf).multipliedBy(0.34);
            make.right.equalTo(weakSelf.progressView.mas_left).with.offset(0);
            
        }];
        
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            
            make.height.equalTo(@(8));
            make.right.equalTo(@(0));
            //            make.width.equalTo(weakSelf).multipliedBy(0.7);
            //            make.left.equalTo(weakSelf.soldLab.mas_right).with.offset(10);
        }];
        
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_top).with.offset(0);
            make.left.equalTo(weakSelf.progressView.mas_left).with.offset(0);
            make.right.equalTo(weakSelf.progressView.mas_right).with.offset(0);
            make.bottom.equalTo(weakSelf.progressView.mas_top).with.offset(-5);
        }];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame sold:(NSInteger)sold total:(NSInteger)total{
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

- (instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

