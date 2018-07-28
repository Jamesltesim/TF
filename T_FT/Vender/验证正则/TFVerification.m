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
+ (BOOL)checkUserIdCard: (NSString *) value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    　  　 NSInteger length =0;
    　  　 if (!value) {
        　  　 return NO;
        　  　 }else {
            　  　 length = value.length;
            　  　 //不满足15位和18位，即身份证错误
            　  　 if (length !=15 && length !=18) {
                　  　 return NO;
                　  　 }
            　  　 }
    　  　 // 省份代码
    　  　 NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    　  　 
    　  　 // 检测省份身份行政区代码
    　  　 NSString *valueStart2 = [value substringToIndex:2];
    　  　 BOOL areaFlag =NO; //标识省份代码是否正确
    　  　 for (NSString *areaCode in areasArray) {
        　  　 if ([areaCode isEqualToString:valueStart2]) {
            　  　 areaFlag =YES;
            　  　 break;
            　  　 }
        　  　 }
    　  　 
    　  　 if (!areaFlag) {
        　  　 return NO;
        　  　 }
    　  　 
    　  　 NSRegularExpression *regularExpression;
    　  　 NSUInteger numberofMatch;
    　  　 
    　  　 int year =0;
    　  　 //分为15位、18位身份证进行校验
    　  　 switch (length) {
            　  　 case 15:
            　  　 //获取年份对应的数字
            　  　 year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            　  　 
            　  　 if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                　  　 //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                　  　 regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                          　  　 options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                　  　 }else {
                    　  　 regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                              　  　 options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                    　  　 }
            　  　 //使用正则表达式匹配字符串 NSMatchingReportProgress:找到最长的匹配字符串后调用block回调
            　  　 numberofMatch = [regularExpression numberOfMatchesInString:value
                                  　  　 options:NSMatchingReportProgress
                                  　  　 range:NSMakeRange(0, value.length)];
            　  　 
            　  　 if(numberofMatch >0) {
                　  　 return YES;
                　  　 }else {
                    　  　 return NO;
                    　  　 }
            　  　 case 18:
            　  　 year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            　  　 if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                　  　 regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                　  　 }else {
                    　  　 regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                    　  　 }
            　  　 numberofMatch = [regularExpression numberOfMatchesInString:value
                                  　  　 options:NSMatchingReportProgress
                                  　  　 range:NSMakeRange(0, value.length)];
            　  　 
            　  　 
            　  　 if(numberofMatch >0) {
                　  　 //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
                　  　 
                　  　 int S = [value substringWithRange:NSMakeRange(0,1)].intValue*7 + [value substringWithRange:NSMakeRange(10,1)].intValue *7 + [value substringWithRange:NSMakeRange(1,1)].intValue*9 + [value substringWithRange:NSMakeRange(11,1)].intValue *9 + [value substringWithRange:NSMakeRange(2,1)].intValue*10 + [value substringWithRange:NSMakeRange(12,1)].intValue *10 + [value substringWithRange:NSMakeRange(3,1)].intValue*5 + [value substringWithRange:NSMakeRange(13,1)].intValue *5 + [value substringWithRange:NSMakeRange(4,1)].intValue*8 + [value substringWithRange:NSMakeRange(14,1)].intValue *8 + [value substringWithRange:NSMakeRange(5,1)].intValue*4 + [value substringWithRange:NSMakeRange(15,1)].intValue *4 + [value substringWithRange:NSMakeRange(6,1)].intValue*2 + [value substringWithRange:NSMakeRange(16,1)].intValue *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                　  　 
                　  　 //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字
                　  　 int Y = S %11;
                　  　 NSString *M =@"F";
                　  　 NSString *JYM =@"10X98765432";
                　  　 M = [JYM substringWithRange:NSMakeRange(Y,1)];// 3：获取校验位
                　  　 
                　  　 NSString *lastStr = [value substringWithRange:NSMakeRange(17,1)];
                　  　 
                　  　 NSLog(@"%@",M);
                　  　 NSLog(@"%@",[value substringWithRange:NSMakeRange(17,1)]);
                　  　 //4：检测ID的校验位
                　  　 if ([lastStr isEqualToString:@"x"]) {
                    　  　 if ([M isEqualToString:@"X"]) {
                        　  　 return YES;
                        　  　 }else{
                            　  　 
                            　  　 return NO;
                            　  　 }
                    　  　 }else{
                        　  　 
                        　  　 if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                            　  　 return YES;
                            　  　 }else {
                                　  　 return NO;
                                　  　 }
                        　  　 
                        　  　 }
                　  　 
                　  　 
                　  　 }else {
                    　  　 return NO;
                    　  　 }
            　  　 default:
            　  　 return NO;
        　  　 }
    

    
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


