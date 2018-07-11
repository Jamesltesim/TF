//
//  TFAPIBaseManager.m
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPIBaseManager.h"
#import "TFBaseManagerDelegate.h"
#import "AFNetworking.h"


@interface TFAPIBaseManager()

@property (nonatomic, weak) id<TFBaseManagerDelegate> child;

@end

@implementation TFAPIBaseManager

- (instancetype)init {
    self = [super init];
    if ([self conformsToProtocol:@protocol(TFBaseManagerDelegate)]) {
        self.child = (id<TFBaseManagerDelegate>)self;
    } else {
        // 不遵守这个protocol的就让他crash，防止派生类乱来。
        NSAssert(NO, @"子类必须要实现 TFBaseManagerDelegate 这个protocol。");
    }
    return self;
}

- (void)loadData{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    if([self.delegate respondsToSelector:@selector(TFAPICallBackDidSuccess:)]){
        [self.delegate TFAPICallBackDidSuccess:self];
    }
}



- (void)GET:(NSString *)url parameters:(NSDictionary *)paras success:(requestSuccessBlock)success requestFailure:(requestFailureBlock)failure{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"username":@"520it",
                           @"pwd":@"520it"
                           };
    // parameters 参数字典
    [manager GET:@"http://120.25.226.186:32812/login" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
        //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // task 我们可以通过task拿到响应头
        // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
        
        if(success) success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // error 错误信息
        if(failure) failure(error);
    }];
    
    
}

- (void)POST:(NSString *)url parameters:(NSDictionary *)paras success:(requestSuccessBlock)success requestFailure:(requestFailureBlock)failure{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"username":@"520it",
                           @"pwd":@"520it"
                           };
    [manager POST:@"http://120.25.226.186:32812/login" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        // 进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(success) success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        if(failure) failure(error);
    }];
    
    
}

@end
