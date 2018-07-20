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

@interface ShoppingListViewController ()<ShoppingCarDelegate,TFShoppingListDelegate,TFAPICallBackProtocol>

@property (nonatomic,strong)ShowShoppingCarView *carView;
@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(nonatomic,strong) NSMutableArray *controllerDataArray;

@end

@implementation ShoppingListViewController

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

-(void)tapGesture:(UITapGestureRecognizer *)gesture {
    DeliveryPickView *pickerView = [[DeliveryPickView alloc]init];
    pickerView.titleLable.text = @"送餐时间";
    [pickerView.confirmButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
     [pickerView.cancelButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
    [pickerView showOn:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    TFAPIForShoppingList *apiBanner = [[TFAPIForShoppingList alloc]init];
    apiBanner.delegate = self;
    [apiBanner loadData];
    
    //
    _carView = [[ShowShoppingCarView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-50-HOME_INDICATOR_HEIGHT, SCREEN_WIDTH, 50)];
    _carView.delegate = self;
    [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.01 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
    
    if([ShoppingCarData getCount]){
        [self showCashierDesk];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---  get set  ---



#pragma mark ---  内部方法  ---
- (void)showCashierDesk{
    if(!self.carView.superview){
        [self.view addSubview:self.carView];
//        CGRect rect = self.managerView.frame;
//        self.managerView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, SCREEN_HEIGHT-self.carView.height - HOME_INDICATOR_HEIGHT);
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
//        self.tableView.frame =CGRectMake(0, self.scrollTitle.bottom, self.view.width, self.view.height - self.scrollTitle.height-HOME_INDICATOR_HEIGHT);
    }
    
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
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    self.headerImageView.userInteractionEnabled = YES;
    [self.headerImageView addGestureRecognizer:gesture];

}

#pragma mark ---  TFShoppingListDelegate  ---

- (void)TFShoppingListWithTableView:(UITableView *)tableView cell:(ShoppingTableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath data:(GoodModel *)data{
     [cell setGoodsCount:[ShoppingCarData countOfGood:data]];
    
}

- (void)TFShoppingListWithTableView:(UITableView *)tableView cell:(ShoppingTableViewCell *)cell didSelectRowAtIndexPath:(TFShoppingIndexPath *)indexPath data:(GoodModel *)data{
    NSLog(@"%@ : titleIndex:%ld rowIndex:%ld",NSStringFromSelector(_cmd),indexPath.titleIndex,indexPath.rowIndex);
    
        //如果需要选择辅食 就弹出新界面
        if(data.isHaveSlideFood){
    
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

//#pragma mark ---  UItableViewDelegate  ---
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//     GoodModel *model = self.dataArray[indexPath.row];
//    NSString *imgUrl = model.imgUrl;
//    if([imgUrl isEqualToString:@""]){
//        return 120.f;
//    }else{
//        return 140.f;
//    }
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return self.dataArray.count;
//
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//      GoodModel *model = self.dataArray[indexPath.row];
//    NSString *imgUrl = model.imgUrl;
//
//    ShoppingTableViewCell *shoppingCell = nil;
//
//    if([imgUrl isEqualToString:@""]){
//        ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];
//
//
//        cell.title.text = model.title;
//        cell.content.text = model.content;
//
//        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
//        shoppingCell = cell;
//    }else{
//        ShoppingListImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListImageCell"];
//
//
//        cell.title.text = model.title;
//        cell.content.text = model.content;
//        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
//        shoppingCell = cell;
//    }
//
//
//         [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
//
//
//
//    return shoppingCell;
//
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//      GoodModel *model = self.dataArray[indexPath.row];
//
//    ShoppingTableViewCell *shoppingCell = [tableView cellForRowAtIndexPath:indexPath];
//
//    //如果需要选择辅食 就弹出新界面
//    if(model.isHaveSlideFood){
//
//    }else{
////        否则 就更新购物篮
//
//        [self showCashierDesk];
//
//        [ShoppingCarData addGood:model];
//        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
//    }
//
//
//
//    [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
//    [ShoppingCarData showOrder];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
