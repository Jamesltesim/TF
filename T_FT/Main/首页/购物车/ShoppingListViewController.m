//
//  ShoppingListViewController.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"
#import "ShowShoppingCarView.h"
#import "ShoppingCarData.h"
#import "UIView+LXShadowPath.h"
#import "DeliveryPickView.h"

#import "LTPersonalMainPageTestVC.h"
#import "TFAPIForShoppingList.h"
#import "SlideFoodViewController.h"

@interface ShoppingListViewController ()<ShoppingCarDelegate,TFShoppingListDelegate,TFAPICallBackProtocol>

@property (nonatomic,strong)ShowShoppingCarView *carView;

@property(nonatomic,strong) NSMutableArray *controllerDataArray;


@end

@implementation ShoppingListViewController


#pragma mark---  lefe cycle  ---

- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.hidesBottomBarWhenPushed = YES;
        }
        return self;
    }
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

//-(void)tapGesture:(UITapGestureRecognizer *)gesture {
//    DeliveryPickView *pickerView = [[DeliveryPickView alloc]init];
//    pickerView.titleLable.text = @"送餐时间";
//    [pickerView.confirmButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
//     [pickerView.cancelButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
//    [pickerView showOn:self.view];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navView.backImageAlpha = 1;
    [self.navView addTapGestureOnTitleWithTarget:self action:@selector(navViewTap:)];
    
    TFAPIForShoppingList *apiBanner = [[TFAPIForShoppingList alloc]init];
    apiBanner.delegate = self;
    [apiBanner loadData];

    if([ShoppingCarData getCount]){
        [self showCashierDesk];
    }
}

- (void)navViewTap:(UITapGestureRecognizer *)tap {
        DeliveryPickView *pickerView = [[DeliveryPickView alloc]init];
        pickerView.titleLable.text = @"送餐时间";
        [pickerView.confirmButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
         [pickerView.cancelButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
        [pickerView showOn:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---  get set  ---

- (ShowShoppingCarView *)carView{
    if(!_carView){
        _carView = [[ShowShoppingCarView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-50-HOME_INDICATOR_HEIGHT, SCREEN_WIDTH, 70)];
        _carView.delegate = self;
        [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.03 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
    }
    return _carView;
}

-(NSArray <UIViewController *> *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [self setupViewControllers];
    }
    return _viewControllers;
}


-(NSArray <UIViewController *> *)setupViewControllers {
    NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
    [self.controllerDataArray enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LTPersonalMainPageTestVC *testVC = [[LTPersonalMainPageTestVC alloc] init];
        testVC.dataArray = obj;
        testVC.titleIndex = idx;
        testVC.delegate = self;
        [testVCS addObject:testVC];
    }];
    return testVCS.copy;
}



#pragma mark ---  内部方法  ---
- (void)showCashierDesk{
    if(!self.carView.superview){
        [self.view addSubview:self.carView];

//
        for (LTPersonalMainPageTestVC *controller in self.viewControllers){
            [controller showCashierDeskWithHeight:self.carView.height];
        }
        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
        
    }
}

- (void)hidenCashierDesk{
    if(self.carView.superview){
        [self.carView removeFromSuperview];
        self.managerView.frame = RECT_NONAVBAR_AND_NOTABBAR;
        
        
        for (LTPersonalMainPageTestVC *controller in self.viewControllers){
            [controller hienCashierDesk];
        }

    }
    
}

- (void)glt_scrollViewDidScroll:(UIScrollView *)scrollView{
    [super glt_scrollViewDidScroll:scrollView];
    
    if(self.currentProgress > 0.5){
        self.navView.title = @"外送 45分钟";
    }
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}

#pragma mark ---  TFAPICallBackProtocol  ---
- (void)TFAPICallBackDidSuccess:(TFAPIBaseManager *)manager{
    NSDictionary *dataDict = manager.responseObject;
    NSArray *array = dataDict[@"data"];
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.controllerDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    for(NSDictionary *dict in array){
        [titleArray addObject:dict[@"title"]];
        [self.controllerDataArray addObject:dict[@"data"]];
    }
    
    self.titles = titleArray;
    
    [self.view addSubview:self.managerView];
    
      __weak typeof(self) weakSelf = self;
    //配置headerView
    [self.managerView configHeaderView:^UIView * _Nullable{
        [weakSelf.headerView addSubview:weakSelf.headerImageView];
        return weakSelf.headerView;
    }];
   
    //pageView点击事件
    [self.managerView didSelectIndexHandle:^(NSInteger index) {
        NSLog(@"点击了 -> %ld", index);
    }];
    
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
//    self.headerImageView.userInteractionEnabled = YES;
//    [self.headerImageView addGestureRecognizer:gesture];
     [self.view bringSubviewToFront:self.navView];
}

- (void)TFAPICallBackDidFailed:(TFAPIBaseManager *)manager{
    
}

#pragma mark ---  TFShoppingListDelegate  ---

- (void)TFShoppingListWithTableView:(UITableView *)tableView cell:(ShoppingTableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath data:(GoodModel *)data{
     [cell setGoodsCount:[ShoppingCarData countOfGood:data]];
    
}

- (void)TFShoppingListWithTableView:(UITableView *)tableView cell:(ShoppingTableViewCell *)cell didSelectRowAtIndexPath:(TFShoppingIndexPath *)indexPath data:(GoodModel *)data{
    NSLog(@"%@ : titleIndex:%ld rowIndex:%ld",NSStringFromSelector(_cmd),indexPath.titleIndex,indexPath.rowIndex);
    
    
        //如果需要选择辅食 就弹出新界面
        if(data.isHaveSlideFood){
           SlideFoodViewController *slideFoodController = [[SlideFoodViewController alloc]initWithTableViewFrame:CGRectMake(0, NAV_HEIGHT, self.view.width, SCREEN_HEIGHT-NAV_HEIGHT-80) style:UITableViewStylePlain];
            slideFoodController.dataArray = data.slideFood;
            dispatch_async(dispatch_get_main_queue(),^{
                [self presentViewController:slideFoodController animated:YES completion:nil];
            });
           
        }else{
    //        否则 就更新购物篮
    
            [self showCashierDesk];
    
            [ShoppingCarData addGood:data];
            [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
        }
    
        [cell setGoodsCount:[ShoppingCarData countOfGood:data]];
        [ShoppingCarData showOrder];
    
}
#pragma mark ---  ShoppingCarDelegate  ---

- (void)cashierDeskTap{
    
}

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtTitle:(NSString *)title{
    NSLog(@"title:%@",title);
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
