//
//  DeliveryPickView.m
//  自定义选择器
//
//  Created by James on 2018/7/19.
//  Copyright © 2018年 WOSHIPM. All rights reserved.
//

#import "DeliveryPickView.h"

@interface DeliveryPickView()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong) NSArray *twoComponentArray;

@end
@implementation DeliveryPickView

- (void)initPickView
{
    [super initPickView];
 
     NSArray *array =[TFUtils getThreeDaysFromToday];
    NSMutableArray *firstArr = [[NSMutableArray alloc] initWithCapacity:0];
    for(NSDictionary *dict in array){
        [firstArr addObject:[NSString stringWithFormat:@"%@ \n%@. %@",dict[@"week"],dict[@"month"],dict[@"day"]]];
    }
    
//    NSLog(@"%@",[TFUtils get_today_Interval_withOpenTime:@"8:00" closeTime:@"20:00" deliveryTime:0]);
    
    
    self.dataArray = @[firstArr,[TFUtils get_today_Interval_withOpenTime:@"8:00" closeTime:@"20:00" deliveryTime:0]];
    self.twoComponentArray = self.dataArray[1][0];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    
   
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.dataArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    NSArray *array = self.dataArray[component];
    if(component == 1){
        return self.twoComponentArray.count;
    }else{
        NSArray *array = self.dataArray[component];
        return array.count;
    }
    
    return 0;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 56;
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//
//    return self.frame.size.width;
//
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0){
        self.twoComponentArray = self.dataArray[1][row];
        [pickerView reloadComponent:1];
    }
//    self.selectedTitle = self.dataArray[row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    //设置picker上面 选中上下两条线
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor =THEME_BACKGROUND_VIEW_GRAY;
        }
    }
    
    
    
    
    UILabel *label = [[UILabel alloc]init];
     label.textAlignment = NSTextAlignmentCenter;
     label.font = [UIFont boldSystemFontOfSize:15];
     label.textColor = THEME_COLOR_RED;
    if(component == 0){
        NSArray *array =self.dataArray[0];
        NSString *text = array[row];
       
        label.numberOfLines = 2;
       
       
        label.text = [NSString stringWithFormat:@"%@",text];
    }else{
       
        NSString *text = self.twoComponentArray[row];
        label.text = text;
    }
    
    
    return label;
    
    
}
#pragma mark -点击确定按钮
- (void)clickConfirmButton
{
    //    [self.delegate customPickView:self selectedTitle:self.selectedTitle];
    
    [super clickConfirmButton];
}


@end
