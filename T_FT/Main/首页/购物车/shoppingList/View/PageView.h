//
//  PageView.h
//  TTTT
//
//  Created by James on 2018/9/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewDelegate.h"
#import "ContentView.h"

@interface PageView : UIView

//@property (nonatomic,strong) NSArray *dataArray;


@property (nonatomic,weak) id<PageViewDelegate> delegate;

@property (nonatomic) CGFloat segmentViewHeight; //default 50

//当前显示的segment
@property (nonatomic) NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;

- (void)reloadData:(NSArray <NSDictionary *>*)dataArray;
- (void)reloadCurrentTableView;

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;

- (void)updateRedCircle:(NSInteger)number atIndex:(NSInteger)index;

- (void)showCashierDeskWithHeight:(CGFloat)height;
- (void)hiddenCashierDeskWithHeight:(CGFloat)height;
@end
