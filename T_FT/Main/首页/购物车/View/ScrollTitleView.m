//
//  ScrollTitleView.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ScrollTitleView.h"

@interface ScrollTitleView()

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *marray;

@property (nonatomic,strong) UIView *selectIndicator;

@end

@implementation ScrollTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{
    ScrollTitleView *titleView = [[ScrollTitleView alloc]initWithFrame:frame];
    titleView.marray = [[NSMutableArray alloc]initWithCapacity:0];
    
    CGFloat left = 0.;
    if(titles){
        for (NSString *temp in titles){
            
            
            UILabel *lab = [[UILabel alloc] init];
            lab.textAlignment = NSTextAlignmentCenter;
            
            CGSize size = CGSizeMake(MAXFLOAT,frame.size.height);//设置高度宽度的最大限度
            CGRect rect = [temp boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : lab.font} context:nil];
            
            lab.frame = CGRectMake(left, 0, rect.size.width+50, titleView.scrollView.height);
            lab.text = temp;
            lab.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
           
            lab.userInteractionEnabled = YES;
            titleView.scrollView.contentSize = CGSizeMake(lab.right, lab.height);
            left += lab.width;
            
            
            
           
            
             [titleView.scrollView addSubview:lab];
            [titleView.marray addObject:lab];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:titleView action:@selector(labTap:)];
            [lab addGestureRecognizer:tap];
        
        }
    }
    
    UILabel *lab = titleView.marray[0];
    titleView.selectIndicator = [[UIView alloc] initWithFrame:CGRectMake(0, lab.height-1.5, lab.width, 1.5)];
    titleView.selectIndicator.backgroundColor = [UIColor redColor];
    [titleView.scrollView addSubview:titleView.selectIndicator];

    return titleView;
}

- (void)labTap:(UITapGestureRecognizer *)tap {
    UILabel *lab = (UILabel *)tap.view;
    CGFloat centerX = lab.center.x;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    
    [UIView animateWithDuration:0.5 animations:^{
         self.selectIndicator.frame = CGRectMake(lab.left, lab.height-1.5, lab.width, 1.5);
    }];
    
    
    [UIView animateWithDuration:0.4 animations:^{
        
        if(lab.center.x < screenWidth/2){
            self.scrollView.contentOffset = CGPointMake(0  , 0);
        }else if(lab.center.x > screenWidth/2 && lab.center.x < self.scrollView.contentSize.width-screenWidth/2){
            
            self.scrollView.contentOffset = CGPointMake(lab.center.x-screenWidth/2  , 0);
            
        }else if (lab.center.x > self.scrollView.contentSize.width-screenWidth/2){
            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width-screenWidth  , 0);
        }
    }];
    
    if([self.delegate respondsToSelector:@selector(scrollTitleView:didSelectedAtIndex:)]){
        [self.delegate scrollTitleView:self didSelectedAtIndex:lab.tag];
    }
    
    if([self.delegate respondsToSelector:@selector(scrollTitleView:didSelectedAtTitle:)]){
        [self.delegate scrollTitleView:self didSelectedAtTitle:lab.text];
    }
  
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _scrollView=[[UIScrollView alloc] initWithFrame:self.bounds] ;
        
//        _scrollView.backgroundColor=[UIColor redColor];
        
        //设置内容的大小
        
        _scrollView.contentSize=CGSizeMake(320*4,250);
        
        //当超出边界时表示是否可以反弹
        
        _scrollView.bounces=NO;
        
        //是否分页
        
//        _scrollView.pagingEnabled=YES;
        
        //是否滚动
        
        _scrollView.scrollEnabled=YES;
        
        //是否显示边界
        
        _scrollView.showsHorizontalScrollIndicator=NO;
        
        //设置indicator的风格
        
//        _scrollView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
        
        //提示用户
        
        [_scrollView flashScrollIndicators];
        
        //设置内容的边缘
        
//        _scrollView.contentInset=UIEdgeInsetsMake(0,50, 50,0);
        
        
        _scrollView.userInteractionEnabled = YES;
        [self addSubview:_scrollView];
        
        
    }
    return self;
}

@end
