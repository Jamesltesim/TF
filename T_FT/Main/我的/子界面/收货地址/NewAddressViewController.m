//
//  NewAddressViewController.m
//  T_FT
//
//  Created by James on 2018/7/17.
//  Copyright © 2018年 James. All rights reserved.
//

#import "NewAddressViewController.h"

@interface NewAddressViewController ()
@end

@implementation NewAddressViewController

    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView.title = @"新建收货人";
//    self.nameField = [self createFieldWithTop:self.navView.bottom+15 labText:@"收货人:"];
//    self.phoneField = [self createFieldWithTop:self.nameField.bottom labText:@"手机号:"];
//    self.schoolField = [self createFieldWithTop:self.phoneField.bottom labText:@"所在区域:"];
//    self.addressTextView = [self createTextViewWithTop:self.schoolField.bottom labText:@"详细地址:"];
//
//
//    self.schoolField.delegate = self;
//    [self.schoolField addTapGestureRecognizerWithTarget:self action:@selector(schollFieldTap:)];
//
////    [self.view cancelAllResponder];
//
////    [self.view addTapGestureRecognizerWithTarget:self action:@selector(bgViewTap:)];
//    //地址选择初始化
//    areaIndex = 0;
//    area_dataArray1 = [[NSMutableArray alloc]init];
//    area_dataArray2 = [[NSMutableArray alloc]init];
//    area_dataArray3 = [[NSMutableArray alloc]init];
//
////    areaLabel = [[UILabel alloc]initWithFrame:self.view.bounds];
////    areaLabel.numberOfLines = 0;
////    areaLabel.textAlignment = NSTextAlignmentCenter;
////    [self.view addSubview:areaLabel];
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
