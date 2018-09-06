//
//  HomeNavView.m
//  T_FT
//
//  Created by James on 2018/7/24.
//  Copyright © 2018年 James. All rights reserved.
//

#import "HomeNavView.h"

@interface HomeNavView ()
#define NavHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44)
@property(assign, nonatomic) CGFloat currentProgress;

@end
@implementation HomeNavView

- (instancetype)initWithNoBackButton
{
    self = [super init];
    if (self) {
        self.clearBgView.backBtton.hidden = YES;
        self.contentBgView.backBtton.hidden = YES;
        
        self.contentBgView.backgroundColor = [UIColor yellowColor];
        self.clearBgView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


//传入scrollview的偏移量
- (void)scrollToChangeAlpha:(CGFloat)alpha{
    
    CGFloat HeaderHeight = 258.0f;
    CGFloat offsetY = alpha;
    CGFloat headerImageY = offsetY;
    CGFloat headerImageH = HeaderHeight - offsetY;
    
    if (offsetY <= 6) {
        //        self.navigationController.navigationBar.alpha = 0.0;
                self.currentProgress = 0.0;
    }else {
        headerImageY = 0;
        headerImageH = HeaderHeight;
        
        CGFloat adjustHeight = HeaderHeight - NAV_HEIGHT;
        
        CGFloat progress = 1 - (offsetY / adjustHeight);
        self.currentProgress = 1 - progress;
        
    }
    
    NSLog(@"%lf",self.currentProgress);
    
    self.contentBgView.alpha = 1-self.currentProgress;
//    self.clearBgView.alpha = 1-self.currentProgress;
//    [super scrollToChangeAlpha:self.currentProgress];
    
}
@end
