//
//  PhotosTool.h
//  面试题
//
//  Created by 清正 on 16/9/12.
//  Copyright © 2016年 qz. All rights reserved.
//

/*
 <key>NSRemindersUsageDescription</key>
 <string>为了更好的体验,请允许访问备忘录</string>
 <key>NSCalendarsUsageDescription</key>
 <string>为了更好的体验,请允许访问日历</string>
 <key>NSContactsUsageDescription</key>
 <string>为了更好的体验,请允许访问您的联系人</string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>为了更好的体验,请允许使用时获取位置</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>为了更好的体验,请允许app后台获取位置</string>
 <key>NSMicrophoneUsageDescription</key>
 <string>为了更好的体验,请允许访问您的麦克风</string>
 <key>NSCameraUsageDescription</key>
 <string>为了更好的体验,请允许访问您的相机</string>
 <key>NSPhotoLibraryUsageDescription</key>
 <string>为了更好的体验,请允许访问您的相册</string>
 */

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import <EventKit/EventKit.h>
#import <CoreLocation/CoreLocation.h>

//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#import <Photos/Photos.h>
//#else
#import <AssetsLibrary/AssetsLibrary.h>
//#endif


//获取网络权限 需要的库
#import<CoreTelephony/CTCellularData.h>
///各大权限问题
@interface PermissionTool : UIImageView <CLLocationManagerDelegate>
/**
 * 返回主线程 (如果当前是主线程 则无需返回)
 */
+ (void)returnMainThread:(void (^)(void))block;

/**
 *  获取写入照片权限
 *  @param block NSInteger authStatus(1:可以访问, 2:系统原因受限(家长监控), 3:用户已明确拒绝访问)
 */
+(void)getPhotosPermission:(void (^)(NSInteger authStatus))block;
/**
 *  获取访问相机权限(模拟器上默认拒绝)
 *
 *  @param block 如上
 */
+ (void)getCamerasPermission:(void (^)(NSInteger authStatus))block;

/**
 *  获取访问麦克风权限(模拟器上默认允许)
 *
 *  @param block 如上
 */
+ (void)getMicrophonePermission:(void (^)(NSInteger authStatus))block;

/**
 *  打开"设置"->"允许权限访问"页
 *  ⚠️ 如果当前app没有请求隐私权限,进入设置页会崩溃
 */
+ (void)openSettingPermission;

/**
 *  获取位置权限
 *  @param isAlwaysUse 是否后台一直定位(建议:NO)
 *  @param block    0:允许后台一直定位(耗电大,描述不清的情况下会被拒绝上架)
 *                  1:允许使用时定位
 *                  2:系统原因受限(系统定位服务未开启)
 *                  3:用户已明确拒绝访问位置信息
 */
+ (void)getLocationPermission:(BOOL)isAlwaysUse result:(void (^)(NSInteger authStatus))block;
/**
 *  获取通讯录权限
 *
 *  @param block 同"获取写入照片权限"的block参数
 */
+(void)getAddressBookPermission:(void (^)(NSInteger authStatus))block;

/**
 *  获取日历权限
 *
 *  @param block 同"获取写入照片权限"的block参数
 */
+(void)getEventPermission:(void (^)(NSInteger authStatus))block;
/**
 *  获取备忘录权限
 *
 *  @param block 同"获取写入照片权限"的block参数
 */
+(void)getReminderPermission:(void (^)(NSInteger authStatus))block;


/**
 获取网络权限状态

 @param block   0 系统版本ios10一下，不支持此方法
                1 权限关闭的情况下 再次请求网络数据会弹出设置网络提示
                2 已经开启网络权限 监听网络状态
                3 未知情况 （还没有遇到推测是有网络但是连接不正常的情况下）
 */
+(void)getCellularDataPermission:(void (^)(NSInteger authStatus))block;


/**
 判断推送通知是否开启

 //跳转到 设置界面 
 UIApplication *application = [UIApplication sharedApplication];
 NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
 if ([application canOpenURL:url]) {
 if(@available(iOS 10.0,*)){
 [application openURL:url options:@{} completionHandler:nil];
 }else{
 [application openURL:url];
 }
 
 
 @return return value description
 */
+ (BOOL)isUserNotificationEnable;

@end
