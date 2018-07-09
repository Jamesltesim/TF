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

@interface ShoppingListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) ScrollTitleView *scrollTitle;

@property (nonatomic,strong)ShowShoppingCarView *carView;
@end

@implementation ShoppingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollTitle];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.scrollTitle.bottom, self.view.width, self.view.height - self.scrollTitle.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"ShoppingListImageCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListImageCell"];
     [tableView registerNib:[UINib nibWithNibName:@"ShoppingListTextCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListTextCell"];
    [self.view addSubview:tableView];
    
    
    GoodModel *model1 = [[GoodModel alloc] init];
    model1.goodId = @(1001);
    model1.title = @"Ferrero - Toffee Almond Roca Harmony";
    model1.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model1.imgUrl = @"www";
    model1.price = 200.00;
    
    GoodModel *model2 = [[GoodModel alloc] init];
    model2.goodId = @(1002);
    model2.title = @"Ferrero - Toffee Almond Roca Harmony";
    model2.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model2.imgUrl = @"www";
    model2.price = 200.00;
    
    GoodModel *model3 = [[GoodModel alloc] init];
    model3.goodId = @(1003);
    model3.title = @"Ferrero - Toffee Almond Roca Harmony";
    model3.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model3.imgUrl = @"www";
    model3.price = 200.00;
    
    GoodModel *model4 = [[GoodModel alloc] init];
    model4.goodId = @(1004);
    model4.title = @"Ferrero - Toffee Almond Roca Harmony";
    model4.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model4.imgUrl = @"";
    model4.price = 200.00;
    
    GoodModel *model5 = [[GoodModel alloc] init];
    model5.goodId = @(1005);
    model5.title = @"Ferrero - Toffee Almond Roca Harmony";
    model5.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model5.imgUrl = @"www";
    model5.price = 200.00;
    
    GoodModel *model6 = [[GoodModel alloc] init];
    model6.goodId = @(1006);
    model6.title = @"Ferrero - Toffee Almond Roca Harmony";
    model6.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model6.imgUrl = @"www";
    model6.price = 200.00;
    
    GoodModel *model7 = [[GoodModel alloc] init];
    model7.goodId = @(1007);
    model7.title = @"Ferrero - Toffee Almond Roca Harmony";
    model7.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model7.imgUrl = @"www";
    model7.price = 200.00;
    
    GoodModel *model8 = [[GoodModel alloc] init];
    model8.goodId = @(1008);
    model8.title = @"Ferrero - Toffee Almond Roca Harmony";
    model8.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model8.imgUrl = @"www";
    model8.price = 200.00;
    
    GoodModel *model9 = [[GoodModel alloc] init];
    model9.goodId = @(1009);
    model9.title = @"Ferrero - Toffee Almond Roca Harmony";
    model9.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model9.imgUrl = @"www";
    model9.price = 200.00;
    
    
    self.dataArray = @[model1,model2,model3,model4,model5,model6,model7,model8,model9];
    
    _carView = [[ShowShoppingCarView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-50-HOME_INDICATOR_HEIGHT, SCREEN_WIDTH, 50)];
    
      [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.01 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
}

- (ScrollTitleView *)scrollTitle{
    if(!_scrollTitle){
        _scrollTitle = [[ScrollTitleView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 70) titles:@[@"第一个",@"第二个回复大家撒哈拉",@"第三个v 蝴蝶结撒谎",@"第四个范德萨快乐",@"fdasfdsafdsgnreguehie"]];
    }
    return _scrollTitle;
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
    if([imgUrl isEqualToString:@""]){
        ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];
        
        
        cell.title.text = model.title;
        cell.content.text = model.content;
        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
        return cell;
    }else{
        ShoppingListImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListImageCell"];
        
        
        cell.title.text = model.title;
        cell.content.text = model.content;
        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
          return cell;
    }
   
    return nil;
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect rect = tableView.frame;
    
      GoodModel *model = self.dataArray[indexPath.row];
    
    //如果需要选择辅食 就弹出新界面
    if(model.isHaveSlideFood){
        
    }else{
//        否则 就更新购物篮
        
        if(!self.carView.superview){
            [self.view addSubview:self.carView];
            tableView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, SCREEN_HEIGHT-50-self.scrollTitle.bottom);
        }
        
        [ShoppingCarData addGood:model];
    }
  
    
    
     [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
    [ShoppingCarData showOrder];
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
