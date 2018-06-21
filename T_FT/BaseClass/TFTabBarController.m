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
#import "MeViewController.h"
#import "ADView.h"

@interface TFTabBarController ()

@end

@implementation TFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *first = [[HomeViewController alloc]init];
    ActivityViewController *second = [[ActivityViewController alloc]init];
    MeViewController *third = [[MeViewController alloc]init];

    //    BDFourthViewController1 *fourth = [[BDFourthViewController1 alloc] init];
//    first.title = @"体育投注";
//    third.title = @"投注单";
    
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:third];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:fourth];
    
    nav1.tabBarItem.title = @"首页";
    nav2.tabBarItem.title = @"活动";
    nav3.tabBarItem.title = @"个人中心";
 
    
    self.viewControllers = @[nav1,nav2,nav3];
    
    if(0){
        ADView *adview = [[ADView alloc]init];
        [self.view addSubview:adview];
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
