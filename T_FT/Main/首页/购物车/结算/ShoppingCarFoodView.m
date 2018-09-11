//
//  ShoppingCarFoodView.m
//  T_FT
//
//  Created by James on 2018/9/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingCarFoodView.h"


@interface ShoppingCarFoodView()

@property (nonatomic,strong) UILabel *xiaojiLab;
@property (nonatomic,strong) UILabel *discountLab;

@end

@implementation ShoppingCarFoodView

- (instancetype)initWithFrame:(CGRect)frame xiaoji:(CGFloat)xiaoji discount:(CGFloat)discount total:(CGFloat)total{
    if(self = [super initWithFrame:frame]){
        CGFloat left_pace = 15;
        UIView *topLineView = [[UIView alloc]initWithFrame:CGRectMake(left_pace, 1, self.width-20, 1)];
        topLineView.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
        [self addSubview:topLineView];
        
        UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(left_pace, topLineView.bottom, 100, 45)];
        lab1.text = @"小计";
        _xiaojiLab = [[UILabel alloc]initWithFrame:CGRectMake(self.width-left_pace-150, lab1.top, 150, lab1.height)];
        _xiaojiLab.textAlignment = NSTextAlignmentRight;
        _xiaojiLab.textColor = THEME_FONT_COLOR_GRAY;
        _xiaojiLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:_xiaojiLab];
        
        UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(left_pace, lab1.bottom, 100, 45)];
        lab2.text = @"优惠券";
        
        _discountLab = [[UILabel alloc]initWithFrame:CGRectMake(self.width-left_pace-150, lab2.top, 150, lab1.height)];
        _discountLab.textAlignment = NSTextAlignmentRight;
        _discountLab.textColor = THEME_FONT_COLOR_GRAY;
        _discountLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:_discountLab];
        
        
        [self addSubview:lab1];
        [self addSubview:lab2];
        
        
        UIView *shadow = [[UIView alloc]initWithFrame:CGRectMake(left_pace, lab2.bottom+5, self.width, 3)];
        shadow.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:0.5];
        [self addSubview:shadow];
        
        _xiaojiLab.text = [NSString stringWithFormat:@"%.2lf",xiaoji];
        _discountLab.text = [NSString stringWithFormat:@"%.2lf",discount];
    }
    return self;
}
- (instancetype)initWithXiaoji:(CGFloat)xiaoji discount:(CGFloat)discount total:(CGFloat)total
{
    self = [super init];
    if (self) {
        
       
        
        
    }
    return self;
}

//- (UILabel *)xiaojiLab{
//    if(!_xiaojiLab){
//
//    }
//    return _xiaojiLab;
//}

                                  
                                  
                                  
                                  
                                  
                
                                  
                                  
                                
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
