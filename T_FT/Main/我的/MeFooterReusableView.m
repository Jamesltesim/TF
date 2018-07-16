//
//  MeFooterReusableView.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeFooterReusableView.h"

@interface MeFooterReusableView()


@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation MeFooterReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.bgView addTapGestureRecognizerWithTarget:self action:@selector(bgViewTap:)];
//    [self.bgView addTapGestureRecognizerWithTarget:self action:@selector(bgViewTap:)];
}

- (void)bgViewTap:(UITapGestureRecognizer *)tap{
 
    if([self.delegate respondsToSelector:@selector(footerViewClick)]){
           [self.delegate footerViewClick];
    }

}
@end
