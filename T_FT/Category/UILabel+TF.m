//
//  UILabel+TF.m
//  T_FT
//
//  Created by James on 2018/6/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UILabel+TF.h"

@implementation UILabel (TF)




- (void)changeLineSpaceWithSpace:(float)space {
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}


@end
