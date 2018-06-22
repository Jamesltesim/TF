//
//  SoldoutProgressView.h
//  T_FT
//
//  Created by James on 2018/6/22.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoldoutProgressView : UIView

//@property (nonatomic) NSInteger slodCount;
//@property (nonatomic) NSInteger totalCount;

- (void)sold:(NSInteger)sold total:(CGFloat)total;
- (instancetype)initWithFrame:(CGRect)frame sold:(NSInteger)sold total:(NSInteger)total;

@end
