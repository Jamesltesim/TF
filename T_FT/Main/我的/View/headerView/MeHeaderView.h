//
//  MeHeaderView.h
//  T_FT
//
//  Created by James on 2018/6/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeHeaderViewDelegate;

@interface MeHeaderView : UIView

@property (nonatomic,strong) id<MeHeaderViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame login:(BOOL)isLogin;

@end


@protocol MeHeaderViewDelegate <NSObject>

- (void)logoutViewClick;

@end
