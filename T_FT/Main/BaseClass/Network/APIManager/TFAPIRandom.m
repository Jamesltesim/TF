//
//  TFAPIRandom.m
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPIRandom.h"

@interface TFAPIRandom()

@property (nonatomic) NSInteger autoIncrementID;
@end

@implementation TFAPIRandom

//生成 人民币 金额
+ (CGFloat)randomRMB{
    //    iOS随机生成浮点数小数
    int x = (arc4random() % 100) + 1;
    int y = (arc4random() % 10) ;
    int z = (arc4random() % 10) ;
    NSString *str=[NSString stringWithFormat:@"%d.%d%d",x,y,z];
    CGFloat f =[str floatValue];
    
    return f;
}

+ (CGFloat)randomRMBTo:(int)to{
    return [self randomRMBFrom:0 to:to];
}
+ (CGFloat)randomRMBFrom:(int)from to:(int)to{
    //    iOS随机生成浮点数小数
    int x = (arc4random() % (to-from)) + from;
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


+ (NSInteger)autoIncrementID{
    
    TFAPIRandom *random = [self shareInstance];
    return random.autoIncrementID++;
}



#pragma mark - life cycle

// 创建静态对象 防止外部访问
static TFAPIRandom *_instance;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    //    @synchronized (self) {
    //        // 为了防止多线程同时访问对象，造成多次分配内存空间，所以要加上线程锁
    //        if (_instance == nil) {
    //            _instance = [super allocWithZone:zone];
    //        }
    //        return _instance;
    //    }
    // 也可以使用一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareInstance
{
    //return _instance;
    // 最好用self 用Tools他的子类调用时会出现错误
    return [[self alloc]init];
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

@end
