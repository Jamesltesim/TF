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
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, self.navView.bottom, self.view.width, (self.view.height - self.navView.bottom)/10*6.5) imageNamesGroup:@[@"timg-2.jpeg",@"timg-2.jpeg",@"timg-2.jpeg"]];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.autoScrollTimeInterval = 6;
    [self.view addSubview:cycleScrollView];
    
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
