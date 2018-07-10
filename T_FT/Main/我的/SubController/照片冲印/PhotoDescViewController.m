//
//  PhotoDescViewController.m
//  T_FT
//
//  Created by James on 2018/6/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "PhotoDescViewController.h"
#import "SDCycleScrollView.h"

#import "TFReadPhoto.h"
#import "ShowImageViewController.h"

@interface PhotoDescViewController ()<PHPhotoLibraryChangeObserver,TFReadPhotoDelegate>


@end

@implementation PhotoDescViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //展示图片
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, self.navView.bottom, self.view.width, (self.view.height - self.navView.bottom)/10*6.5) imageNamesGroup:@[@"timg-2.jpeg",@"timg-2.jpeg",@"timg-2.jpeg"]];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.autoScrollTimeInterval = 6;
    [self.view addSubview:cycleScrollView];
    
    
    //尺寸
    UILabel *sizeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, cycleScrollView.bottom, cycleScrollView.width, 20)];
    sizeLabel.backgroundColor = [UIColor greenColor];
    sizeLabel.text = self.sizeString;
    sizeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:sizeLabel];
    //内容
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, sizeLabel.bottom, cycleScrollView.width, 20)];
    contentLabel.backgroundColor = [UIColor whiteColor];
    contentLabel.text = self.contentString;
    contentLabel.textColor = [UIColor greenColor];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:contentLabel];
    
    //价格
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, contentLabel.bottom, cycleScrollView.width, 20)];
    priceLabel.backgroundColor = [UIColor whiteColor];
    priceLabel.textColor = [UIColor greenColor];
    priceLabel.text = self.priceString;
    priceLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:priceLabel];
    
    //选择照片按钮
    UIButton *selectPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectPhoto setTitle:@"选择照片" forState:UIControlStateNormal];
    selectPhoto.frame = CGRectMake(20, self.view.height-40 - HOME_INDICATOR_HEIGHT, self.view.width-40, 40);
    [selectPhoto addTarget:self action:@selector(selectedPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [selectPhoto setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:selectPhoto];
 
   // [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];    //移除监听者
}

- (void)selectedPhoto:(UIButton *)sender {

    ShowImageViewController *controller = [[ShowImageViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)readPhoto:(id)readPhoto status:(TFReadPhotoAuthorityStatus)authorityStatus{
    NSLog(@"TFReadPhotoAuthorityStatus: %ld",authorityStatus);
}

//相册变化回调
- (void)photoLibraryDidChange:(PHChange *)changeInstance
{
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        //修改UI
    });
    
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
