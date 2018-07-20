//
//  UILabel+TF.m
//  T_FT
//
//  Created by James on 2018/6/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UILabel+TF.h"

@implementation UILabel (TF)


//- (CGSize)sizeFellowString{
//     return  [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size.height;
//}

- (void)widthFellowString{
  CGSize size =  [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size;
    
    CGRect rect = self.frame;
    CGPoint center = self.center;
    
    self.frame = CGRectMake(rect.origin.x, rect.origin.y,size.width , size.height);
    self.center = center;
}
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
