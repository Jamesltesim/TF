//
//  LostCollectionViewCell.h
//  T_FT
//
//  Created by James on 2018/6/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet UILabel *descLab;

@end
