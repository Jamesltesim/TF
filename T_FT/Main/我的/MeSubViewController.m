//
//  MeSubViewController.m
//  T_FT
//
//  Created by James on 2018/6/19.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeSubViewController.h"

@interface MeSubViewController ()

@end

@implementation MeSubViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
         self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
       
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.navView = [TFNavView creatNavView];
    [self.navView addLeftButtonWithTarget:self action:@selector(back:)];
    [self.view addSubview:self.navView];
    
  
    
}

- (void)back:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
