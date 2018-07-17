//
//  UIView+UITapGestureRecognizer.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "UIView+UITapGestureRecognizer.h"

@implementation UIView (UITapGestureRecognizer)

//- (void)addGestureRecognizerWithAction:(SEL)action{
//    [self addGestureRecognizerWithTarget:self action:action];
//}

- (void)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    
    [self addGestureRecognizer:tap];
}


/***/
- (void)cancelAllResponder{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelAll:)];
    
    [self addGestureRecognizer:tap];
    
}

- (void)cancelAll:(UITapGestureRecognizer *)tap {
    for(UIView *tmp in self.subviews){
        if([tmp isKindOfClass:[UITextField class]]){
            UITextField *field = (UITextField *)tmp;
            [field  resignFirstResponder];
        }
    }
}
/***/
@end
