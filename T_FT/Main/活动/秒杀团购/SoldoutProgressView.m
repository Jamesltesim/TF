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

@property (nonatomic,strong) UILabel *soldLab;
@property (nonatomic,strong) UIProgressView *progressView;

@end

@implementation SoldoutProgressView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        
      
              __weak __typeof(self) weakSelf = self;
        self.backgroundColor = [UIColor yellowColor];
       
      
        
        [self addSubview:self.soldLab];
        [self addSubview:self.progressView];
        
        [_soldLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.equalTo(@(0));
            make.height.equalTo(@(20));
            make.width.equalTo(weakSelf).multipliedBy(0.3);
            make.right.equalTo(weakSelf.progressView.mas_left).with.offset(-5);
    
        }];
     
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
           
            make.height.equalTo(@(5));
            make.right.equalTo(@(0));
//            make.width.equalTo(weakSelf).multipliedBy(0.7);
//            make.left.equalTo(weakSelf.soldLab.mas_right).with.offset(10);
        
            
        }];
        
    }
    return self;
}

- (UILabel *)soldLab{
    if(!_soldLab){

        _soldLab = [UILabel new];
        _soldLab.backgroundColor = [UIColor redColor];
       
        
    }
    return _soldLab;
}

- (UIProgressView *)progressView{
    if(!_progressView){
        _progressView = [UIProgressView new];
        _progressView.progress = 0.5;

        
      
    }
    return _progressView;
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
