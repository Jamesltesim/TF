//
//  BundlingCollectionViewCell.m
//  T_FT
//
//  Created by James on 2018/7/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import "BundlingCollectionViewCell_1.h"

@implementation BundlingCollectionViewCell_1

- (void)awakeFromNib {
    [super awakeFromNib];

    self.displayView.layer.shadowColor = [UIColor colorWithRed:241/255.0 green:190/255.0 blue:181/255.0 alpha:0.8].CGColor;
//    阴影的透明度

    self.displayView.layer.shadowOpacity = 0.8f;
//    阴影的圆角

    self.displayView.layer.shadowRadius = 2.f;
//    阴影偏移量

    self.displayView.layer.shadowOffset = CGSizeMake(0,0);
    
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-5, -5)];
    //添加直线
//    [path addLineToPoint:CGPointMake(self.displayView.width /2, -5)];
    [path addLineToPoint:CGPointMake(self.displayView.width -10, -5)];
//    [path addLineToPoint:CGPointMake(self.displayView.width-5 , self.displayView.height /2)];
    [path addLineToPoint:CGPointMake(self.displayView.width -10, self.displayView.height-10)];
//    [path addLineToPoint:CGPointMake(self.displayView.width /2, self.displayView.height +5)];
    [path addLineToPoint:CGPointMake(-5, self.displayView.height-10 )];
//    [path addLineToPoint:CGPointMake(-5, self.displayView.height /2)];
    [path addLineToPoint:CGPointMake(-5, -5)];
    //设置阴影路径
    self.displayView.layer.shadowPath = path.CGPath;
    
    
    
    
    self.showImageView.layer.shadowColor = [UIColor colorWithRed:241/255.0 green:190/255.0 blue:181/255.0 alpha:0.8].CGColor;
    //    阴影的透明度
    
    self.showImageView.layer.shadowOpacity = 0.8f;
    //    阴影的圆角
    
    self.showImageView.layer.shadowRadius = 2.f;
    //    阴影偏移量
    
    self.showImageView.layer.shadowOffset = CGSizeMake(0,0);
    
    
    //路径阴影
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(-5, -5)];
    //添加直线
    //    [path addLineToPoint:CGPointMake(self.displayView.width /2, -5)];
    [path1 addLineToPoint:CGPointMake(self.showImageView.width -10, -5)];
    //    [path addLineToPoint:CGPointMake(self.displayView.width-5 , self.displayView.height /2)];
    [path1 addLineToPoint:CGPointMake(self.showImageView.width -10, self.showImageView.height-10)];
    //    [path addLineToPoint:CGPointMake(self.displayView.width /2, self.displayView.height +5)];
    [path1 addLineToPoint:CGPointMake(-5, self.showImageView.height-10 )];
    //    [path addLineToPoint:CGPointMake(-5, self.displayView.height /2)];
    [path1 addLineToPoint:CGPointMake(-5, -5)];
    //设置阴影路径
    self.showImageView.layer.shadowPath = path1.CGPath;
}

@end
