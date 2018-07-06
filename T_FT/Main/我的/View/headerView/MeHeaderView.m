//
//  MeHeaderView.m
//  T_FT
//
//  Created by James on 2018/6/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeHeaderView.h"
#import "ScrollImage.h"
#import "UIImage+imgaeWithColor.h"
#import "LoginView.h"
#import "LogoutView.h"


@interface MeHeaderView()

@property (nonatomic,strong) LoginView *loginView;
@property (nonatomic,strong) LogoutView *logoutView;

@end

@implementation MeHeaderView

- (LogoutView *)logoutView{
    if(!_logoutView){
        _logoutView = [[LogoutView alloc] initWithFrame:self.bounds];
    }
    return _logoutView;
}

- (LoginView *)loginView{
    if(!_loginView){
        _loginView = [[LoginView alloc] initWithFrame:self.bounds];
    }
    return _loginView;
}

- (instancetype) initWithFrame:(CGRect)frame login:(BOOL)isLogin{
    MeHeaderView *headerView = [[MeHeaderView alloc]initWithFrame:frame];
    
    if(isLogin){
        [headerView addSubview:headerView.loginView];
    }else{
        [headerView addSubview:headerView.logoutView];
    }
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(logoutViewClick:)];
    [headerView.logoutView addGestureRecognizer:tap];
    
    return headerView;
}

- (void)logoutViewClick:(UITapGestureRecognizer *)tap {
    if([self.delegate respondsToSelector:@selector(logoutViewClick)]){
        [self.delegate logoutViewClick];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
         UIImage *image = [UIImage imageNamed:@"timg1.jpeg"];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:self.bounds];
        imgView.image = [UIImage blurryImage:image withBlurLevel:0.5];
        [self addSubview:imgView];
        
        
        
//
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            CIContext *context = [CIContext contextWithOptions:nil];
//            CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
//            CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//            [filter setValue:ciImage forKey:kCIInputImageKey];
//            //设置模糊程度
//            [filter setValue:@30.0f forKey: @"inputRadius"];
//            CIImage *result = [filter valueForKey:kCIOutputImageKey];
//            CGRect frame = [ciImage extent];
//            NSLog(@"%f,%f,%f,%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
//            CGImageRef outImage = [context createCGImage: result fromRect:ciImage.extent];
//            UIImage * blurImage = [UIImage imageWithCGImage:outImage];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                imgView.image = blurImage;
//            });
//        });
    }
    return self;
    
}

@end
