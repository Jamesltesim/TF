//
//  TFAPICenter.h
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFAPIBaseManager.h"

@interface TFAPICenter : NSObject

+ (void)loadData:(TFAPIRequestName)apiName delegate:(id<TFAPICallBackProtocol>)delegate;

@end
