//
//  TFAPICallBackProtocol.h
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TFAPIBaseManager;

typedef NS_ENUM(NSInteger,TFAPIRequestName){
    TFAPIRequestNameForHomeBannner = 0,
    TFAPIRequestNameForHomeList = 1,
    TFAPIRequestNameForHomeList1 = 2
};


//请求成功回调block
typedef void (^requestSuccessBlock)(id responseObject);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);


@protocol TFAPICallBackProtocol <NSObject>


//请求成功
- (void)TFAPICallBackDidSuccess:(TFAPIBaseManager *)manager;

//请求失败
- (void)TFAPICallBackDidFailed:(TFAPIBaseManager *)manager;



//- (void)TFAPIWithHomeBanner:(TFAPIBaseManager *)manager success:(requestSuccessBlock)success failurere:(requestFailureBlock)failurere;

@end
