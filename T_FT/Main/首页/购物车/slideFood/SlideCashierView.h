//
//  SlideCashierView.h
//  T_FT
//
//  Created by James on 2018/9/6.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShoppingCarDelegate.h"

@interface SlideCashierView : UIView

@property (nonatomic,strong) id<ShoppingCarDelegate> delegate;

- (void)setNumber:(NSInteger)count price:(CGFloat)price;

@end
