//
//  SeckillNavBarView.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFNavView.h"
#import "FSScrollContentView.h"
#import "TFSegmentTitleView.h"

@interface SeckillNavBarView : TFNavView

@property (nonatomic, strong) TFSegmentTitleView *titleView;

@property (nonatomic,strong) NSArray *seckillTimes;
@property (nonatomic,strong) id<TFSegmentTitleViewDelegate> segmentTitleDelegate;



- (void)viewWillAppear;
@end
