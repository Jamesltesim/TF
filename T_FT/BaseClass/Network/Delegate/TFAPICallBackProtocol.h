//
//  TFAPICallBackProtocol.h
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,TFAPIRequestName){
    TFAPIRequestNameForHomeBannner = 0,
    TFAPIRequestNameForHomeList = 1,
    TFAPIRequestNameForHomeList1 = 2
};

@protocol TFAPICallBackProtocol <NSObject>

@end
