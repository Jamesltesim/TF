//
//  TFTableView.m
//  T_FT
//
//  Created by James on 2018/7/19.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFTableView.h"

@implementation TFTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self = [super initWithFrame:frame style:style]){
        self.tableFooterView = [[UIView alloc]init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.tableFooterView = [[UIView alloc]init];
    }
    return self;
}

- (instancetype)init{
    if(self = [super init]){
        self.tableFooterView = [[UIView alloc]init];
    }
    return self;
}

@end
