//
//  TFAPICenter.m
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPICenter.h"

@implementation TFAPICenter


+ (void)loadData:(TFAPIRequestName)apiName delegate:(id<TFAPICallBackProtocol>)delegate{
    NSString *className = [self APIManagerName:apiName];
    Class class = NSClassFromString(className);
    TFAPIBaseManager *manager = [[class alloc] init];
    manager.delegate = delegate;
    
    [manager performSelector:@selector(loadData) withObject:nil];

}

+ (NSString *)APIManagerName:(TFAPIRequestName)apiName{
    NSDictionary *managerDict = @{@(TFAPIRequestNameForHomeBannner):@"TFAPIHomeBanner"};
    
    if(![managerDict.allKeys containsObject:@(apiName)]){
         NSAssert(NO, @"apiName 有问题");
    }
    
    return managerDict[@(apiName)];
}

@end
