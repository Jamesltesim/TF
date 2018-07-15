//
//  TFDataManager.m
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFDataManage.h"


#define LOG_RECORD  @"LOG_RECORD"

/*
 日志类型
 
 1.网络状态
 2.app生命周期
 */

#define NETWORK_STATE @"network_state"
#define APP_LIFE_CYCLE @"app_life_cycle"

@interface TFDataManage()



@end

@implementation TFDataManage{
    NSMutableDictionary *_dataLog;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//
//    if([keyPath isEqualToString:@"internetConnectionStatus"]){
//
//    }
//
//}
#pragma mark - 公开方法

//程序加载完毕
- (void)didFinishLaunching{
//    [self.deviceInfo addObserver:self forKeyPath:@"internetConnectionStatus" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
    
    
}



#pragma mark - get set

/*
 {
 uuid  : XXXXX
 启动时间 : XX
 结束时间 : XX
 app版本 :
 设备类型 :
 ip地址  :
 网络状态 :
 
 log记录:[
 
 @{time   :XXX
 日志类型 :
 action：xx
 }
 
 @{time   :XXX
 日志类型 :
 action：xx
 }
 ]
 }
 
 */

- (NSMutableDictionary *)dataLog{
    if(!_dataLog){
        _dataLog = [[NSMutableDictionary alloc]initWithCapacity:0];
        [_dataLog setObject:self.deviceInfo.uuid forKey:@"uuid"];
        [_dataLog setObject:self.deviceInfo.currentTime forKey:@"start_time"];
        [_dataLog setObject:self.appInfo.appVersion forKey:@"app_version"];
  
        [_dataLog setObject:self.deviceInfo.phoneModel forKey:@"phone_model"];
        [_dataLog setObject:self.deviceInfo.ip forKey:@"ip"];
        [_dataLog setObject:@(self.deviceInfo.internetConnectionStatus) forKey:@"internet_status"];
        
        NSMutableArray *logRecord = [[NSMutableArray alloc]initWithCapacity:0];
        [_dataLog setObject:logRecord forKey:LOG_RECORD];
    }
    return _dataLog;
}

- (TFAPPInfo *)appInfo{
    if(!_appInfo){
        _appInfo = [[TFAPPInfo alloc] init];
    }
    return _appInfo;
}

- (TFDeviceInfo *)deviceInfo{
    if(!_deviceInfo){
        _deviceInfo = [[TFDeviceInfo alloc] init];
        
    }
    return _deviceInfo;
}

#pragma mark - life cycle

- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidFinishLaunchingNotification object:nil];
//     [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
       
        

//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidFinishLaunchingNotification object:nil];
        
//         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
//
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
//
//         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
//
//          [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
//
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
//
//         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidReceiveMemoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
        
    }
    return self;
}
//程序获取焦点
- (void)applicationDidBecomeActive{
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
}

//程序进入后台
- (void)applicationDidEnterBackground{
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
}

// 程序失去焦点
- (void)applicationWillResignActive{
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
}

//程序从后台回到前台
- (void)applicationWillEnterForeground{
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
}

//程序内存警告，可能要终止程序
- (void)applicationDidReceiveMemoryWarning{
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
}

//程序即将退出
- (void)applicationWillTerminate{
    NSMutableArray *marr = [self.dataLog objectForKey:LOG_RECORD];
    NSMutableDictionary *mdict = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mdict setObject:[TFDeviceInfo getCurrentTime] forKey:@"time"];
    [mdict setObject:[NSString stringWithFormat:@"%@",NSStringFromSelector(_cmd)] forKey:APP_LIFE_CYCLE];
    [marr addObject:mdict];
}
// 创建静态对象 防止外部访问
static TFDataManage *_instance;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    //    @synchronized (self) {
    //        // 为了防止多线程同时访问对象，造成多次分配内存空间，所以要加上线程锁
    //        if (_instance == nil) {
    //            _instance = [super allocWithZone:zone];
    //        }
    //        return _instance;
    //    }
    // 也可以使用一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(TFDataManage *)manager
{
    //return _instance;
    // 最好用self 用Tools他的子类调用时会出现错误
    return [[self alloc]init];
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

@end
