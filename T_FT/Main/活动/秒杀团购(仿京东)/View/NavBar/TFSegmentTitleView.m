//
//  TFSegmentTitleView.m
//  T_FT
//
//  Created by James on 2018/7/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFSegmentTitleView.h"
#import "TFCloseBothLabel.h"





@interface TFSegmentTitleView()

@property (nonatomic,strong) TFCloseBothLabel *selectedLabel;
@property (nonatomic,strong) NSMutableArray *closeLabelArray;
@end

@implementation TFSegmentTitleView




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
//        self.normalTitleFont = [UIFont getFontSizeWithType:TGFontTypeSix size:19.5];
//        self.selectedTitleFont = [UIFont getFontSizeWithType:TGFontTypeSix size:21.5];
//        self.normalHintFont = [UIFont getFontSizeWithType:TGFontTypeSix size:12.5];
//        self.selectedHintFont = [UIFont getFontSizeWithType:TGFontTypeSix size:15.5];
//        self.normalColor =  [UIColor colorWithRed:237/255.0 green:159/255.0 blue:169/255.0 alpha:1];
//        self.selectColor = [UIColor whiteColor];
        
       
    }
    return self;
}

- (void)loadTitles:(NSArray<NSString *> *)titles{
    int flog = 0;
    for(NSString *title in titles){
        
        CGFloat width = self.width/titles.count;
        TFCloseBothLabel *lab = [[TFCloseBothLabel alloc] initWithFrame:CGRectMake(width*flog, 0, width, self.height)];
        lab.title = title;
        lab.hint = @"开始";
        lab.tag = flog;
        lab.userInteractionEnabled = YES;
        [self closeLabelNormal:lab];
        lab.backgroundColor = [UIColor clearColor];
        [self addSubview:lab];
        
        [self.closeLabelArray addObject:lab];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(segmentTap:)];
        [lab addGestureRecognizer:tap];
        
        if(flog++ == 0){
            self.selectedLabel = lab;
            [self closeLabelSelected:self.selectedLabel];
        }
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    [self closeLabelNormal:self.selectedLabel];
    
    TFCloseBothLabel *lab = self.closeLabelArray[selectIndex];
    
     [self closeLabelSelected:lab];
     self.selectedLabel = lab;
}

- (void)closeLabelSelected:(TFCloseBothLabel *)label{
    label.titleFont = [UIFont getFontSizeWithType:TGFontTypeSix size:19.5];
    label.hintFont = [UIFont systemFontOfSize:12.5];;
    label.titleColor = [UIColor whiteColor];
    label.hintColor = [UIColor whiteColor];
}

- (void)closeLabelNormal:(TFCloseBothLabel *)label{
    label.titleFont = [UIFont getFontSizeWithType:TGFontTypeSix size:17.5];
    label.hintFont = [UIFont systemFontOfSize:12.5];
    label.titleColor = [UIColor colorWithRed:237/255.0 green:159/255.0 blue:169/255.0 alpha:1];
    label.hintColor = [UIColor colorWithRed:237/255.0 green:159/255.0 blue:169/255.0 alpha:1];
}

- (void)segmentTap:(UITapGestureRecognizer *)tap {
    TFCloseBothLabel *lab = (TFCloseBothLabel *)tap.view;
    
    [self closeLabelNormal:self.selectedLabel];
    [self closeLabelSelected:lab];
   
    
    if([self.delegate respondsToSelector:@selector(TFSegmentTitleView:startIndex:endIndex:)]){
        [self.delegate TFSegmentTitleView:self startIndex:self.selectedLabel.tag endIndex:lab.tag];
    }
    
     self.selectedLabel = lab;
}


- (NSMutableArray *)closeLabelArray{
    
    if(!_closeLabelArray){
        _closeLabelArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return _closeLabelArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
