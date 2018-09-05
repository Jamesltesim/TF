//
//  PageView.m
//  TTTT
//
//  Created by James on 2018/9/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "PageView.h"

#import "SegmentView.h"
#import "GoodModel.h"

@interface PageView() <UIScrollViewDelegate,SegmentViewDelegate>

@property (retain, nonatomic) UIScrollView *scrollView;

@property (nonatomic,strong) SegmentView *segment;

@property (nonatomic,assign) BOOL isTapSegment;

@property (nonatomic,strong) NSMutableArray *contentViewArray;

@end

@implementation PageView

- (NSMutableArray *)contentViewArray{
    if(!_contentViewArray){
        _contentViewArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _contentViewArray;
}

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier{

}

- (void)reloadData:(NSArray<NSDictionary *> *)dataArray{
    
//    处理数据
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableArray *contentArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (NSDictionary *dict in dataArray){
        [titleArray addObject:dict[@"title"]];
        [contentArray addObject:dict[@"data"]];
    }
    
//    清空segmentview
    if(self.segment.superview){
        [self.segment removeFromSuperview];
    }
//    重新加载segmentview
    _segment = [[SegmentView alloc]initWithFrame:CGRectMake(0,0,  self.bounds.size.width, (self.segmentViewHeight == 0?50:self.segmentViewHeight)) titles:titleArray];
    _segment.delegate = self;
    [self addSubview:_segment];
    
    
//    清空scrollview
    for (UIView *view in self.contentViewArray){
        [view removeFromSuperview];
        
    }
    self.contentViewArray = nil;
    self.scrollView.contentSize = CGSizeMake(0,0);
    
//    重新加载contentview
    for (int i=0;i<contentArray.count;i++){
        NSArray *array = contentArray[i];
        ContentView *contentView = [[ContentView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height - self.segment.bounds.size.height) dataArray:array segmentTitle:titleArray[i]];
        contentView.index = i;
        
        contentView.delegate = self.delegate;
        
        [self.scrollView addSubview:contentView];
        [self.contentViewArray addObject:contentView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width*contentArray.count,self.frame.size.height - self.segment.bounds.size.height);
    
}

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *titleArray = @[@"最近有点闲功最近有点闲功点闲功最近",@"几种方",@"适应的几种方式",@"NSStringDrawingContext",@"ble",@"计算文本",@"点闲功"];
        _segment = [[SegmentView alloc]initWithFrame:CGRectMake(0,0,  self.bounds.size.width, (self.segmentViewHeight == 0?50:self.segmentViewHeight)) titles:titleArray];
        _segment.delegate = self;
        [self addSubview:_segment];
        
        
        //初始化scrollView
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _segment.frame.origin.y+_segment.frame.size.height, self.bounds.size.width, frame.size.height - self.segment.bounds.size.height)];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width*7,frame.size.height - self.segment.bounds.size.height);
        [self addSubview:self.scrollView];
        
        
        ContentView *first = [[ContentView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, frame.size.height - self.segment.bounds.size.height)];
        [self.scrollView addSubview:first];
        
        ContentView *first1 = [[ContentView alloc]initWithFrame:CGRectMake(self.bounds.size.width, 0, self.frame.size.width, frame.size.height - self.segment.bounds.size.height)];
        [self.scrollView addSubview:first1];
        
        [self.contentViewArray addObject:first];
        [self.contentViewArray addObject:first1];
        
        for (NSInteger i=2;i<7;i++){
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, frame.size.height - self.segment.bounds.size.height)];
            view.backgroundColor = [UIColor colorWithRed:(10+i*40)/255.0 green:(60+i*50)/255.0 blue:(10+i*70)/255.0 alpha:0.9];
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, view.bounds.size.width, 50)];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text = [NSString stringWithFormat:@"%ld",i];
            [view addSubview:lab];
            [self.scrollView addSubview:view];
            [self.contentViewArray addObject:view];
        }
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger x = scrollView.contentOffset.x;
    NSInteger w = self.bounds.size.width;
    
    if(x % w == 0 && self.isTapSegment == NO){
        NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
        
        self.segment.index = x/w;
    }
    
    self.isTapSegment = NO;
}



- (void)segmentView:(SegmentView *)segmengtView didSelectedAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
    self.isTapSegment = YES;
    CGFloat screenWidth = self.bounds.size.width;
    self.scrollView.contentOffset = CGPointMake(screenWidth*index, 0);
}


@end
