//
//  TFDeviceInfo.m
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//



#import "TFDeviceInfo.h"
#import "TBKeyChain.h"


@interface TFDeviceInfo()

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;

@end

@implementation TFDeviceInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        /*
         Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the method reachabilityChanged will be called.
         */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        
        //Change the host name here to change the server you want to monitor.
        NSString *remoteHostName = @"www.fruitdj.com";
//        NSString *remoteHostLabelFormatString = NSLocalizedString(@"Remote Host: %@", @"Remote host label format string");
//        self.remoteHostLabel.text = [NSString stringWithFormat:remoteHostLabelFormatString, remoteHostName];
        
        self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
        [self.hostReachability startNotifier];
        [self updateInterfaceWithReachability:self.hostReachability];
        
        self.internetReachability = [Reachability reachabilityForInternetConnection];
        [self.internetReachability startNotifier];
        [self updateInterfaceWithReachability:self.internetReachability];
    }
    return self;
}

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    if (reachability == self.hostReachability)
    {
      
        
        switch (netStatus)
        {
            case NotReachable:        {
                statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
                //            imageView.image = [UIImage imageNamed:@"stop-32.png"] ;
                /*
                 Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
                 */
                connectionRequired = NO;
                break;
            }
                
            case ReachableViaWWAN:        {
                statusString = NSLocalizedString(@"Reachable WWAN", @"");
                //            imageView.image = [UIImage imageNamed:@"WWAN5.png"];
                break;
            }
            case ReachableViaWiFi:        {
                statusString= NSLocalizedString(@"Reachable WiFi", @"");
                //            imageView.image = [UIImage imageNamed:@"Airport.png"];
                break;
            }
        }
        
        if (connectionRequired)
        {
            NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
            statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
        }
        //    textField.text= statusString;
        _remoteHostNetworkStatus = netStatus;
    }
        
    
    if (reachability == self.internetReachability)
    {
        switch (netStatus)
        {
            case NotReachable:        {
                statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
                //            imageView.image = [UIImage imageNamed:@"stop-32.png"] ;
                /*
                 Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
                 */
                connectionRequired = NO;
                break;
            }
                
            case ReachableViaWWAN:        {
                statusString = NSLocalizedString(@"Reachable WWAN", @"");
                //            imageView.image = [UIImage imageNamed:@"WWAN5.png"];
                break;
            }
            case ReachableViaWiFi:        {
                statusString= NSLocalizedString(@"Reachable WiFi", @"");
                //            imageView.image = [UIImage imageNamed:@"Airport.png"];
                break;
            }
        }
        
        if (connectionRequired)
        {
            NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
            statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
        }
        //    textField.text= statusString;
        _internetConnectionStatus = netStatus;
    }
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

#pragma mark- get set

- (CGSize)screenSize{
    return [UIScreen mainScreen].bounds.size;
}

- (NSString *)uuid{
    NSString * strUUID = (NSString *)[TBKeyChain load:KEY_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain  @"com.company.app.usernamepassword"
        [TBKeyChain save:KEY_PASSWORD data:strUUID];
        
    }
    return strUUID;
}

- (NSString *)ip{
    return @"";
}

- (NSString *)systemLanguage{
    //获取当前设备语言
    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    return  [appLanguages objectAtIndex:0];
}

- (NSString *)currentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

@end
