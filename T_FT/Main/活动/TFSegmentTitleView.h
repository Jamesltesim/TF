//
//  TFSegmentTitleView.h
//  T_FT
//
//  Created by James on 2018/7/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TFSegmentTitleView;

@protocol TFSegmentTitleViewDelegate <NSObject>

@optional

/**
 切换标题
 
 @param titleView FSSegmentTitleView
 @param startIndex 切换前标题索引
 @param endIndex 切换后标题索引
 */
- (void)TFSegmentTitleView:(TFSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

/**
 将要开始滑动
 
 @param titleView FSSegmentTitleView
 */
- (void)TFSegmentTitleViewWillBeginDragging:(TFSegmentTitleView *)titleView;

/**
 将要停止滑动
 
 @param titleView FSSegmentTitleView
 */
- (void)TFSegmentTitleViewWillEndDragging:(TFSegmentTitleView *)titleView;

@end




@interface TFSegmentTitleView : UIView

@property (nonatomic, weak) id<TFSegmentTitleViewDelegate>delegate;

@property (nonatomic) NSInteger selectIndex;

@property (nonatomic,strong)  UIFont *normalFont;
@property (nonatomic,strong)  UIFont *selectedFont;
@property (nonatomic,strong) UIColor *normalColor;
@property (nonatomic,strong) UIColor *selectedColor;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)loadTitles:(NSArray <NSString *> *)titles;

@end
