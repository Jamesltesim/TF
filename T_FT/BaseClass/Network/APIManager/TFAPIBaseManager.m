//
//  TFAPIBaseManager.m
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPIBaseManager.h"
#import "TFBaseManagerDelegate.h"

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


@end
