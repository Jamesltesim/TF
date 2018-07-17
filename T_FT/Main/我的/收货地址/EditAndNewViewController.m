//
//  EditAndNewViewController.m
//  T_FT
//
//  Created by James on 2018/7/17.
//  Copyright © 2018年 James. All rights reserved.
//

#import "EditAndNewViewController.h"

#import "AreaView.h"
#import "AddressModel.h"
#import "AddressAreaModel.h"

@interface EditAndNewViewController()<AreaSelectDelegate,UITextFieldDelegate>{
    
    AreaView *areaView;
    NSInteger areaIndex;
    NSMutableArray *area_dataArray1;
    NSMutableArray *area_dataArray2;
    NSMutableArray *area_dataArray3;
}


@end
@implementation EditAndNewViewController

- (UITextField *)createFieldWithTop:(CGFloat)top labText:(NSString *)text{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, top, 80, 50)];
    lab.text = text;
    lab.font = [UIFont fontWithName:@"Heiti TC" size:15];
    lab.textColor = FONT_COLOR_BLACK;
    [self.view addSubview:lab];
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(lab.right, top, self.view.width-lab.right-5, lab.height)];
    field.placeholder = @"input";
    field.font = [UIFont fontWithName:@"Gill Sans" size:14.5];
    
    //    textfield输入的时候 右侧显示删除按钮
    field.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:field];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(3, lab.bottom, self.view.width-6, 0.5)];
    line.backgroundColor = RGBA(231,231,231,1);
    [self.view addSubview:line];
    return field;
}

- (UITextView *)createTextViewWithTop:(CGFloat)top labText:(NSString *)text{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, top, 80, 34)];
    lab.text = text;
    lab.font = [UIFont fontWithName:@"Heiti TC" size:15];
    lab.textColor = FONT_COLOR_BLACK;
    [self.view addSubview:lab];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(lab.right, top+1, self.view.width-lab.right, 100)];
    [self.view addSubview:textView];
    textView.font = [UIFont fontWithName:@"Marker Felt" size:15];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(3, textView.bottom, self.view.width-6, 0.5)];
    line.backgroundColor = RGBA(231,231,231,1);
    [self.view addSubview:line];
    return textView;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if(textField == self.schoolField) return NO;
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField = [self createFieldWithTop:self.navView.bottom+15 labText:@"收货人:"];
    self.phoneField = [self createFieldWithTop:self.nameField.bottom labText:@"手机号:"];
    self.schoolField = [self createFieldWithTop:self.phoneField.bottom labText:@"所在区域:"];
    self.addressTextView = [self createTextViewWithTop:self.schoolField.bottom labText:@"详细地址:"];
    
    
    self.schoolField.delegate = self;
    [self.schoolField addTapGestureRecognizerWithTarget:self action:@selector(schollFieldTap:)];
    
    //    [self.view cancelAllResponder];
    
    //    [self.view addTapGestureRecognizerWithTarget:self action:@selector(bgViewTap:)];
    //地址选择初始化
    areaIndex = 0;
    area_dataArray1 = [[NSMutableArray alloc]init];
    area_dataArray2 = [[NSMutableArray alloc]init];
    area_dataArray3 = [[NSMutableArray alloc]init];
    
    //    areaLabel = [[UILabel alloc]initWithFrame:self.view.bounds];
    //    areaLabel.numberOfLines = 0;
    //    areaLabel.textAlignment = NSTextAlignmentCenter;
    //    [self.view addSubview:areaLabel];
}


- (void)schollFieldTap:(UITapGestureRecognizer *)tap {
    [self requestAllAreaNameWithAreaID:nil];
}

#pragma mark - AreaSelectDelegate
- (void)selectIndex:(NSInteger)index selectID:(NSString *)areaID
{
    areaIndex = index;
    switch (areaIndex) {
        case 1:
            [area_dataArray2 removeAllObjects];
            break;
        case 2:
            [area_dataArray3 removeAllObjects];
            break;
        default:
            break;
    }
    [self requestAllAreaNameWithAreaID:areaID];
}
- (void)getSelectAddressInfor:(NSString *)addressInfor
{
    self.schoolField.text = addressInfor;
    
}



#pragma mark - requestAllAreaName
- (void)requestAllAreaNameWithAreaID:(NSString *)areaID{
    if (!areaView) {
        areaView = [[AreaView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 667)];
        areaView.hidden = YES;
        areaView.address_delegate = self;
        [self.view addSubview:areaView];
    }
    //    self.view.transform =CGAffineTransformMakeScale(0.95, 0.95);
    NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"TF_Address_%ld",areaIndex + 1] ofType:@"plist"];
    NSMutableDictionary *plistDic=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    for (NSDictionary *sh_dic in plistDic[@"data"][@"sh_items"]) {
        AddressAreaModel *addressAreaModel = [[AddressAreaModel alloc]init];
        [addressAreaModel setValuesForKeysWithDictionary:sh_dic];
        switch (areaIndex) {
            case 0:
                [area_dataArray1 addObject:addressAreaModel];
                break;
            case 1:{
                if([addressAreaModel.sh_id isEqualToString:areaID]){
                    [area_dataArray2 addObject:addressAreaModel];
                }
                
                break;
            }
                
            case 2:{
                if([addressAreaModel.sh_id isEqualToString:areaID]){
                    [area_dataArray3 addObject:addressAreaModel];
                }
            }
                
                break;
            default:
                break;
        }
    }
    switch (areaIndex) {
        case 0:
        {
            [areaView showAreaView];
            [areaView setProvinceArray:area_dataArray1];
        }
            break;
        case 1:
            [areaView setCityArray:area_dataArray2];
            break;
        case 2:
            [areaView setRegionsArray:area_dataArray3];
            break;
        default:
            break;
    }
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    if (!areaView) {
//        [self requestAllAreaNameWithAreaID:nil];
//    }
//    else
//        [areaView showAreaView];
//
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
