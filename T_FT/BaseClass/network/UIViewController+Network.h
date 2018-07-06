//
//  UIViewController+Network.h
//  T_FT
//
//  Created by James on 2018/7/6.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^requestSuccessBlock)(id responseObject);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);



typedef NS_ENUM(NSInteger,TFRestfulName) {
    
    
    TFRestfulNameForHomeBanner = 0,
    TFRestfulNameForHomeList
//    TFRestfulName,
//    TFRestfulName,
//    TFRestfulName,
//    TFRestfulName,
//    TFRestfulName
    
};


@interface UIViewController (Network)

- (void)PSOTWithAPIName:(TFRestfulName)name;
- (void)GETWithAPIName:(TFRestfulName)name;

- (void)GET:(NSString *)url parameters:(NSDictionary *)paras success:(requestSuccessBlock)success requestFailure:(requestFailureBlock)failure;


- (void)POST:(NSString *)url parameters:(NSDictionary *)paras success:(requestSuccessBlock)success requestFailure:(requestFailureBlock)failure;

@end
