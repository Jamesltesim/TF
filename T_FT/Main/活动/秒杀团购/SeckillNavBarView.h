//
//  SeckillNavBarView.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeNavView.h"
#import "FSScrollContentView.h"


@interface SeckillNavBarView : MeNavView

@property (nonatomic,strong) NSArray *seckillTimes;
@property (nonatomic,strong) id<FSSegmentTitleViewDelegate> segmentTitleDelegate;
@end
