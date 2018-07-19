//
//  LTPageViewTestOneVC.m
//  OCExample
//
//  LTPageViewTestOneVC.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/19.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "LTPersonalMainPageTestVC.h"
#import "LTScrollView-Swift.h"

#import "ShoppingCarData.h"
#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"


#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)

@interface LTPersonalMainPageTestVC () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation LTPersonalMainPageTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
        GoodModel *model1 = [[GoodModel alloc] init];
        model1.goodId = @(1001);
        model1.title = @"Ferrero - Toffee Almond Roca Harmony";
        model1.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model1.imgUrl = @"www";
        model1.price = 300.00;
    
        GoodModel *model2 = [[GoodModel alloc] init];
        model2.goodId = @(1002);
        model2.title = @"Ferrero - Toffee Almond Roca Harmony";
        model2.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model2.imgUrl = @"www";
        model2.price = 199.00;
    
        GoodModel *model3 = [[GoodModel alloc] init];
        model3.goodId = @(1003);
        model3.title = @"Ferrero - Toffee Almond Roca Harmony";
        model3.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model3.imgUrl = @"www";
        model3.price = 168.00;
    
        GoodModel *model4 = [[GoodModel alloc] init];
        model4.goodId = @(1004);
        model4.title = @"Ferrero - Toffee Almond Roca Harmony";
        model4.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model4.imgUrl = @"";
        model4.price = 299.00;
    
        GoodModel *model5 = [[GoodModel alloc] init];
        model5.goodId = @(1005);
        model5.title = @"Ferrero - Toffee Almond Roca Harmony";
        model5.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model5.imgUrl = @"www";
        model5.price = 16.88;
    
        GoodModel *model6 = [[GoodModel alloc] init];
        model6.goodId = @(1006);
        model6.title = @"Ferrero - Toffee Almond Roca Harmony";
        model6.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model6.imgUrl = @"www";
        model6.price = 9.9;
    
        GoodModel *model7 = [[GoodModel alloc] init];
        model7.goodId = @(1007);
        model7.title = @"Ferrero - Toffee Almond Roca Harmony";
        model7.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model7.imgUrl = @"www";
        model7.price = 1.58;
    
        GoodModel *model8 = [[GoodModel alloc] init];
        model8.goodId = @(1008);
        model8.title = @"Ferrero - Toffee Almond Roca Harmony";
        model8.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model8.imgUrl = @"www";
        model8.price = 0.99;
    
        GoodModel *model9 = [[GoodModel alloc] init];
        model9.goodId = @(1009);
        model9.title = @"Ferrero - Toffee Almond Roca Harmony";
        model9.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
        model9.imgUrl = @"www";
        model9.price = 1.99;
    
    
        self.dataArray = @[model1,model2,model3,model4,model5,model6,model7,model8,model9];
#warning 重要 必须赋值
    self.glt_scrollView = self.tableView;
}

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

//        [self showCashierDesk];
//
//        [ShoppingCarData addGood:model];
//        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
    }



    [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
    [ShoppingCarData showOrder];
}

- (UITableView *)tableView {
    if (!_tableView) {
        CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
        //这个44为导航高度
        CGFloat Y = statusBarH + 44;
        //这个44为切换条的高度
        CGFloat H = kIPhoneX ? (self.view.bounds.size.height - Y - 34 -44) : self.view.bounds.size.height - Y - 44;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListImageCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListImageCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListTextCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListTextCell"];
    }
    return _tableView;
}

@end
