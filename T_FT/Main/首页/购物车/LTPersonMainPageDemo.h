//
//  LTPersonMainPageDemo.h
//  OCExample
//
//  Created by 高刘通 on 2018/6/28.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTScrollView-Swift.h"
#import "TFNavView.h"

@interface LTPersonMainPageDemo : UIViewController<LTSimpleScrollViewDelegate>

@property(copy, nonatomic) NSArray <NSString *> *titles;


@property (nonatomic,strong) TFNavView *navView;
@property(strong, nonatomic) LTSimpleManager *managerView;

@property(strong, nonatomic) UIView *headerView;
@property(strong, nonatomic) UIImageView *headerImageView;
@property(assign, nonatomic) CGFloat currentProgress;

@end
