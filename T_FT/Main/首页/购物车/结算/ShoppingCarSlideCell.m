//
//  ShoppingCarSlideCell.m
//  T_FT
//
//  Created by James on 2018/9/11.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingCarSlideCell.h"
#import "SlideFoodModel.h"

@implementation ShoppingCarSlideCell

- (instancetype)initWithFrame:(CGRect)frame WithDataArray:(NSArray *)array index:(NSInteger)index{
    if (self = [super initWithFrame:frame]){
        
        CGFloat cell_height = 40;
        CGFloat left_width = 100;
        
        
        NSArray *arr = array;
        UILabel *leftLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, left_width, frame.size.height)];
                leftLab.backgroundColor = [UIColor yellowColor];
        leftLab.text = [NSString stringWithFormat:@"第%ld份",index];
        leftLab.layer.borderWidth = 1;
        leftLab.textAlignment = NSTextAlignmentCenter;
        leftLab.layer.borderColor = [UIColor grayColor].CGColor;
        
        
       
         [self addSubview:leftLab];
        
        for (int i=0;i<arr.count;i++){
            SlideFoodModel *model = arr[i];
            NSInteger y = i *cell_height;
            [self addSubcellWithFrame:CGRectMake(100, y, frame.size.width-(leftLab.right), cell_height) name:model.title price:[NSString stringWithFormat:@"%.2lf",model.price]];
        }
        
        
    }
    return self;
}

- (void)addSubcellWithFrame:(CGRect)frame name:(NSString *)name price:(NSString *)price{
    
    NSLog(@"%lf",self.width);
    NSLog(@"%@",NSStringFromCGRect(frame));
    UIView *slideFoodView = [[UIView alloc] initWithFrame:frame];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, slideFoodView.width-80, slideFoodView.height)];
    nameLab.text = name;
    nameLab.backgroundColor = [UIColor purpleColor];
    nameLab.textAlignment = NSTextAlignmentLeft;
    [slideFoodView addSubview:nameLab];

    UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake(nameLab.right, 0, 80, slideFoodView.height)];
    priceLab.text = price;
    priceLab.textColor = THEME_FONT_COLOR_GRAY;
    priceLab.backgroundColor = [UIColor redColor];
    priceLab.textAlignment = NSTextAlignmentRight;
    [slideFoodView addSubview:priceLab];
    
    slideFoodView.backgroundColor = [UIColor colorWithRed:(100+arc4random()%155)/255.0 green:(50+arc4random()%185)/255.0 blue:(10+arc4random()%235)/255.0 alpha:1];
    [self addSubview:slideFoodView];
}

@end
