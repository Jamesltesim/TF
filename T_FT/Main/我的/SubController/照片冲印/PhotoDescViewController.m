//
//  PhotoDescViewController.m
//  T_FT
//
//  Created by James on 2018/6/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "PhotoDescViewController.h"
#import "SDCycleScrollView.h"
#import <Photos/Photos.h>

@interface PhotoDescViewController ()<PHPhotoLibraryChangeObserver>

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
    selectPhoto.frame = CGRectMake(20, self.view.height-40, self.view.width-40, 40);
    [selectPhoto addTarget:self action:@selector(selectedPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [selectPhoto setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:selectPhoto];
    
    
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];    //创建监听者
   // [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];    //移除监听者
}

- (void)selectedPhoto:(UIButton *)sender {
    
//    https://www.jianshu.com/p/3bbc69132ba0
    
    //获取相册访问权限
    PHAuthorizationStatus photoStatus = [PHPhotoLibrary authorizationStatus];
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case PHAuthorizationStatusAuthorized: //已获取权限
                    
                    [self readPhotos];
                    break;
                    
                case PHAuthorizationStatusDenied: //用户已经明确否认了这一照片数据的应用程序访问
                    break;
                    
                case PHAuthorizationStatusRestricted://此应用程序没有被授权访问的照片数据。可能是家长控制权限
                    break;
                    
                default://其他。。。
                    break;
            }
        });
    }];
    

    

}

- (void)readPhotos{
    
//    https://www.jianshu.com/p/00a1c8a6e3e0
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    
    //获取相机胶卷所有图片
    PHFetchResult *assets = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    
    PHImageRequestOptions *option = [[PHImageRequestOptions alloc] init];
    
    //设置显示模式
    /*
     PHImageRequestOptionsResizeModeNone    //选了这个就不会管传如的size了 ，要自己控制图片的大小，建议还是选Fast
     PHImageRequestOptionsResizeModeFast    //根据传入的size，迅速加载大小相匹配(略大于或略小于)的图像
     PHImageRequestOptionsResizeModeExact    //精确的加载与传入size相匹配的图像
     */
    option.resizeMode = PHImageRequestOptionsResizeModeFast;
    option.synchronous = NO;
    option.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    typeof(self)weakSelf = self;
    for (PHAsset *asset in assets) {
        
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(screenSize.width*scale, screenSize.height*scale) contentMode:PHImageContentModeAspectFit options:option resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            //我这里用个模型接储存了图片的 localIdentifier 和图片本身
            //还有很多信息，根据自己的需求来取
//            CellModel * model = [CellModel new];
//            model.localIdentifier = asset.localIdentifier;
//            model.image = [UIImage imageWithData:UIImageJPEGRepresentation(result, 0.5)];
//
//            [weakSelf.cellImageArray addObject:model];
            NSLog(@"%@",asset.localIdentifier);
            dispatch_async(dispatch_get_main_queue(), ^{
//                [weakSelf reloadData];
            });
            
        }];
        
    }
    
    
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
