//
//  TriangleView.m
//  T_FT
//
//  Created by James on 2018/7/10.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TriangleView.h"
#import "Masonry.h"


@interface TriangleView()

@property (nonatomic,strong) UILabel *count;
@end

@implementation TriangleView

- (void)showCount:(NSInteger)count{
    if(self.isHidden){
        self.hidden = NO;
        
    }
    
    self.count.text = [NSString stringWithFormat:@"%ld",count];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _count = [UILabel new];
        _count.font = [UIFont systemFontOfSize:10];
        _count.textColor = [UIColor whiteColor];
        [self addSubview:_count];
        [_count mas_makeConstraints:^(MASConstraintMaker *make) {

            make.center.equalTo(self).centerOffset(CGPointMake(7, -6));
            
        }];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect

{
    
     CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //设置背景颜色
    
    [[UIColor clearColor]  set];
    
    UIRectFill([self bounds]);
    
    //拿到当前视图准备好的画板
    
   
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    
    CGContextMoveToPoint(context, 0, 0);//设置起点
    
    CGContextAddLineToPoint(context, self.bounds.size.width,0);
    
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor redColor] setFill]; //设置填充色
    
    [[UIColor clearColor] setStroke]; //设置边框颜色
    
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
    
    
    
}
/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/

@end
