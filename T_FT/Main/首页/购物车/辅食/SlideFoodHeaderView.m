//
//  SlideFoodHeaderView.m
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SlideFoodHeaderView.h"

@implementation SlideFoodHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         self = [[[NSBundle mainBundle] loadNibNamed:@"SlideFoodHeaderView" owner:self options:nil] lastObject];
        self.frame = frame;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SlideFoodHeaderView" owner:self options:nil] lastObject];
    }
    return self;
}

@end
