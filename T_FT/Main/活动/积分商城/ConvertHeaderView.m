//
//  ConvertHeaderView.m
//  T_FT
//
//  Created by James on 2018/9/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ConvertHeaderView.h"

@implementation ConvertHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *topLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 8)];
        topLineView.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
        
        UIView *markView = [[UIView alloc]initWithFrame:CGRectMake(8, 10+topLineView.bottom, 2, 8)];
        markView.backgroundColor = [UIColor redColor];
        markView.layer.cornerRadius = 1;
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(markView.right+5, 0, 150, frame.size.height)];
        titleLab.text = title;
        
        [self addSubview:topLineView];
        [self addSubview:markView];
        [self addSubview:titleLab];
        
        UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(10,self.height-1, frame.size.width-10, 1)];
        bottomLine.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
        [self addSubview:bottomLine];
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
