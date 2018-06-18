//
//  MeNavView.h
//  T_FT
//
//  Created by James on 2018/6/18.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeNavView : UIView

@property (nonatomic,strong) UIImage *backImage;

- (void)addLeftButtonWithAction:(SEL)action;
- (void)addLeftButtonWithTarget:(id)target action:(SEL)action;

+ (instancetype)creatNavView;


@end
