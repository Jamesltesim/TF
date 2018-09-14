//
//  SegmentView.m
//  TTTT
//
//  Created by James on 2018/9/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SegmentView.h"

@interface SegmentView()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *bottomLine;

@property (nonatomic,strong) NSMutableArray *cellArray;

@end

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        self.cellArray = [[NSMutableArray alloc]initWithCapacity:0];
        CGFloat x = 0;
        for(int i=0;i<titles.count;i++){
            
            NSString *title = titles[i];
            CGFloat width = [self rectWithString:title fontSize:16];
            
                SegmentCell *label = [[SegmentCell alloc]initWithFrame:CGRectMake(x, 0, width, frame.size.height)];
                label.tag = i;
            label.title = title;
            [self.scrollView addSubview:label];

            
            x+=width;
            
            self.scrollView.contentSize = CGSizeMake(x, frame.size.height);
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labTap:)];
            [label addGestureRecognizer:tap];
            
            
            [self.cellArray addObject:label];
            
            if(i == 0){
                self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, label.bounds.size.height-2, label.bounds.size.width, 2)];
                self.bottomLine.backgroundColor = [UIColor redColor];
                [self.scrollView addSubview:self.bottomLine];
            }
            
        }
       
    }
    
    return self;
}

- (void)updateRedCircle:(NSInteger)number atIndex:(NSInteger)index{
    SegmentCell *cell = self.cellArray[index];
    
    cell.markRedCircle = [NSString stringWithFormat:@"%ld",number];
}

- (void)setIndex:(NSInteger)index{
    
    _index = index;
    UIView *lab = self.cellArray[index];
    
    [self animateWithLab:lab];
//    self.scrollView.contentOffset = CGPointMake(screenWidth*index, 0);
//    self.bottomLine.frame = CGRectMake(lab.frame.origin.x, lab.bounds.size.height-2, lab.bounds.size.width, 2);
//    [self.scrollView addSubview:self.bottomLine];
    
}

-(void)labTap:(UITapGestureRecognizer *)tap {
    UILabel *lab = (UILabel *)tap.view;
    
    if([self.delegate respondsToSelector:@selector(segmentView:didSelectedAtIndex:)]){
        [self.delegate segmentView:self didSelectedAtIndex:lab.tag];
    }
    
    [self animateWithLab:lab];

}

- (void)animateWithLab:(UIView *)lab{
    //    lab在屏幕的左边，不到屏幕一半的位置
    //     lab在屏幕的右边，大于屏幕一半的位置
    CGFloat screenWidth = self.bounds.size.width;
    CGFloat scrollContentWidth = self.scrollView.contentSize.width;
    [UIView animateWithDuration:0.3 animations:^{
        if(lab.center.x < screenWidth/2){
//            NSLog(@"111111");
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }
        else if ((lab.frame.origin.x+lab.frame.size.width/2) > scrollContentWidth-screenWidth/2){
            self.scrollView.contentOffset = CGPointMake(scrollContentWidth-screenWidth, 0);
//            NSLog(@"222222");
        }
        else{
//            NSLog(@"333333");
            self.scrollView.contentOffset = CGPointMake(lab.center.x-screenWidth/2, 0);
            
            
        }
        //        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        //        CGRect rect=[lab convertRect: lab.bounds toView:window];
        //        //       CGPoint labPoint = [self.scrollView convertPoint:lab.center fromView:lab];
        //        NSLog(@"%@",NSStringFromCGRect(rect));
        self.bottomLine.frame = CGRectMake(lab.frame.origin.x, lab.bounds.size.height-2, lab.bounds.size.width, 2);
        [self.scrollView addSubview:self.bottomLine];
    } completion:^(BOOL finished) {
        
    }];
}

- (CGFloat)rectWithString:(NSString *)text fontSize:(CGFloat)size{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]} context:nil];
    
    return rect.size.width+30;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@interface SegmentCell()

@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *circleLab;

@end

@implementation SegmentCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _titleLab.userInteractionEnabled = YES;
        _titleLab.textColor = [UIColor blueColor];
        _titleLab.backgroundColor = [UIColor yellowColor];
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
        
        _circleLab = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width-15, 0, 15, 15)];
        _circleLab.backgroundColor = [UIColor redColor];
//        _circleLab.text = @"1";
        _circleLab.hidden = YES;
        _circleLab.textColor = [UIColor whiteColor];
        _circleLab.textAlignment = NSTextAlignmentCenter;
        _circleLab.font = [UIFont systemFontOfSize:12];
        _circleLab.layer.cornerRadius = _circleLab.frame.size.height/2;
        _circleLab.layer.masksToBounds = YES;
        [self addSubview:_circleLab];
        
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLab.text = title;
}

- (void)setMarkRedCircle:(NSString *)markRedCircle{
    _markRedCircle = markRedCircle;
    
    if([markRedCircle integerValue] == 0){
        _circleLab.hidden = YES;
    }else{
        _circleLab.hidden = NO;
         _circleLab.text = markRedCircle;
    }
   
}

@end
