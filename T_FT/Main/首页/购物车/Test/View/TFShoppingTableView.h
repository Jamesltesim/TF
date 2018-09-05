//
//  TFShoppingTableView.h
//  T_FT
//
//  Created by James on 2018/9/5.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFShoppingTableView : UITableView

@property (nonatomic,strong,readonly) NSString *segmentTitle;

@property (nonatomic,assign) NSInteger segmentIndex;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style segmentTitle:(NSString *)title;

@end
