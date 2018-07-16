//
//  PrintPhotoTableViewCell.h
//  T_FT
//
//  Created by James on 2018/6/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrintPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@end
