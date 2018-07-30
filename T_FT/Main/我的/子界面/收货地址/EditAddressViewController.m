//
//  EditAddressViewController.m
//  T_FT
//
//  Created by James on 2018/7/17.
//  Copyright © 2018年 James. All rights reserved.
//

#import "EditAddressViewController.h"

@interface EditAddressViewController ()

@end

@implementation EditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navView.title = @"编辑收货人";
    
    self.nameField.text = self.name;
    self.phoneField.text = self.phone;
    self.schoolField.text = self.schoolName;
    self.addressTextView.text = self.address;
    
    
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
