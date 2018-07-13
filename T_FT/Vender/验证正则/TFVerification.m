//
//  TFLoginVerification.m
//  T_FT
//
//  Created by James on 2018/7/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFVerification.h"

@implementation TFVerification

+ (TFVerificationLog *)verfication:(NSString *)userName passwd:(NSString *)password{

    TFVerificationLog *log = [[TFVerificationLog alloc]init];
    if(userName == nil || [userName isEqualToString:@""] || userName.length == 0){
        
        log.code = TFLoginLogCodeForUsernameIsBlank;
        log.msg = @"用户名不能为空";
        
    } else if (password == nil || [password isEqualToString:@""] || password.length == 0){
        log.code = TFLoginLogCodeForPasswordIsBlank;
        log.msg = @"密码不能为空";
    }else{
        log.code = TFLoginLogCodeForCorrect;
        log.msg = @"验证成功";
    }
    return log;
}


#pragma 正则匹配手机号


/**
 增加 4 号段  2018.7.13

 @param telNumber telNumber description
 @return return value description
 */
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    NSString *pattern = @"^1+[34578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}


#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName
{
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}


#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

#pragma 正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber : (NSString *) number
{
    NSString *pattern = @"^[0-9]{12}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
    
}

#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url
{
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
}


@end
