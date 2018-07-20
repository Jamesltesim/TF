//
//  TFAPIRandom.m
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPIRandom.h"

@implementation TFAPIRandom

//生成 人民币 金额
+ (CGFloat)randomRMB{
    //    iOS随机生成浮点数小数
    int x = (arc4random() % 1000) + 10;
    int y = (arc4random() % 10) ;
    int z = (arc4random() % 10) ;
    NSString *str=[NSString stringWithFormat:@"%d.%d%d",x,y,z];
    CGFloat f =[str floatValue];
    
    return f;
}

//生成指定长度的中文字符串
+ (NSMutableString*)randomCreatChinese:(NSInteger)count{
    
    NSMutableString*randomChineseString =@"".mutableCopy;
    
    for(NSInteger i =0; i < count; i++){
        
        NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        
        //随机生成汉字高位
        
        NSInteger randomH =0xA1+arc4random()%(0xFE - 0xA1+1);
        
        //随机生成汉子低位
        
        NSInteger randomL =0xB0+arc4random()%(0xF7 - 0xB0+1);
        
        //组合生成随机汉字
        
        NSInteger number = (randomH<<8)+randomL;
        
        NSData *data = [NSData dataWithBytes:&number length:2];
        
        NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
        
        [randomChineseString appendString:string];
        
    }
    
    return randomChineseString;
    
}
//生成指定长度的英文字符串
+(NSString *)randomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
}

@end
