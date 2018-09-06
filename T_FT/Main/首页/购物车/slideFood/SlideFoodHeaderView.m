//
//  SlideFoodHeaderView.m
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SlideFoodHeaderView.h"

@implementation SlideFoodHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//         self = [[[NSBundle mainBundle] loadNibNamed:@"SlideFoodHeaderView" owner:self options:nil] lastObject];
//        self.frame = frame;
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, frame.size.width-100, frame.size.height/2.0)];
        self.titleLab.numberOfLines = 2;
        self.titleLab.font = [UIFont systemFontOfSize:16];
        self.priceLab = [[UILabel alloc]initWithFrame:CGRectMake(self.titleLab.right, self.titleLab.top, frame.size.width-self.titleLab.right-10, self.titleLab.height)];
        self.priceLab.font = [UIFont systemFontOfSize:16];
        self.priceLab.textAlignment = NSTextAlignmentRight;
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom, frame.size.width, frame.size.height/2.0)];
        lab.text = @"     请选择您喜欢的辅料";
        lab.font = [UIFont systemFontOfSize:13.5];
        lab.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
        
        [self addSubview:self.titleLab];
        [self addSubview:self.priceLab];
        [self addSubview:lab];
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self = [[[NSBundle mainBundle] loadNibNamed:@"SlideFoodHeaderView" owner:self options:nil] lastObject];
    }
    return self;
}

@end
