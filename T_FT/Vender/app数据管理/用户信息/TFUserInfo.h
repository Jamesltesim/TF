//
//  TFUserInfo.h
//  T_FT
//
//  Created by James on 2018/7/17.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFUserInfo : NSObject

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *userID;

@property (nonatomic) BOOL isLogin;
@property (nonatomic) BOOL haveDeliveryAddress;

@end
