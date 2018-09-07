//
//  ShoppingCarCell.m
//  T_FT
//
//  Created by James on 2018/9/7.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingCarCell.h"

@interface ShoppingCarCell()

@property (nonatomic,strong) NSMutableArray *slideFoods;
@property (weak, nonatomic) IBOutlet UIImageView *subImage;
@property (weak, nonatomic) IBOutlet UIImageView *addImage;

@end

@implementation ShoppingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTap:)];
    [self.subImage addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTap:)];
    [self.addImage addGestureRecognizer:tap1];
    
   
    
}

- (void)imageTap:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)tap.view;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSMutableArray *)slideFoods{
    if(!_slideFoods){
        _slideFoods = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _slideFoods;
}

- (void)addSlideFood:(NSDictionary *)dict{
    
    UIView *slideFoodView = nil;
    if (self.slideFoods.count == 0){
        slideFoodView = [[UIView alloc]initWithFrame:CGRectMake(20, 0, self.width, 40)];
        slideFoodView.backgroundColor = [UIColor yellowColor];
    }else{
        NSInteger y = (self.slideFoods.count) *40;
        slideFoodView = [[UIView alloc]initWithFrame:CGRectMake(20, y, self.width, 40)];
        slideFoodView.backgroundColor = [UIColor purpleColor];
    }
    [self.bottomView addSubview:slideFoodView];
    [self.slideFoods addObject:dict];
}

- (void)addSlideFoods:(NSArray<NSArray<SlideFoodModel *> *> *)array{
    
    
    CGFloat cell_height = 40;
    CGFloat left_width = 100;
    
    UIView *previousView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 0)];
    for (int i=0;i<array.count;i++){
        NSArray *arr = array[i];
        UILabel *leftLab = [[UILabel alloc]initWithFrame:CGRectMake(0, previousView.bottom, left_width, cell_height*arr.count)];
        leftLab.backgroundColor = [UIColor yellowColor];
        leftLab.text = [NSString stringWithFormat:@"第%d份",i+1];
        leftLab.layer.borderWidth = 1;
        leftLab.textAlignment = NSTextAlignmentCenter;
        leftLab.layer.borderColor = [UIColor grayColor].CGColor;
        
       
        [self.bottomView addSubview:leftLab];
        
        
        for (int i=0;i<arr.count;i++){
            NSDictionary *dict = arr[i];
            
            NSInteger y = i *cell_height + previousView.bottom;
            UIView *slideFoodView = [[UIView alloc]initWithFrame:CGRectMake(left_width, y, self.width-left_width, cell_height)];
            slideFoodView.backgroundColor = [UIColor colorWithRed:(100+arc4random()%155)/255.0 green:(50+arc4random()%185)/255.0 blue:(10+arc4random()%235)/255.0 alpha:1];
            [self.bottomView addSubview:slideFoodView];
        }
         previousView = leftLab;
    }
    
    
}
@end
