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
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         __weak __typeof(self) weakSelf = self;
        
        self.backgroundColor = [UIColor yellowColor];
        _number = [[UILabel alloc]init];

        [self addSubview:_number];
        [_number mas_makeConstraints:^(MASConstraintMaker *make) {
            //            make.center.equalTo(weakSelf).centerOffset(CGPointMake(0,sizeNew.height/2));
            make.left.equalTo(self).offset(10);
            make.centerY.equalTo(weakSelf);
            //            make.centerX.equalTo(weakSelf.mas_centerX);
            
            //            make.height.mas_equalTo(super.height);
            
        }];
        
        UILabel *name = [[UILabel alloc]init];
        name.text = @"查看我的购物篮";
       
        name.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            //            make.center.equalTo(weakSelf).centerOffset(CGPointMake(0,sizeNew.height/2));
//            make.right.equalTo(self).offset(0);
            make.center.equalTo(weakSelf);
            
            //            make.height.mas_equalTo(super.height);
            
        }];
        
        _price = [UILabel new];
        _price.text = @"ss";
        [self addSubview:_price];

        [_price mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(weakSelf).centerOffset(CGPointMake(0,sizeNew.height/2));
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(weakSelf);
//            make.centerX.equalTo(weakSelf.mas_centerX);

//            make.height.mas_equalTo(super.height);

        }];
        
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
