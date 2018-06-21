//
//  TFImageDataModel.h
//  T_FT
//
//  Created by James on 2018/6/21.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
@interface TFImageDataModel : NSObject



@property (nonatomic,strong) UIImage *image;
// Playback style describes how the asset should be presented to the user (regardless of the backing media for that asset).  Use this value to choose the type of view and the appropriate APIs on the PHImageManager to display this asset
@property (nonatomic, assign, readonly) PHAssetPlaybackStyle playbackStyle PHOTOS_AVAILABLE_IOS_TVOS(11_0, 11_0);

@property (nonatomic, assign, readonly) PHAssetMediaType mediaType;
@property (nonatomic, assign, readonly) PHAssetMediaSubtype mediaSubtypes;

@property (nonatomic, assign, readonly) NSUInteger pixelWidth;
@property (nonatomic, assign, readonly) NSUInteger pixelHeight;

@property (nonatomic, strong, nullable) NSDate *creationDate;
@property (nonatomic, strong, nullable) NSDate *modificationDate;

@property (nonatomic, strong, nullable) CLLocation *location;

@property (nonatomic, assign, readonly) NSTimeInterval duration;

// a hidden asset will be excluded from moment collections, but may still be included in other smart or regular album collections
@property (nonatomic, assign, readonly, getter=isHidden) BOOL hidden;

@property (nonatomic, assign, readonly, getter=isFavorite) BOOL favorite;

@property (nonatomic, strong, readonly, nullable) NSString *burstIdentifier;
@property (nonatomic, assign, readonly) PHAssetBurstSelectionType burstSelectionTypes;
@property (nonatomic, assign, readonly) BOOL representsBurst;

@property (nonatomic, assign, readonly) PHAssetSourceType sourceType PHOTOS_AVAILABLE_IOS_TVOS(9_0, 10_0);


@end
