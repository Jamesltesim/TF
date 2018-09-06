//
//  SlideCashierView.m
//  T_FT
//
//  Created by James on 2018/9/6.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SlideCashierView.h"

@interface SlideCashierView()

@property (nonatomic,strong) UILabel *number;
@property (nonatomic,strong) UILabel *price;

@property (nonatomic,strong) UIView *contentVeiw;

@end

@implementation SlideCashierView

- (void)setNumber:(NSInteger)count price:(CGFloat)price{
    
//    self.number.text = [NSString stringWithFormat:@"%ld",count];
    self.price.text = [NSString stringWithFormat:@"¥ %.2f",price];
    
    if(count > 99){
        self.number.text = @"99+";
    }
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UIColor *textColor = [UIColor whiteColor];
        UIColor *bgColor = [UIColor whiteColor];
        
        __weak __typeof(self) weakSelf = self;
        
        self.backgroundColor = [UIColor whiteColor];
        
        //contentView
        _contentVeiw = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/2, 0, frame.size.width-14, frame.size.height-12)];
        _contentVeiw.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        _contentVeiw.backgroundColor = THEME_COLOR_RED;
        [self addSubview:_contentVeiw];
        //        [_contentVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        //            CGFloat pace = 13.0;
        //            make.top.equalTo(self).offset(pace);
        //            make.left.equalTo(self).offset(pace);
        //            make.bottom.equalTo(self).offset(-pace/2);
        //            make.right.equalTo(self).offset(-pace);
        //        }];
        //
        _number = [[UILabel alloc]init];
        _number.font = [UIFont systemFontOfSize:11];
        _number.backgroundColor = bgColor;
        _number.textColor = THEME_COLOR_RED;
        _number.textAlignment = NSTextAlignmentCenter;
        [_contentVeiw addSubview:_number];
        [_number mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.contentVeiw).offset(10);
            make.width.mas_equalTo(22);
            make.height.mas_equalTo(22);
            make.centerY.equalTo(weakSelf);
            
        }];
        
        _number.layer.cornerRadius = 11.7;
        _number.layer.masksToBounds = YES;
        
        //
        UILabel *name = [[UILabel alloc]init];
        name.textColor = textColor;
        name.text = @"添加到购物车";
        name.font = [UIFont systemFontOfSize:15.5];
        name.backgroundColor = [UIColor clearColor];
        
        name.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [_contentVeiw addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf);
            
        }];
        
        //
        _price = [UILabel new];
        _price.text = @"";
        _price.font = [UIFont systemFontOfSize:14.5];
        _price.textColor = textColor;
        _price.backgroundColor = [UIColor clearColor];;
        [_contentVeiw addSubview:_price];
        
        [_price mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.contentVeiw).offset(-10);
            make.centerY.equalTo(weakSelf);
            
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap {
    if([self.delegate respondsToSelector:@selector(slideCashierViewGotoBillView)]){
        [self.delegate slideCashierViewGotoBillView];
    }
}

@end
