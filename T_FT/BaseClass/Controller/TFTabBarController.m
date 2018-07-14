//
//  TFTabBarController.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFTabBarController.h"
#import "TFNavigationController.h"
#import "HomeViewController.h"

#import "ActivityViewController.h"
#import "DiscoveryViewController.h"

#import "MeViewController.h"
#import "ADView.h"


@interface TFTabBarController ()

@property (nonatomic,strong) HomeViewController *HomeController;

@end

@implementation TFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.HomeController = [[HomeViewController alloc]init];
    ActivityViewController *second = [[ActivityViewController alloc]init];
    
    DiscoveryViewController *discovery = [[DiscoveryViewController alloc]init];
    MeViewController *third = [[MeViewController alloc]init];

    //    BDFourthViewController1 *fourth = [[BDFourthViewController1 alloc] init];
//    first.title = @"体育投注";
//    third.title = @"投注单";
    
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:self.HomeController];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    UINavigationController *discoveryNav = [[UINavigationController alloc] initWithRootViewController:discovery];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:third];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:fourth];
    
    nav1.tabBarItem.title = @"首页";
    nav2.tabBarItem.title = @"活动";
    discoveryNav.tabBarItem.title = @"发现";
    nav3.tabBarItem.title = @"个人中心";
 
    
    self.viewControllers = @[nav1,nav2,discoveryNav,nav3];
    

    if(0){
        ADView *adview = [[ADView alloc]init];
        [self.view addSubview:adview];
    }
    
   
    //注册截屏通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(userDidTakeScreenshot:)
                                                 name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)userDidTakeScreenshot:(NSNotification *)notification{

    NSLog(@"检测到截屏");
    //人为截屏, 模拟用户截屏行为, 获取所截图片
//    UIImage *image_ = [self imageWithScreenshot];
//
//    //添加显示
//    UIImageView *imgvPhoto = [[UIImageView alloc]initWithImage:image_];
//    imgvPhoto.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, self.view.frame.size.width/2, self.view.frame.size.height/2);
//    //添加边框
//    CALayer * layer = [imgvPhoto layer];
//    layer.borderColor = [
//                         [UIColor whiteColor] CGColor];
//    layer.borderWidth = 5.0f;
//    //添加四个边阴影
//    imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
//    imgvPhoto.layer.shadowOffset = CGSizeMake(0, 0);
//    imgvPhoto.layer.shadowOpacity = 0.5;
//    imgvPhoto.layer.shadowRadius = 10.0;
//    //添加两个边阴影
//    imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
//    imgvPhoto.layer.shadowOffset = CGSizeMake(4, 4);
//    imgvPhoto.layer.shadowOpacity = 0.5;
//    imgvPhoto.layer.shadowRadius = 2.0;
//    [self.view addSubview:imgvPhoto];
    
}
//截取当前屏幕
- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImagePNGRepresentation(image);
}

//返回截取到的图片
- (UIImage *)imageWithScreenshot
{
    NSData *imageData = [self dataWithScreenshotInPNGFormat];
    return [UIImage imageWithData:imageData];
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
