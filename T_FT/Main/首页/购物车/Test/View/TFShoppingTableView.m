//
//  TFShoppingTableView.m
//  T_FT
//
//  Created by James on 2018/9/5.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFShoppingTableView.h"

@implementation TFShoppingTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style segmentTitle:(NSString *)title{
    if(self = [super initWithFrame:frame style:style]){
        _segmentTitle = title;
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
