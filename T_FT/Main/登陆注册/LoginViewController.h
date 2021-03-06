//
//  LoginViewController.h
//  T_FT
//
//  Created by James on 2018/7/12.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *policyBtn;

//验证成功之后 FingerprintViewController会自动消失，在消失之前需要做的事情放在 before中
- (instancetype)initWithDismissViewControllerAnimated:(BOOL)animated before:(void(^)(void))before;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dismissViewControllerAnimated:(BOOL)animated before:(void(^)(void))before;
@end
