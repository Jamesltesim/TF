//
//  SeckillNavBarView.m
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SeckillNavBarView.h"
#import "UIView+Gradient.h"

@implementation SeckillNavBarView


+ (instancetype)creatNavView{
    SeckillNavBarView *navView = [[SeckillNavBarView alloc] init];
    
    CGRect frame = navView.frame;
    navView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height+60);
    navView.backgroundColor = [UIColor redColor];
    [navView gradualColorWithStartColor:[UIColor colorWithRed:236/255.0 green:85/255.0 blue:121/255.0 alpha:1] endColor:[UIColor colorWithRed:209/255.0 green:57/255.0 blue:43/255.0 alpha:1]];

    
    return navView;
    
//    236 85 121
//
//    209 57 43
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
