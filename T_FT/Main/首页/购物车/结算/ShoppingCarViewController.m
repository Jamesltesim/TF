//
//  ShoppingCarViewController.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingCarViewController.h"
#import "ShowShoppingCarView.h"
#import "ShoppingCarData.h"
#import "UIView+LXShadowPath.h"
#import "ShoppingCarCell.h"

#import "ShoppingCarFoodView.h"
#import "TFForwardNavView.h"

@interface ShoppingCarViewController ()<UITableViewDelegate,UITableViewDataSource,ShoppingCarDelegate>

@property (nonatomic,strong)ShowShoppingCarView *carView;
@property (nonatomic,strong) UITableView *tabView;
@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) TFForwardNavView *navView;

@end

@implementation ShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%@",[ShoppingCarData getAllGoods]);
    
    
    self.dataArray = [ShoppingCarData getAllGoods][GOODS_KEY];
    
    [self.view addSubview:self.carView];
    [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0,NAV_HEIGHT, self.view.width, CONTENT_HEIGHT_NO_BAR_HERGHT-self.carView.height) style:UITableViewStylePlain];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    
    [_tabView registerNib:[UINib nibWithNibName:@"ShoppingCarCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _tabView.tableFooterView = [[ShoppingCarFoodView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 150) xiaoji:20.0 discount:45.8 total:22.8];
    [self.view addSubview:_tabView];
    
    [self.view addSubview:self.navView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCarModel *model = self.dataArray[indexPath.row];
    if(model.slideFoods.count == 0){
        return 60;
    }else{
       
        CGFloat height = 0.0f;
        for ( NSArray *array in model.slideFoods){
            height += array.count*40;
        }
        return 60 + height;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ShoppingCarModel *model = self.dataArray[indexPath.row];
    cell.count.text = [NSString stringWithFormat:@"%ld",model.count];
    cell.name.text = model.title;
    cell.price.text = [NSString stringWithFormat:@"%.2lf",model.price];
    
    if(model.slideFoods.count != 0){
        [cell addSlideFoods:model.slideFoods];
    }
    return cell;
}

#pragma mark---  get set  ---


- (TFForwardNavView *)navView{
    if(!_navView){
        _navView = [[TFForwardNavView alloc]init];
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
        _carView.title = @"去支付";
        [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.03 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
    }
    return _carView;
}

- (void)gotoPay{
    
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
