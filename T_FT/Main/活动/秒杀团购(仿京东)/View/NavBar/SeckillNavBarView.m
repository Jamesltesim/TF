//
//  SeckillNavBarView.m
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SeckillNavBarView.h"
#import "UIView+Gradient.h"


@interface SeckillNavBarView ()



@end

@implementation SeckillNavBarView


+ (instancetype)creatNavView{
    SeckillNavBarView *navView = [[SeckillNavBarView alloc] init];
    
    CGRect frame = navView.frame;
    navView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height+40);
    navView.backgroundColor = [UIColor redColor];
    [navView gradualColorWithStartColor:[UIColor colorWithRed:236/255.0 green:85/255.0 blue:121/255.0 alpha:1] endColor:[UIColor colorWithRed:209/255.0 green:57/255.0 blue:43/255.0 alpha:1]];

    [navView addSubview:navView.titleView];
    return navView;
    
//    236 85 121
//
//    209 57 43
    
}

- (void)setSegmentTitleDelegate:(id<TFSegmentTitleViewDelegate>)segmentTitleDelegate{
    self.titleView.delegate = segmentTitleDelegate;
}

- (TFSegmentTitleView *)titleView{
    if(!_titleView){
        _titleView = [[TFSegmentTitleView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT, CGRectGetWidth(self.bounds), 40)];
    }
    return _titleView;
}

- (void)viewWillAppear{
    
}
//- (void)setSeckillTimes:(NSArray *)seckillTimes{
//    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT, CGRectGetWidth(self.bounds), 70) titles:seckillTimes delegate:self.segmentTitleDelegate indicatorType:FSIndicatorTypeDefault];
//    //    self.titleView.titleSelectFont = [UIFont systemFontOfSize:10];
//    self.titleView.delegate = self.segmentTitleDelegate;
//    self.titleView.selectIndex = 0;
//    [self addSubview:self.titleView];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
