//
//  AppDelegate.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//
//com.abc.TFT
#import "AppDelegate.h"
#import "DCNewFeaturesViewController.h"
#import "TFTabBarController.h"
#import "DCFeaturesTool.h"

#import "LoginViewController.h"

#import<CoreTelephony/CTCellularData.h>

#import "algorithm.h"
#import "TFDataManage.h"
#import "IQKeyboardManager.h"
#import "TFAPIConfig.h"


#import "TFVerification.h"
//参考
//天天果园 app

//趣印 有福 口袋冲印 app

//找回app

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self setUpRootViewController]; //设置根控制器
    
    [self.window makeKeyAndVisible];
    [PermissionTool getCellularDataPermission:^(NSInteger authStatus) {
        NSLog(@"authStatus:%ld",authStatus);
    }];
      [IQKeyboardManager sharedManager].enable = NO;
//    NSLog(@"是否展示新特性页面：%@",[DCFeaturesTool dc_isShowNewFeatures] ? @"true" : @"false");
    
    NSLog(@"checkUserIdCard %d", [TFVerification checkUserIdCard:@"921111199001201111"]);
    if (@available(iOS 11.0, *)) {
        
    }else{
        
    }

//    NSLog(@"%s",getSerialWithUid(123456789));
//    检测应用中是否有联网权限
//    CTCellularData *cellularData = [[CTCellularData alloc]init];
//    cellularData.cellularDataRestrictionDidUpdateNotifier =  ^(CTCellularDataRestrictedState state){
//        //获取联网状态
//        switch (state) {
//            case kCTCellularDataRestricted:
//                NSLog(@"Restricrted");
//                break;
//            case kCTCellularDataNotRestricted:
//                NSLog(@"Not Restricted");
//                break;
//            case kCTCellularDataRestrictedStateUnknown:
//                NSLog(@"Unknown");
//                break;
//            default:
//                break;
//        };
//    };
//
    
//    查询应用是否有联网功能
//    CTCellularData *cellularData = [[CTCellularData alloc]init];
//    CTCellularDataRestrictedState state = cellularData.restrictedState;
//    switch (state) {
//        case kCTCellularDataRestricted:
//            NSLog(@"Restricrted");
//            break;
//        case kCTCellularDataNotRestricted:
//            NSLog(@"Not Restricted");
//            break;
//        case kCTCellularDataRestrictedStateUnknown:
//            NSLog(@"Unknown");
//            break;
//        default:
//            break;
//    }

    [[TFDataManage manager] didFinishLaunching];
    [[TFAPIConfig shareInstance] networkType:TFAPIConfigNetworkTypeLocal];

    NSLog(@"网络：%ld",[TFDataManage manager].deviceInfo.internetConnectionStatus);
        NSLog(@"%@",[TFDataManage manager].dataLog);
//    NSLog(@"aaa--- %@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]);
    return YES;
}




#pragma mark - 设置根控制器。使用CDDNewFeatures 实现 引导页
- (void)setUpRootViewController
{
    UIViewController *dcHomeVc = [[TFTabBarController alloc]init];

    if ([DCFeaturesTool dc_isShowNewFeatures]) {

        DCNewFeaturesViewController *dcNewVc = [DCNewFeaturesViewController new];
        [dcNewVc setUpFeatureAttribute:^(NSArray *__autoreleasing *usImageArray, NSArray *__autoreleasing *ixImageArray, NSString *__autoreleasing *imEnjoyImg, UIColor *__autoreleasing *selColor, BOOL *isDefaultPass, BOOL *showSkip, BOOL *showPageCount) {

            *usImageArray = @[@"guide1",@"guide2",@"guide3",@"guide4"];
            *ixImageArray = @[@"guide1_x",@"guide2_x",@"guide3_x",@"guide4_x"];

            *showPageCount = YES;
            *showSkip = YES;
            *isDefaultPass = YES;
            *imEnjoyImg = @"hidden";

        } WithDismissBlock:^{ //点击跳过-方法一
            [DCFeaturesTool dc_restoreRootViewController:dcHomeVc WithAnimations:DCFeaturesChangeVcGradient];
        }];

        //        dcNewVc.dismissBlock = ^{//点击跳过-方法二
        //            [DCFeaturesTool dc_restoreRootViewController:dcHomeVc WithAnimations:DCFeaturesChangeVcGradient];
        //        };

        self.window.rootViewController = dcNewVc;

    }else{

//        self.window.rootViewController = [ShoppingListViewController new];
        self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil]];
        
        self.window.rootViewController = dcHomeVc;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
   [[TFDataManage manager] applicationWillResignActive];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[TFDataManage manager] applicationDidEnterBackground];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[TFDataManage manager] applicationWillEnterForeground];
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[TFDataManage manager] applicationDidBecomeActive];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [[TFDataManage manager] applicationWillTerminate];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
