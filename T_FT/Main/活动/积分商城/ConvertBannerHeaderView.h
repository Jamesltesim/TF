//
//  ConvertBannerHeaderView.h
//  T_FT
//
//  Created by James on 2018/9/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConvertBannerHeaderView : UIView

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *jifen;
@property (nonatomic,strong) NSString *availableJifen;
@property (nonatomic)        NSInteger level;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;
@end
