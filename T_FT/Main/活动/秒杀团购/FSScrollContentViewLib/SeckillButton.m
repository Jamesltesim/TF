//
//  SeckillButton.m
//  T_FT
//
//  Created by James on 2018/6/27.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SeckillButton.h"
#import "Masonry.h"

@interface SeckillButton()

@property (nonatomic,weak) UILabel *hintLabel;
@end

@implementation SeckillButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType{
   SeckillButton *btn = [super buttonWithType:buttonType];
    [btn.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      
       
        make.height.equalTo(btn.titleLabel.superview).multipliedBy(0.5);
//        make.bottom.equalTo(btn.titleLabel.mas_bottom).offset(0);
        make.top.equalTo(btn.titleLabel.superview).offset(0);
        make.leading.equalTo(btn.titleLabel.superview).offset(0);
        make.trailing.equalTo(btn.titleLabel.superview).offset(0);

    }];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    btn.titleLabel.numberOfLines = 2;
    btn.titleLabel.backgroundColor = [self randomColor];
    return btn;
}

- (UILabel *)hintLabel{
    if(!_hintLabel){
        
        UILabel *lab = [UILabel new];
        lab.backgroundColor = [UIColor purpleColor];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            
//            make.height.equalTo(lab.superview).multipliedBy(0.5);
            make.height.equalTo(@(20));
            
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
            make.leading.equalTo(lab.superview).offset(0);
            make.trailing.equalTo(lab.superview).offset(0);
           
            
        }];
        
         _hintLabel = lab;
    }
    return _hintLabel;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
//    [super setTitle:title forState:state];
    
    NSArray *stringArray = [title componentsSeparatedByString:@"\n"];
    NSString *string1 = stringArray[0];
    
    
    if(stringArray.count == 2){
       
        NSString *string2 = stringArray[1];
        self.hintLabel.text = string2;
    }
    
     [super setTitle:string1 forState:state];
   
   
}

+ (UIColor*) randomColor{
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
