//
//  ShowShoppingCarView.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShowShoppingCarView.h"
#import "Masonry.h"

@interface ShowShoppingCarView()

@property (nonatomic,strong)  UILabel *name;
@property (nonatomic,strong) UILabel *number;
@property (nonatomic,strong) UILabel *price;

@property (nonatomic,strong) UIView *contentVeiw;

@end

@implementation ShowShoppingCarView

- (void)setNumber:(NSInteger)count price:(CGFloat)price{
    
    self.number.text = [NSString stringWithFormat:@"%ld",count];
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
        _contentVeiw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width-14, frame.size.height-12)];
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
        _name = [[UILabel alloc]init];
        _name.textColor = textColor;
        _name.text = self.title;
        _name.font = [UIFont systemFontOfSize:15.5];
        _name.backgroundColor = [UIColor clearColor];
        
        _name.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [_contentVeiw addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf);
            
        }];
        
        //
        _price = [UILabel new];
        _price.text = @"ss";
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

- (void)setTitle:(NSString *)title{
    _title = title;
    self.name.text = title;
}

- (void)tap:(UITapGestureRecognizer *)tap {
    if([self.delegate respondsToSelector:@selector(cashierDeskTap)]){
        [self.delegate cashierDeskTap];
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

