//
//  LTPersonalMainPageTestVC.h
//  OCExample
//
//  Created by 高刘通 on 2018/6/28.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingTableViewCell.h"
#import "GoodModel.h"

@interface TFShoppingIndexPath : NSObject

@property (nonatomic) NSInteger titleIndex;
@property (nonatomic) NSInteger rowIndex;

@end




@protocol TFShoppingListDelegate<NSObject>

- (void)TFShoppingListWithTableView:(UITableView *)tableView cell:(ShoppingTableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath data:(GoodModel *)data;

- (void)TFShoppingListWithTableView:(UITableView *)tableView cell:(ShoppingTableViewCell *)cell didSelectRowAtIndexPath:(TFShoppingIndexPath *)indexPath data:(GoodModel *)data;

@end

@interface LTPersonalMainPageTestVC : UIViewController

@property (nonatomic) NSInteger titleIndex;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) id<TFShoppingListDelegate> delegate;

- (void)showCashierDeskWithHeight:(CGFloat)height;
- (void)hienCashierDesk;
- (void)reloadData;
@end
