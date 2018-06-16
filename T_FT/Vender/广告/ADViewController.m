//
//  ADViewController.m
//  T_FT
//
//  Created by James on 2018/6/15.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ADViewController.h"

@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:0.7];

    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    imgView.frame = CGRectMake(0, 0, 230, 280);
    imgView.center = CGPointMake(self.view.center.x, self.view.center.y+20);
    
    [self.view addSubview:imgView];
    
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(0, 0, 44, 44);
    close.center = CGPointMake(self.view.center.x, imgView.bottom  + 100);
    [close setBackgroundImage:[UIImage imageNamed:@"ad_close"] forState:UIControlStateNormal];
    [close addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:close];
                            
                        
}

- (void)closeAction{
    [self.view removeFromSuperview];
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
