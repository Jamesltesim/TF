//
//  FruitCollectionViewCell.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "DrinksCollectionViewCell.h"

@implementation DrinksCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    self.layer.cornerRadius = 4.5;
    self.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    
    
//    170 127 72
    
    self.hint.textColor = [UIColor colorWithRed:170/255.0 green:127/255.0 blue:72/255.0 alpha:1];
    self.hint.layer.borderColor =[UIColor colorWithRed:170/255.0 green:127/255.0 blue:72/255.0 alpha:1].CGColor;
    self.hint.layer.borderWidth = 1;
    
//    215 129 125
    
    self.youhui.textColor = [UIColor whiteColor];
    self.youhui.backgroundColor =[UIColor colorWithRed:215/255.0 green:129/255.0 blue:125/255.0 alpha:1];
    
    
    
    self.closeBothView.numberOfLinesForTitle = 2;
    self.closeBothView.titleFont = [UIFont systemFontOfSize:15.5];
    self.closeBothView.hintFont = [UIFont systemFontOfSize:12];
    
    
//    240 132 51
    
    self.price.textColor = [UIColor colorWithRed:240/255.0 green:132/255.0 blue:51/255.0 alpha:1];
    
    self.refer.textColor = [UIColor grayColor];
  
    
    [self.hint changeLineSpaceWithSpace:2];
}

@end
