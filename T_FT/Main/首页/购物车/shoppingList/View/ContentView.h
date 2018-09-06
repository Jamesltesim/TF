//
//  FirstView.h
//  TTTT
//
//  Created by James on 2018/9/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodModel.h"
#import "PageViewDelegate.h"
#import "TFShoppingTableView.h"

@interface ContentView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)TFShoppingTableView *tableView;

@property (nonatomic,weak) id<PageViewDelegate> delegate;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic) NSInteger index;

- (void)updateFrame:(CGRect)frame;

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray <GoodModel *>*)array segmentTitle:(NSString *)title;


@end
