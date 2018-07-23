//
//  TFTableViewController.h
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

- (instancetype)initWithTableViewFrame:(CGRect)frame style:(UITableViewStyle)style;
@end
