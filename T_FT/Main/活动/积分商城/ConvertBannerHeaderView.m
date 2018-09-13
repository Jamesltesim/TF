
//
//  ConvertBannerHeaderView.m
//  T_FT
//
//  Created by James on 2018/9/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ConvertBannerHeaderView.h"
#import "ConvertHeaderView.h"

@implementation ConvertBannerHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        ConvertHeaderView *headerView = [[ConvertHeaderView alloc]initWithFrame:CGRectMake(0, 208, frame.size.width, 50) title:title];
        [self addSubview:headerView];
    }
    return self;
}
/*
// Only override drawRect: if you perfYorm custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
