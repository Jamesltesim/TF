//
//  TFReadPhotoDelegate.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFReadPhoto.h"

typedef NS_ENUM(NSInteger, TFReadPhotoAuthorityStatus) {
    TFReadPhotoAuthorityStatusNotDetermined = 0,          // regular table view
    TFReadPhotoAuthorityStatusRestricted,       // preferences style table view
    TFReadPhotoAuthorityStatusDenied,
    TFReadPhotoAuthorityStatusAuthorized
};

@protocol TFReadPhotoDelegate <NSObject>

//PHAuthorizationStatusNotDetermined = 0, // User has not yet made a choice with regards to this application
//PHAuthorizationStatusRestricted,        // This application is not authorized to access photo data.
//// The user cannot change this application’s status, possibly due to active restrictions
////   such as parental controls being in place.
//PHAuthorizationStatusDenied,            // User has explicitly denied this application access to photos data.
//PHAuthorizationStatusAuthorized

- (void)readPhoto:(id)readPhoto status:(TFReadPhotoAuthorityStatus)authorityStatus;

- (void)getImages:(NSArray <TFImageDataModel *>*)images;


@end
