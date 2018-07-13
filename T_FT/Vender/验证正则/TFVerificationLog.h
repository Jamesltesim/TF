//
//  TFLoginLog.h
//  T_FT
//
//  Created by James on 2018/7/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,TFVerificationLogCode){
    TFLoginLogCodeForCorrect = 1001,
    TFLoginLogCodeForUsernameIsBlank ,
    TFLoginLogCodeForPasswordIsBlank,
    TFAPIRequestNameForHomeList1
    
};


@interface TFVerificationLog : NSObject

@property (nonatomic) NSInteger code;
@property (nonatomic,strong) NSString *msg;
@end
