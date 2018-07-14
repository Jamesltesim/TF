//
//  GradualNavBarController.m
//  T_FT
//
//  Created by James on 2018/6/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "GradualNavBarController.h"
#import "UIImage+imgaeWithColor.h"

@interface GradualNavBarController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic) BOOL changeStatusBarColor;

@end

@implementation GradualNavBarController

- (void)setFollowScrollView:(UIScrollView *)scrollView{
    _scrollView = scrollView;
}

#pragma mark - navigation settings
- (void)wjNavigationSettings {
    // 设置导航栏的背景
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 取消掉底部的那根线
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
//    [self.gradualNavView setBackImage:[[UIImage alloc] init]];
  
//    self.gradualNavView = [MeNavView creatNavView];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    if(self.changeStatusBarColor){
        return UIStatusBarStyleDefault;
    }
    return UIStatusBarStyleLightContent;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y + NAV_HEIGHT;
    
    //    CGFloat imgH = oriHeight - offset;
    //    if (imgH < 64) {
    //        imgH = 64;
    //    }
    //        self.imageHeight.constant = imgH;
    
    //根据透明度来生成图片
    //找最大值/
    CGFloat alpha = (offset-64 ) * 0.4/ 44.0;   // (200 - 64) / 136.0f
    if (alpha >= 1) {
        alpha = 0.99;
    }else if (alpha < 0){
        alpha = 0;
        
        
        
    }
    
    if(alpha >0.3){
       
//         [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        self.changeStatusBarColor = YES;
    }else{
//          [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.changeStatusBarColor = NO;
    }
     [self preferredStatusBarStyle];
    NSLog(@"alpha:%lf  offset:%lf",alpha,offset);
    //拿到标题 标题文字的随着移动高度的变化而变化
//    UILabel *titleL = (UILabel *)self.navigationItem.titleView;
//    titleL.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    //把颜色生成图片
    UIColor *alphaColor = [UIColor colorWithWhite:1 alpha:alpha];
    //把颜色生成图片
    UIImage *alphaImage = [UIImage imageWithColor:alphaColor];
    //修改导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
    [self.gradualNavView setBackImage:alphaImage];
    self.gradualNavView.titleColor = [UIColor colorWithWhite:0 alpha:alpha];
    self.gradualNavView.bottomLineAlpha = alpha;
//    self.gradualNavView.clearColor = [UIColor colorWithWhite:0 alpha:alpha];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjNavigationSettings];
}

- (void)setGradualNavView:(TFNavView *)gradualNavView{
    _gradualNavView = gradualNavView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
