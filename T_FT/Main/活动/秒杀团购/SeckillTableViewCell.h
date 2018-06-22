//
//  SeckillTableViewCell.h
//  T_FT
//
//  Created by James on 2018/6/22.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoldoutProgressView.h"

@interface SeckillTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *tuan;
@property (weak, nonatomic) IBOutlet UILabel *yuanjia;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *yishou;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet SoldoutProgressView *soldStatus;
@end
