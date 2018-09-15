//
//  TestViewController.m
//  T_FT
//
//  Created by James on 2018/9/5.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingListController.h"
#import "PageView.h"
#import "TFAPIForShoppingList.h"
#import "PageViewDelegate.h"

#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"
#import "SlideFoodViewController.h"
#import "ShoppingCarData.h"
#import "ShowShoppingCarView.h"
#import "DeliveryPickView.h"
#import "UIView+LXShadowPath.h"
#import "ShoppingCarViewController.h"

#import "ShoppingListNavView.h"

@interface ShoppingListController ()<TFAPICallBackProtocol,PageViewDelegate,ShoppingCarDelegate>

@property (nonatomic,strong) UIImageView *headerImgView;
@property (nonatomic,strong)PageView *pageView;

@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSMutableArray *contentArray;

@property (nonatomic,strong)ShowShoppingCarView *carView;

@property (nonatomic,strong) ShoppingListNavView *navView;

@end

@implementation ShoppingListController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self.view addSubview:self.headerImgView];
        [self.view addSubview:self.navView];
    [self.view addSubview:self.pageView];
    
    
}

- (void)navViewTap:(UITapGestureRecognizer *)tap {
    DeliveryPickView *pickerView = [[DeliveryPickView alloc] init];
    pickerView.titleLable.text = @"送餐时间";
    [pickerView.confirmButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
    [pickerView.cancelButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
    [pickerView showOn:self.view];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(!self.titleArray){
        TFAPIForShoppingList *apiBanner = [[TFAPIForShoppingList alloc]init];
        apiBanner.delegate = self;
        [apiBanner loadData];
    }
    
    if([ShoppingCarData getCount]){
        [self showCashierDesk];
    }
    
    [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
    [self.pageView reloadCurrentTableView];
    
    NSLog(@"当前界面 用户已经选择:%ld 商品",[self getSelectedGoodCountAtCurrentView]);
    [self.pageView updateRedCircle:[self getSelectedGoodCountAtCurrentView] atIndex:self.pageView.currentIndex];
    
}
#pragma mark---  get set  ---

- (ShoppingListNavView *)navView{
    if(!_navView){
        _navView = [[ShoppingListNavView alloc]init];
        [_navView addBackButtonWithTarget:self action:@selector(back)];
    }
    return _navView;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (ShowShoppingCarView *)carView{
    if(!_carView){
        _carView = [[ShowShoppingCarView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT - 50, SCREEN_WIDTH, 50)];
        _carView.delegate = self;
        _carView.title = @"查看我的购物篮";
        [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.03 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
    }
    return _carView;
}

- (UIImageView *)headerImgView{
    if(!_headerImgView){
        _headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
        _headerImgView.backgroundColor = [UIColor purpleColor];
    }
    return _headerImgView;
}
- (PageView *)pageView{
    if (!_pageView){
        _pageView = [[PageView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-100) dataArray:@[]];
        _pageView.delegate = self;
    }
    return _pageView;
}
#pragma mark ---  TFAPICallBackProtocol  ---
- (void)TFAPICallBackDidSuccess:(TFAPIBaseManager *)manager{
    NSDictionary *dataDict = manager.responseObject;
    NSArray *array = dataDict[@"data"];
    
    
    //    处理数据
    _titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    _contentArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (NSDictionary *dict in array){
        [_titleArray addObject:dict[@"title"]];
        [_contentArray addObject:dict[@"data"]];
    }
    
    [self.pageView reloadData:array];
    
    [self getSelectedGoodCountAtCurrentView];
}

- (void)TFAPICallBackDidFailed:(TFAPIBaseManager *)manager{
    
}

#pragma mark ---  ShoppingCarDelegate  ---

- (void)cashierDeskTap{
    [self.navigationController pushViewController:[[ShoppingCarViewController alloc]init] animated:YES];
}

#pragma mark ---  PageViewDelegate  ---

- (CGFloat)shoppingTableView:(TFShoppingTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.contentArray[tableView.segmentIndex];
    GoodModel *model = array[indexPath.row];
    NSString *imgUrl = model.imgUrl;
    if([imgUrl isEqualToString:@""]){
        return tableView.estimatedRowHeight;
    }else{
        return 140.f;
    }
}

- (NSInteger)shoppingTableView:(TFShoppingTableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *array = self.contentArray[tableView.segmentIndex];
    return array.count;
}

- (UITableViewCell *)shoppingTableView:(TFShoppingTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = self.contentArray[tableView.segmentIndex];
    GoodModel *model = array[indexPath.row];
    NSString *imgUrl = model.imgUrl;
    
    ShoppingTableViewCell *shoppingCell = nil;
    
    ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];
    
    
    cell.title.text = model.title;
    cell.content.text = model.content;
    
    cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
    shoppingCell = cell;
    //
    if([imgUrl isEqualToString:@""]){
        ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];
        
        
        cell.title.text = model.title;
        cell.content.text = model.content;
        
        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
        shoppingCell = cell;
    }else{
        ShoppingListImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListImageCell"];
        
        
        cell.title.text = model.title;
        cell.content.text = model.content;
        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
        shoppingCell = cell;
    }
    
    [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
    
    return shoppingCell;
}

- (void)shoppingTableView:(TFShoppingTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = tableView.segmentIndex;
    NSArray *array = self.contentArray[tableView.segmentIndex];
    GoodModel *model = array[indexPath.row];
    ShoppingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@ : titleIndex:%ld rowIndex:%ld",NSStringFromSelector(_cmd),index,indexPath.row);
    
    //如果需要选择辅食 就弹出新界面
    if(model.isHaveSlideFood){
        SlideFoodViewController *slideFoodController = [[SlideFoodViewController alloc] init];
        slideFoodController.goodModel = model;
        dispatch_async(dispatch_get_main_queue(),^{
            [self presentViewController:slideFoodController animated:YES completion:nil];
        });
        
    }else{
        //        否则 就更新购物篮
        
        [self showCashierDesk];
        
        [ShoppingCarData addGood:model];
        [cell setGoodsCount:[ShoppingCarData countOfGood:model]];
        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
    }
    
    [ShoppingCarData showOrder];
    NSLog(@"当前界面 用户已经选择:%ld 商品",[self getSelectedGoodCountAtCurrentView]);
    [self.pageView updateRedCircle:[self getSelectedGoodCountAtCurrentView] atIndex:tableView.segmentIndex];
    
}

- (NSInteger)getSelectedGoodCountAtCurrentView{
    
    NSArray *array1 = self.contentArray[self.pageView.currentIndex];
    NSArray *array2 = [ShoppingCarData getAllGoods][GOODS_KEY];
    
    NSInteger count = 0;
    for (ShoppingCarModel *shoppingModel in array2){
        for (GoodModel *model in array1){
            if ([shoppingModel.goodId isEqualToNumber:model.goodId]){
                count += shoppingModel.count;
            }
        }
    }
    return count;
}

- (NSArray *)getSelectedAllGoodCount{

    
    NSMutableArray *marr = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray *array2 = [ShoppingCarData getAllGoods][GOODS_KEY];
    for (int i=0;i<self.contentArray.count;i++){
    
        NSArray *array1 = self.contentArray[i];
        
        NSInteger count = 0;
        for (ShoppingCarModel *shoppingModel in array2){
            for (GoodModel *model in array1){
                if ([shoppingModel.goodId isEqualToNumber:model.goodId]){
                    count += shoppingModel.count;
                }
            }
        }
        [marr addObject:[NSNumber numberWithInteger:count]];
    }
    return marr;
}

#pragma mark ---  内部方法  ---
- (void)showCashierDesk{
    if(!self.carView.superview){
        [self.view addSubview:self.carView];
        
        [self.pageView showCashierDeskWithHeight:self.carView.height];
        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
        
    }
}

- (void)hidenCashierDesk{
    if(self.carView.superview){
        [self.carView removeFromSuperview];
        [self.pageView hiddenCashierDeskWithHeight:self.carView.height];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

