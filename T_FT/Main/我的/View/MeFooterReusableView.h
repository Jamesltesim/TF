//
//  MeFooterReusableView.h
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeFooterReusableViewDelegate;

@interface MeFooterReusableView : UICollectionReusableView

@property (nonatomic,weak) id<MeFooterReusableViewDelegate> delegate;

@end

@protocol MeFooterReusableViewDelegate <NSObject>

- (void)footerViewClick;
@end
