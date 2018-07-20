//
//  LTPersonalMainPageTestVC.h
//  OCExample
//
//  Created by 高刘通 on 2018/6/28.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TFShoppingListDelegate<NSObject>

- (void)TFShoppingListWithTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LTPersonalMainPageTestVC : UIViewController

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) id<TFShoppingListDelegate> delegate;

- (void)reloadData;
@end
