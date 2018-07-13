//
//  FingerprintViewController.m
//  T_FT
//
//  Created by James on 2018/7/12.
//  Copyright © 2018年 James. All rights reserved.
//

#import "FingerprintViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface FingerprintViewController ()

@property (nonatomic) BOOL dismissControllerAnimated;
@property(nonatomic,strong)void(^doBefore)(void);

@end

@implementation FingerprintViewController


- (instancetype)initWithDismissViewControllerAnimated:(BOOL)animated before:(void (^)(void))before{
    if(self = [super init]){
        
        self.dismissControllerAnimated = animated;
        self.doBefore = before;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *fingerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fingerprint"]];
    fingerImageView.frame = CGRectMake(0, 0, 68, 68);
    fingerImageView.userInteractionEnabled = YES;
    fingerImageView.center = self.view.center;
    [self.view addSubview:fingerImageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerprintTap:)];
    [fingerImageView addGestureRecognizer:tap];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(fingerImageView.frame.origin.x, fingerImageView.frame.origin.y+fingerImageView.frame.size.height, 150, 20)];
    lab.text = @"点击验证指纹";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.center = CGPointMake(fingerImageView.center.x, fingerImageView.center.y + fingerImageView.frame.size.height/2 +20);
    lab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:lab];
    
    
    self.navigationController.navigationBar.hidden = YES;
    [self evaluateAuthenticate];
    
}

- (void)fingerprintTap:(UITapGestureRecognizer *)tap {
    [self evaluateAuthenticate];
}

- (void)evaluateAuthenticate
{
    //创建LAContext
    LAContext *context = [LAContext new];
    
    //这个属性是设置指纹输入失败之后的弹出框的选项
    context.localizedFallbackTitle = @"没有忘记密码";
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"支持指纹识别");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"通过Home键验证指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"验证成功 刷新主界面");
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    [self authenticationSuccess];
                }];
                
            }else{
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"系统取消授权，如其他APP切入");
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        NSLog(@"用户取消验证Touch ID");
                        break;
                    }
                    case LAErrorAuthenticationFailed:
                    {
                        NSLog(@"授权失败");
                        break;
                    }
                    case LAErrorPasscodeNotSet:
                    {
                        NSLog(@"系统未设置密码");
                        break;
                    }
                    case LAErrorTouchIDNotAvailable:
                    {
                        NSLog(@"设备Touch ID不可用，例如未打开");
                        break;
                    }
                    case LAErrorTouchIDNotEnrolled:
                    {
                        NSLog(@"设备Touch ID不可用，用户未录入");
                        break;
                    }
                    case LAErrorUserFallback:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"用户选择输入密码，切换主线程处理");
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"其他情况，切换主线程处理");
                        }];
                        break;
                    }
                }
            }
        }];
    }else{
        NSLog(@"不支持指纹识别");
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
    }
}


- (void)authenticationSuccess{
    
    if(self.doBefore) self.doBefore();
    
    if(self.navigationController){
       
        [self.navigationController popViewControllerAnimated:self.dismissControllerAnimated];
    }else{
        [self dismissViewControllerAnimated:self.dismissControllerAnimated completion:^{
            
        }];
    }
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
