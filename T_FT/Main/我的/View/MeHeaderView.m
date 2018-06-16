//
//  MeHeaderView.m
//  T_FT
//
//  Created by James on 2018/6/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeHeaderView.h"
#import "ScrollImage.h"


@implementation MeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
//        CGFloat width = self.width/4;
//        NSArray *titleName = @[@"积分",@"资产.充值",@"优惠券",@"礼品"];
//
//        CGFloat contentLabBottom = 0.f;
//        for(int i=0;i<4;i++){
//            UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(width*i, 130, width, 20)];
//            UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(width*i, nameLab.bottom, width, 25)];
//
//            nameLab.text = titleName[i];
//            contentLab.text = @"-";
//
//            nameLab.textAlignment = NSTextAlignmentCenter;
//            contentLab.textAlignment = NSTextAlignmentCenter;
//
//            [self addSubview:nameLab];
//            [self addSubview:contentLab];
//
//            if(i == 3){
//                contentLabBottom = contentLab.bottom;
//            }
//        }
        
    }
    return self;
}

@end
