//
//  TFReadPhoto.m
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFReadPhoto.h"
#import <Photos/Photos.h>

@implementation TFReadPhoto

- (NSArray<TFImageDataModel *> *)readSystemPhoto{
    
    
     NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:0];
    
    //获取相册访问权限
    PHAuthorizationStatus photoStatus = [PHPhotoLibrary authorizationStatus];
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case PHAuthorizationStatusAuthorized: //已获取权限
                    //                        [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];    //创建监听者
                    //                        [self readPhotos];
                    
                    if([self.delegate respondsToSelector:@selector(readPhoto:status:)]){
                        [self.delegate readPhoto:self status:TFReadPhotoAuthorityStatusAuthorized];
                    }
                    
                    [self getImage];
                    break;
                    
                case PHAuthorizationStatusDenied: //用户已经明确否认了这一照片数据的应用程序访问
                    if([self.delegate respondsToSelector:@selector(readPhoto:status:)]){
                        [self.delegate readPhoto:self status:TFReadPhotoAuthorityStatusDenied];
                    }
                    
                    break;
                    
                case PHAuthorizationStatusNotDetermined:
                    
                    if([self.delegate respondsToSelector:@selector(readPhoto:status:)]){
                        [self.delegate readPhoto:self status:TFReadPhotoAuthorityStatusNotDetermined];
                    }
                    break;
                    
                case PHAuthorizationStatusRestricted://此应用程序没有被授权访问的照片数据。可能是家长控制权限
                    
                    if([self.delegate respondsToSelector:@selector(readPhoto:status:)]){
                        [self.delegate readPhoto:self status:TFReadPhotoAuthorityStatusRestricted];
                    }
                    
                    break;
                    
                default://其他。。。
                    break;
            }
        });
    }];
    
    
    
   
    
    return models;
}

- (void)getImage{
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    //    https://www.jianshu.com/p/00a1c8a6e3e0
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    
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
            
            TFImageDataModel *model = [[TFImageDataModel alloc]init];
            model.image = [UIImage imageWithData:UIImageJPEGRepresentation(result, 1)];;
            model.location = asset.location;
            model.creationDate = asset.creationDate;
            
            
            [models addObject:model];
            //            CellModel * model = [CellModel new];
            //            model.localIdentifier = asset.localIdentifier;
            //            model.image = [UIImage imageWithData:UIImageJPEGRepresentation(result, 0.5)];
            //
            //            [weakSelf.cellImageArray addObject:model];
//            NSLog(@"%@",asset.localIdentifier);
            dispatch_async(dispatch_get_main_queue(), ^{
                //                [weakSelf reloadData];
                
//                NSLog(@"ARRAY:%@",models);
                if([self.delegate respondsToSelector:@selector(getImages:)]){
                    [self.delegate getImages:models];
                }
            });
            
        }];
        
    }
}

@end
