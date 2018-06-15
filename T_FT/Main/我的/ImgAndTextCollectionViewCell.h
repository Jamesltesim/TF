//
//  ImgAndTextCollectionViewCell.h
//  T_FT
//
//  Created by James on 2018/6/15.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgAndTextCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *title;
@end
