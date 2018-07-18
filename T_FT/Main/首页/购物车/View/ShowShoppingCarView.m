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

@property (nonatomic,strong) UILabel *number;
@property (nonatomic,strong) UILabel *price;

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
        
        
        UIColor *textColor = [UIColor redColor];
          UIColor *bgColor = [UIColor whiteColor];
        
        __weak __typeof(self) weakSelf = self;
        
        self.backgroundColor = [UIColor yellowColor];
        
        //
        _number = [[UILabel alloc]init];
        _number.font = [UIFont systemFontOfSize:12];
        _number.backgroundColor = bgColor;
        _number.textColor = textColor;
        _number.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_number];
        [_number mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(10);
            make.width.mas_equalTo(23.5);
             make.height.mas_equalTo(23.5);
            make.centerY.equalTo(weakSelf);
            
        }];
        
        _number.layer.cornerRadius = 11.7;
        _number.layer.masksToBounds = YES;
        
        //
        UILabel *name = [[UILabel alloc]init];
        name.textColor = textColor;
        name.text = @"查看我的购物篮";
        name.font = [UIFont systemFontOfSize:16];
        name.backgroundColor = [UIColor clearColor];
        
        name.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf);
            
        }];
        
        //
        _price = [UILabel new];
        _price.text = @"ss";
        _price.font = [UIFont systemFontOfSize:15];
        _price.textColor = textColor;
        _price.backgroundColor = [UIColor clearColor];;
        [self addSubview:_price];
        
        [_price mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(weakSelf);
            
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
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

