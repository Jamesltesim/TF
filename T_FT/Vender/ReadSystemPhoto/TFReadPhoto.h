//
//  TFReadPhoto.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFImageDataModel.h"
#import "TFReadPhotoDelegate.h"




//    https://www.jianshu.com/p/3bbc69132ba0



@interface TFReadPhoto : NSObject

@property (nonatomic,weak) id <TFReadPhotoDelegate> delegate;

- (NSArray <TFImageDataModel *> *)readSystemPhoto;

@end
