//
//  TFAPIBaseManager.h
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFAPICallBackProtocol.h"

@interface TFAPIBaseManager : NSObject

//回调的代理,需要遵守EWAPICallBackProtocol协议
@property (nonatomic , weak) id<TFAPICallBackProtocol> delegate;

////自定义response用来统一保存数据和error
//@property (nonatomic , strong) EWResponse *response;
//
////外部传入的参数
//@property (strong,nonatomic) NSMutableDictionary *outerParams;
//
//
////是否需要缓存
//- (NSNumber *)shouldCache;
///**
// * 加载数据
// */
//- (void)loadData;
///**
// * 取消请求
// */
//- (void)cancelAllRequest;




@end
