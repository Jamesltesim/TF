//
//  TFAPIForShoppingList.m
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFAPIForShoppingList.h"


@interface TFAPIForShoppingList()<TFBaseManagerDelegate>


@end

@implementation TFAPIForShoppingList

- (NSString *)apiMethodName{
    return @"shoppingList";
}

- (id)getLocalData{
    
//    什果西米捞
//    芒果西米捞
//    木瓜西米捞
//    西瓜西米捞
//    菠萝西米捞
//    苹果西米捞
//    芒果布丁鲜奶捞
    NSDictionary *dataDict = @{@"code":@"200",
                               @"data":@[ @{@"title":@"粽子+包子",@"data":[self ramdomArray]},
                                          @{@"title":@"海鲜大餐",@"data":[self ramdomArray]},
                                          @{@"title":@"酱油炒饭",@"data":[self ramdomArray]},
                                          @{@"title":@"超大杯柠檬",@"data":[self ramdomArray]},
                                          @{@"title":@"瞎扯淡",@"data":[self ramdomArray]},
                                          @{@"title":@"柠檬+耳朵+牛奶",@"data":[self ramdomArray]},
                                          @{@"title":@"牛奶+椰子+榴莲",@"data":[self ramdomArray]},
                                          @{@"title":@"粽子+包子",@"data":[self ramdomArray]}
                                          ]};
    return dataDict;
}


- (NSArray *)ramdomArray{
    NSMutableArray *marr = [[NSMutableArray alloc]initWithCapacity:0];
    
    for(int i=0;i<(arc4random() % 30+10);i++){
        [marr addObject:[self ramdomModelWithIndex:i]];
    }
    return marr.copy;
}

- (GoodModel *)ramdomModelWithIndex:(int)index{
    GoodModel *model9 = [[GoodModel alloc] init];
    model9.goodId = @([TFAPIRandom autoIncrementID]);
    model9.title = [TFAPIRandom randomCreatChinese:arc4random() % 20+2];
    model9.content = [TFAPIRandom randomCreatChinese:arc4random() % 50+20];
    model9.imgUrl = (arc4random()%2 == 0? @"www":@"");
    model9.price = [TFAPIRandom randomRMB];
    
    if(index == 0){
        model9.isHaveSlideFood = NO;
    }else{
         model9.isHaveSlideFood = YES;
    }
   
    SlideFoodModel *slide1 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
     SlideFoodModel *slide2 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
     SlideFoodModel *slide3 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
     SlideFoodModel *slide4 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
     SlideFoodModel *slide5 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
     SlideFoodModel *slide6 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
     SlideFoodModel *slide7 = [[SlideFoodModel alloc]initWithTitle:[TFAPIRandom randomCreatChinese:arc4random() % 5+2] price:[TFAPIRandom randomRMBTo:5]];
    
    model9.slideFood = @[slide1,slide2,slide3,slide4,slide5,slide6,slide7];
    
    return model9;
}



@end
