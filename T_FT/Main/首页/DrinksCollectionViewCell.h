//
//  FruitCollectionViewCell.h
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFCloseBothLabel.h"

@interface DrinksCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *hint;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *youhui;

@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *refer;

@property (weak, nonatomic) IBOutlet TFCloseBothLabel *closeBothView;
@end
