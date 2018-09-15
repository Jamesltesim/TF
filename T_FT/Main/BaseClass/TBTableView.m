//
//  TBTableView.m
//  T_FT
//
//  Created by James on 2018/9/15.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TBTableView.h"

@implementation TBTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self = [super initWithFrame:frame style:style]){

        self.estimatedRowHeight = 100;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
