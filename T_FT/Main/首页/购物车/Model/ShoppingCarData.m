//
//  ShoppingCarData.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingCarData.h"
#import "ShoppingCarModel.h"

#define GOODS_KEY   @"GOODS_KEY"
#define PRICE_KEY   @"PRICE_KEY"
#define SLIDE_KEY   @"SLIDE_KEY"

@interface ShoppingCarData()

//@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableDictionary *goodsDict;
@end

@implementation ShoppingCarData


+ (ShoppingCarModel *)findModelWithId:(NSNumber *)ID{
    ShoppingCarData *data = [self shareInstance];
    
    NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
    
    for (ShoppingCarModel *tmp in marr){
        if([tmp.goodId isEqualToNumber:ID]){
            return tmp;
        }
    }
    
    return nil;
}

#pragma mark - 公开方法

+ (NSInteger)countOfGood:(GoodModel *)model{
    ShoppingCarData *data = [self shareInstance];
    NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
    
    for(ShoppingCarModel *good in marr){
        if([good.goodId isEqualToNumber:model.goodId]){
            return good.count;
        }
    }
    
    return 0;
}

+ (BOOL)existGood:(GoodModel *)model{
    ShoppingCarData *data = [self shareInstance];
    NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
    
    for(ShoppingCarModel *good in marr){
        if([good.goodId isEqualToNumber:model.goodId]){
            return YES;
        }
    }
    
    return NO;
}
+ (void)showOrder{
    ShoppingCarData *data = [self shareInstance];
    NSLog(@"当前购物车中的数据：%@",data.goodsDict);
}

+ (CGFloat)getTotalPrices{
    ShoppingCarData *data = [self shareInstance];
   NSNumber *price = [data.goodsDict objectForKey:PRICE_KEY];
    return [price floatValue];
}

+ (NSInteger)getCount{
    ShoppingCarData *data = [self shareInstance];
    NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
    
    
    NSInteger count = 0;
    
    for(ShoppingCarModel *model in marr){
        count += model.count;
    }
    return count;
}

+ (void)addGood:(GoodModel *)model{
    ShoppingCarModel *good = [self findModelWithId:model.goodId];
    ShoppingCarData *data = [self shareInstance];
    CGFloat price = [[data.goodsDict objectForKey:PRICE_KEY] floatValue];
   
    NSNumber *priceNumber = nil;
    //当前购物车中已经有该商品
    if(good){
        good.count ++;
        
        price +=  good.price;
        priceNumber = [NSNumber numberWithFloat:price];
    }else{
       //当前购物车中没有该商品
      
         NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
        [marr addObject:[ShoppingCarModel initWithGoodModel:model]];
        price +=  model.price;
         priceNumber = [NSNumber numberWithFloat:price];
    }
    
    [data.goodsDict setObject:priceNumber forKey:PRICE_KEY];
}

//add slideFood
+ (void)addGood:(GoodModel *)model slideFood:(SlideFoodModel *)slideFood{
    ShoppingCarModel *good = [self findModelWithId:model.goodId];
    ShoppingCarData *data = [self shareInstance];
    CGFloat price = [[data.goodsDict objectForKey:PRICE_KEY] floatValue];
    
    NSNumber *priceNumber = nil;
    //当前购物车中已经有该商品
    if(good){
        good.count ++;
        
        //slideFood
        [good.slideFood addObject:slideFood];
         price += slideFood.price;
    }else{
        //当前购物车中没有该商品
        
//        NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
//         ShoppingCarModel *carModel = [ShoppingCarModel initWithGoodModel:model];
//        [carModel.slideFood addObject:slideFood];
//        [marr addObject:carModel];
//        price +=  model.price;
//        price += slideFood.price;
//        priceNumber = [NSNumber numberWithFloat:price];
        
        
    }
 
    [data.goodsDict setObject:[NSNumber numberWithFloat:price] forKey:PRICE_KEY];
}

//还没有测试
+ (void)subGood:(GoodModel *)model{
     ShoppingCarModel *good = [self findModelWithId:model.goodId];
    
    if(good){
         ShoppingCarData *data = [self shareInstance];
        
//        减去金额
        CGFloat price = [[data.goodsDict objectForKey:PRICE_KEY] floatValue];
        price -= good.price;
        
        if(good.slideFood.count > 0){
            for (SlideFoodModel *slide in good.slideFood){
                price -= slide.price;
            }
        }
        
        NSNumber *priceNumber = [NSNumber numberWithFloat:price];
        
        [data.goodsDict setObject:priceNumber forKey:PRICE_KEY];
        
//        删掉 商品
        NSMutableArray *marr = [data.goodsDict objectForKey:GOODS_KEY];
         [marr removeObject:good];
        
    }else{
        //出现错误
        return;
    }
}

//目前仅仅支持 删除slideGood
//不支持删除model
+ (void)subGood:(GoodModel *)model slideFood:(SlideFoodModel *)slideFood{
    ShoppingCarModel *good = [self findModelWithId:model.goodId];
    
    if(good){
      
        ShoppingCarData *data = [self shareInstance];
        CGFloat price = [[data.goodsDict objectForKey:PRICE_KEY] floatValue];
        NSNumber *priceNumber = [NSNumber numberWithFloat:price-slideFood.price];
        [data.goodsDict setObject:priceNumber forKey:PRICE_KEY];
        
          [good.slideFood removeObject:slideFood];
    }else{
        //出现错误
        return;
    }
}
#pragma mark - get set

- (NSMutableDictionary *)goodsDict{
    if(!_goodsDict){
        
        _goodsDict = [[NSMutableDictionary alloc]initWithCapacity:0];
        [_goodsDict setObject:[[NSMutableArray alloc]initWithCapacity:0] forKey:GOODS_KEY];
        [_goodsDict setObject:@(0) forKey:PRICE_KEY];
    }
    return _goodsDict;
}
//- (NSMutableArray *)dataArray{
//    if(!_dataArray){
//        _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
//    }
//    return _dataArray;
//}

#pragma mark - life cycle

// 创建静态对象 防止外部访问
static ShoppingCarData *_instance;
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
