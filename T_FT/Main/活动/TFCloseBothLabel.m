//
//  TFCloseBothLabel.m
//  T_FT
//
//  Created by James on 2018/7/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFCloseBothLabel.h"


@interface TFCloseBothLabel()

@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *hintLab;




@end


@implementation TFCloseBothLabel

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]){
        [self addSubview:self.titleLab];
        [self addSubview:self.hintLab];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addSubview:self.titleLab];
        [self addSubview:self.hintLab];
        
        
        
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    
    self.titleLab.text = title;
    [self sizeToFitWithTitle:title hint:nil];
}

- (void)setHint:(NSString *)hint{
    self.hintLab.text = hint;
    [self sizeToFitWithTitle:nil hint:hint];
    
}

- (void)setTitleFont:(UIFont *)titleFont{
    self.titleLab.font = titleFont;
}

- (void)setHintFont:(UIFont *)hintFont{
    self.hintLab.font = hintFont;
}

- (void)setTitleColor:(UIColor *)titleColor{
    self.titleLab.textColor = titleColor;
}

- (void)setHintColor:(UIColor *)hintColor{
    self.hintLab.textColor = hintColor;
}

- (void)setNumberOfLinesForHint:(NSInteger)numberOfLinesForHint{
    self.hintLab.numberOfLines = numberOfLinesForHint;
}

- (void)setNumberOfLinesForTitle:(NSInteger)numberOfLinesForTitle{
    self.titleLab.numberOfLines = numberOfLinesForTitle;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    self.titleLab.textAlignment = textAlignment;
    self.hintLab.textAlignment = textAlignment;
}

- (void)sizeToFitWithTitle:(NSString *)title hint:(NSString *)hint{

    CGFloat centerHeight = self.height/2;
    if(title != nil){
        CGSize sizeNew = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLab.font}];
//        self.titleLab.frame = CGRectMake(0, centerHeight-sizeNew.height, self.width, sizeNew.height);
        
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self).centerOffset(CGPointMake(0, -sizeNew.height/2));
            
             make.width.equalTo(self).offset(0);
            make.height.mas_equalTo(sizeNew.height);
        }];
    }
    
    if(hint != nil){
        CGSize sizeNew = [hint sizeWithAttributes:@{NSFontAttributeName:self.hintLab.font}];
//        self.hintLab.frame = CGRectMake(0, centerHeight, self.width, sizeNew.height);
        [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self).centerOffset(CGPointMake(0,sizeNew.height/2));
            
            make.width.equalTo(self).offset(0);
            make.height.mas_equalTo(sizeNew.height);
        }];
    }
    
}

- (UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = [UILabel new];
//        _titleLab.textColor = self.normalColor;
        
        _titleLab.textAlignment = NSTextAlignmentCenter;
//        _titleLab.font = self.normalTitleFont;

        
    }
    return _titleLab;
}

- (UILabel *)hintLab{
    if(!_hintLab){
        _hintLab = [UILabel new];
//        _hintLab.textColor = self.normalColor;
//        _hintLab.font = self.normalHintFont;
        _hintLab.textAlignment = NSTextAlignmentCenter;
  
    }
    return _hintLab;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
