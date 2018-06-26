//
//  iBeaconViewController.m
//  T_FT
//
//  Created by James on 2018/6/25.
//  Copyright © 2018年 James. All rights reserved.
//

#import "iBeaconViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>


#define UUID [[NSUUID alloc]initWithUUIDString:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"] // uuid可替换为自己需要的

@interface iBeaconViewController ()
<CBPeripheralManagerDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CBPeripheralManager *peripheraManager;

@property (strong,nonatomic) NSMutableString *logString;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation iBeaconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL availableMonitor = [CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]];
    
   
     
    if (availableMonitor) {
        CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
        switch (authorizationStatus) {
            case kCLAuthorizationStatusNotDetermined:
                [self.locationManager requestAlwaysAuthorization];
                [self.locationManager requestWhenInUseAuthorization];
                break;
            case kCLAuthorizationStatusRestricted:
            case kCLAuthorizationStatusDenied:
                NSLog(@"受限制或者拒绝");
                break;
            case kCLAuthorizationStatusAuthorizedAlways:
            case kCLAuthorizationStatusAuthorizedWhenInUse:{
                [self beaconBroadCasting]; // 广播自身
                [self beaconMonitoring]; // 扫描附近广播
            }
                break;
        }
    } else {
        NSLog(@"该设备不支持 CLBeaconRegion 区域检测");
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 停止检测区域
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}
//
- (CLBeaconRegion *)beaconRegion {
    if (!_beaconRegion) {
        _beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:UUID identifier:[UUID UUIDString]];
        _beaconRegion.notifyEntryStateOnDisplay = YES;
    }
    return _beaconRegion;
}

- (NSMutableString *)logString{
    if(!_logString){
        _logString = [[NSMutableString alloc]initWithCapacity:0];
    }
    
    return _logString;
}

#pragma mark - BroadCast
- (void)beaconBroadCasting{
    // 创建并广播信号
    if (!_peripheraManager)
    {
        _peripheraManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    else
    {
        _peripheraManager.delegate = self;
    }
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSDictionary *peripheralData = nil;
        CLBeaconRegion * region = [[CLBeaconRegion alloc] initWithProximityUUID:UUID major:1 minor:10000 identifier:[UUID UUIDString]];// UUID、major、minor将会在后面解释
        peripheralData = [region peripheralDataWithMeasuredPower:nil];
        if(peripheralData)
        {
            [self.peripheraManager startAdvertising:peripheralData];
        }
    }
}

#pragma mark - Monitor
- (void)beaconMonitoring{
    
    self.beaconRegion.notifyOnEntry = YES;
    self.beaconRegion.notifyOnExit = YES;
    //    self.beaconRegion.notifyEntryStateOnDisplay = YES;
    

    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    
    CLLocationCoordinate2D companyCenter;
    
    companyCenter.latitude = 22;
    companyCenter.longitude = 11;
    //    [self.locationManager startMonitoringForRegion:[[CLCircularRegion alloc] initWithCenter:companyCenter
    //
    //                                                                                     radius:50 identifier:@"car"]];
    
//    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSString *errorString;
    NSLog(@"定位失败原因: %@",[error localizedDescription]);
    switch([error code]) {
        case kCLErrorLocationUnknown:
            // do something...
            break;
        case kCLErrorDenied:
            // do something...
            break;
            
    
            
    }
}


- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    // 发现有iBeacon设备进入扫描范围回调
    
    NSLog(@"发现有iBeacon设备进入扫描范围回调");
    [self.logString appendString:@"发现有iBeacon设备进入扫描范围回调\n"];
    self.label.text =self.logString;
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region{
    // 扫描到iBeacon设备回调，扫描到的beacon存在数组beacons中
    // 打印iBeacon信息
    for (CLBeacon *beacon in beacons) {
        // iBeacon参数将在后面介绍
        
        NSLog(@"%@",beacon);
        
//        [self.logString appendString:[NSString stringWithFormat:@"%@ \n proximity:%ld",beacon,(long)beacon.proximity]];
        self.label.text = [NSString stringWithFormat:@"%@ \n proximity:%ld",beacon,(long)beacon.proximity];
    }
}

@end
