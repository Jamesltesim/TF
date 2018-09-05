//
//  PageViewDelegate.h
//  T_FT
//
//  Created by James on 2018/9/5.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
//#impot "TFShoppingTableView.h"
@class TFShoppingTableView;

@protocol PageViewDelegate <NSObject>

- (UITableViewCell *)shoppingTableView:(TFShoppingTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)shoppingTableView:(TFShoppingTableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (CGFloat)shoppingTableView:(TFShoppingTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
