//
//  SegmentView.h
//  TTTT
//
//  Created by James on 2018/9/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentViewDelegate;




@interface SegmentCell:UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *markRedCircle;


@end

@interface SegmentView : UIView

@property (nonatomic,weak) id<SegmentViewDelegate> delegate;


@property (nonatomic,assign) NSInteger index;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

- (void)updateRedCircle:(NSInteger)number atIndex:(NSInteger)index;

@end


@protocol SegmentViewDelegate<NSObject>

- (void)segmentView:(SegmentView *)segmengtView didSelectedAtIndex:(NSInteger)index;

@end
