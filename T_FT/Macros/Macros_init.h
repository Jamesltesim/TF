//
//  Macros_init.h
//  T_FT
//
//  Created by James on 2018/7/14.
//  Copyright © 2018年 James. All rights reserved.
//

//使用WeakSelf
#define WeakSelf(type) __weak __typeof__(type) weakSelf = type;
#define StrongSelf(type) __strong __typeof__(type) strongSelf = type;

//#define NSLog(FORMAT, ...) fprintf(stderr,"\n\n行号:%d 时间:%s 文件名:%s\t方法名:%s\n%s\n", __LINE__,__TIME__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__func__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\n\n时间:%s 行号:%d 文件名:%s\t方法名:%s\n 打印内容:%s\n\n", __TIME__,__LINE__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__func__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...) nil
#endif






