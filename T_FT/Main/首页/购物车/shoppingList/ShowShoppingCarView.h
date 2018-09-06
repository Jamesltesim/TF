//
//  ShowShoppingCarView.h
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCarDelegate.h"

@interface ShowShoppingCarView : UIView

@property (nonatomic,strong) id<ShoppingCarDelegate> delegate;

- (void)setNumber:(NSInteger)count price:(CGFloat)price;
@end
