//
//  LTPersonMainPageDemo.h
//  OCExample
//
//  Created by 高刘通 on 2018/6/28.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTScrollView-Swift.h"

@interface LTPersonMainPageDemo : UIViewController

@property(copy, nonatomic) NSArray <NSString *> *titles;
    
@property(strong, nonatomic) LTSimpleManager *managerView;

@property(strong, nonatomic) UIImageView *headerImageView;
@end
