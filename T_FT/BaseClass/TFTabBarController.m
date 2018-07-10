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
#import "HomeNavigationController.h"
#import "ActivityViewController.h"
#import "MeViewController.h"
#import "ADView.h"
#import "FloatingView.h"

@interface TFTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) HomeViewController *HomeController;

@property (nonatomic,strong) FloatingView *floatView;

@end

@implementation TFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.HomeController = [[HomeViewController alloc]init];
    ActivityViewController *second = [[ActivityViewController alloc]init];
    MeViewController *third = [[MeViewController alloc]init];

    //    BDFourthViewController1 *fourth = [[BDFourthViewController1 alloc] init];
//    first.title = @"体育投注";
//    third.title = @"投注单";
    
    
    
    UINavigationController *nav1 = [[HomeNavigationController alloc] initWithRootViewController:self.HomeController];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:third];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:fourth];
    
    nav1.tabBarItem.title = @"首页";
    nav2.tabBarItem.title = @"活动";
    nav3.tabBarItem.title = @"个人中心";
 
    
    self.viewControllers = @[nav1,nav2,nav3];
    
    
    self.delegate = self;
    if(0){
        ADView *adview = [[ADView alloc]init];
        [self.view addSubview:adview];
    }
  
    ///////
    self.floatView = [[FloatingView alloc]initWithFrame:CGRectMake(kScreenWidth-80, kScreenHeight-150, 60, 60) mainImageName:@"timg1.png" bgcolor:[UIColor lightGrayColor] animationColor:[UIColor purpleColor]];
    
    [self.view addSubview:self.floatView];
    
         __weak __typeof(self)weakSelf = self;
    self.floatView.callService = ^{
     
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拨打候鸟旅居网客服电话？" message:@"4000301679" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *defintAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIApplication *app = [UIApplication sharedApplication];
            
            NSString *strUrl = [NSString stringWithFormat:@"tel://4000301679"];
            
            NSURL *url = [NSURL URLWithString:strUrl];
            
            [app openURL:url ];
        }];
        
        [alert addAction:cancleAction];
        [alert addAction:defintAction];
        [strongSelf presentViewController:alert animated:YES completion:nil];
        
        
    };
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if([viewController isKindOfClass:[HomeNavigationController class]]){
        self.floatView.hidden = NO;
    }else{
        self.floatView.hidden = YES;
    }
}
//- (void)closeAction{
////    [self.view removeFromSuperview];
//}


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
