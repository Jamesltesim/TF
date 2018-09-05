//
//  SegmentView.h
//  TTTT
//
//  Created by James on 2018/9/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentViewDelegate;

@interface SegmentView : UIView

@property (nonatomic,weak) id<SegmentViewDelegate> delegate;


@property (nonatomic,assign) NSInteger index;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@end


@protocol SegmentViewDelegate<NSObject>

- (void)segmentView:(SegmentView *)segmengtView didSelectedAtIndex:(NSInteger)index;

@end
