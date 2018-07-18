//
//  ShoppingListViewController.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "ScrollTitleView.h"
#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"
#import "ShowShoppingCarView.h"
#import "ShoppingCarData.h"
#import "UIView+LXShadowPath.h"

@interface ShoppingListViewController ()

//@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
//
//@property (nonatomic,strong) ScrollTitleView *scrollTitle;
//
@property (nonatomic,strong)ShowShoppingCarView *carView;
@end

@implementation ShoppingListViewController


#pragma mark---  lefe cycle  ---

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.hidden = YES;
////    self.navView.hidden = YES;
//
//
//
//    [self.view addSubview:self.tableView];
//
//
//    GoodModel *model1 = [[GoodModel alloc] init];
//    model1.goodId = @(1001);
//    model1.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model1.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model1.imgUrl = @"www";
//    model1.price = 300.00;
//
//    GoodModel *model2 = [[GoodModel alloc] init];
//    model2.goodId = @(1002);
//    model2.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model2.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model2.imgUrl = @"www";
//    model2.price = 199.00;
//
//    GoodModel *model3 = [[GoodModel alloc] init];
//    model3.goodId = @(1003);
//    model3.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model3.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model3.imgUrl = @"www";
//    model3.price = 168.00;
//
//    GoodModel *model4 = [[GoodModel alloc] init];
//    model4.goodId = @(1004);
//    model4.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model4.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model4.imgUrl = @"";
//    model4.price = 299.00;
//
//    GoodModel *model5 = [[GoodModel alloc] init];
//    model5.goodId = @(1005);
//    model5.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model5.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model5.imgUrl = @"www";
//    model5.price = 16.88;
//
//    GoodModel *model6 = [[GoodModel alloc] init];
//    model6.goodId = @(1006);
//    model6.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model6.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model6.imgUrl = @"www";
//    model6.price = 9.9;
//
//    GoodModel *model7 = [[GoodModel alloc] init];
//    model7.goodId = @(1007);
//    model7.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model7.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model7.imgUrl = @"www";
//    model7.price = 1.58;
//
//    GoodModel *model8 = [[GoodModel alloc] init];
//    model8.goodId = @(1008);
//    model8.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model8.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model8.imgUrl = @"www";
//    model8.price = 0.99;
//
//    GoodModel *model9 = [[GoodModel alloc] init];
//    model9.goodId = @(1009);
//    model9.title = @"Ferrero - Toffee Almond Roca Harmony";
//    model9.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
//    model9.imgUrl = @"www";
//    model9.price = 1.99;
//
//
//    self.dataArray = @[model1,model2,model3,model4,model5,model6,model7,model8,model9];
//
//    _carView = [[ShowShoppingCarView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-50-HOME_INDICATOR_HEIGHT, SCREEN_WIDTH, 50)];
//    _carView.delegate = self;
//      [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.01 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
//
//    if([ShoppingCarData getCount]){
//        [self showCashierDesk];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---  get set  ---

//- (UItableView *)tableView{
//    if(!_tableView){
//        _tableView = [[UItableView alloc]initWithFrame:RECT_NONAVBAR_AND_NOTABBAR style:UItableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListImageCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListImageCell"];
//        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListTextCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListTextCell"];
//
//        _tableView.tableHeaderView = self.scrollTitle;
//    }
//    return _tableView;
//}
//- (ScrollTitleView *)scrollTitle{
//    if(!_scrollTitle){
//        _scrollTitle = [[ScrollTitleView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 70) titles:@[@"第一个",@"第二个回复大家撒哈拉",@"第三个v 蝴蝶结撒谎",@"第四个范德萨快乐",@"fdasfdsafdsgnreguehie"]];
//        _scrollTitle.delegate = self;
//    }
//    return _scrollTitle;
//}

#pragma mark ---  内部方法  ---
- (void)showCashierDesk{
    if(!self.carView.superview){
        [self.view addSubview:self.carView];
//        CGRect rect = self.tableView.frame;
//        self.tableView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, SCREEN_HEIGHT-self.carView.height-self.scrollTitle.bottom - HOME_INDICATOR_HEIGHT);
        
        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
        
    }
    
    
}

- (void)hidenCashierDesk{
    if(self.carView.superview){
        [self.carView removeFromSuperview];
//        self.tableView.frame =CGRectMake(0, self.scrollTitle.bottom, self.view.width, self.view.height - self.scrollTitle.height-HOME_INDICATOR_HEIGHT);
    }
    
}
#pragma mark ---  ShoppingCarDelegate  ---

- (void)cashierDeskTap{
    
}

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtTitle:(NSString *)title{
    NSLog(@"title:%@",title);
}

#pragma mark ---  UItableViewDelegate  ---
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     GoodModel *model = self.dataArray[indexPath.row];
    NSString *imgUrl = model.imgUrl;
    if([imgUrl isEqualToString:@""]){
        return 120.f;
    }else{
        return 140.f;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      GoodModel *model = self.dataArray[indexPath.row];
    NSString *imgUrl = model.imgUrl;

    ShoppingTableViewCell *shoppingCell = nil;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
      GoodModel *model = self.dataArray[indexPath.row];
    
    ShoppingTableViewCell *shoppingCell = [tableView cellForRowAtIndexPath:indexPath];
    
    //如果需要选择辅食 就弹出新界面
    if(model.isHaveSlideFood){
        
    }else{
//        否则 就更新购物篮
        
        [self showCashierDesk];
        
        [ShoppingCarData addGood:model];
        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
    }
  
    
    
    [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
    [ShoppingCarData showOrder];
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
