//
//  TFQRCodeImageView.h
//  T_FT
//
//  Created by xian on 2018/7/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFQRCodeImageView : UIImageView

@property (nonatomic,strong,readonly) NSString *content;

- (instancetype)initWithFrame:(CGRect)frame content:(NSString *)content;

@end
