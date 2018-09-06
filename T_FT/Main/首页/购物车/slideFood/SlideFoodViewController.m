//
//  SlideFoodViewController.m
//  T_FT
//
//  Created by James on 2018/7/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SlideFoodViewController.h"
#import "SlideFoodHeaderView.h"
#import "SlideFoodTableViewCell.h"
#import "TFNavView.h"
#import "SlideCashierView.h"
#import "ShoppingCarData.h"

@interface SlideFoodViewController ()<UITableViewDelegate,UITableViewDataSource,ShoppingCarDelegate>

@property (nonatomic,strong) TFNavView *navView;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *selectArray;

@property (nonatomic,strong) SlideCashierView *slideCashierView;

@property (nonatomic) CGFloat price;

@end

@implementation SlideFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.navView = [TFNavView creatNavView];
    [self.navView addLeftButtonWithTarget:self action:@selector(back:)];
    self.navView.bottomLineAlpha = 1;
    self.navView.title = @"自订";
    [self.view addSubview:self.navView];
  
    
    self.dataArray = self.goodModel.slideFood;
    
    SlideFoodHeaderView *headerView = [[SlideFoodHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 110)];
    headerView.titleLab.text = self.goodModel.title;
    headerView.priceLab.text = [NSString stringWithFormat:@"¥ %.2lf",self.goodModel.price];
    
     [self.slideCashierView setNumber:0 price:self.goodModel.price];
   
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,NAV_HEIGHT, self.view.width, SCREEN_HEIGHT-NAV_HEIGHT-55) style:UITableViewStylePlain];
    _tableView.estimatedRowHeight = 100;//估算高度
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = headerView;
    [self.tableView registerNib:[UINib nibWithNibName:@"SlideFoodTableViewCell" bundle:nil] forCellReuseIdentifier:@"SlideFoodTableViewCell"];
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.slideCashierView];
    
    [ShoppingCarData addGood:self.goodModel];
    [ShoppingCarData showOrder];
    
    self.price = self.goodModel.price;
    
   
}

- (void)back:(UIButton *)sender {
    [ShoppingCarData subGood:self.goodModel];
    [ShoppingCarData showOrder];
    
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SlideFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SlideFoodTableViewCell"];
    SlideFoodModel *model = self.dataArray[indexPath.row];
    cell.title.text = model.title;
    cell.price.text = [NSString stringWithFormat:@"¥ %.2lf",model.price];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SlideFoodTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    SlideFoodModel *model = self.dataArray[indexPath.row];
    
//    NSLog(@"%ld",[self.selectArray indexOfObject:model]);
    //    更新UI和 数据
    if([self.selectArray containsObject:model]){
        cell.selectedImageView.image = [UIImage imageNamed:@"home_order_slide_circle"];
        [self.selectArray removeObject:model];
        [ShoppingCarData subGood:self.goodModel slideFood:model];
        
        self.price -= model.price;
    }else{
        cell.selectedImageView.image = [UIImage imageNamed:@"home_order_slide_duihao"];
        [self.selectArray addObject:model];
        [ShoppingCarData addGood:self.goodModel slideFood:model];
        self.price += model.price;
        
    }
    [self.slideCashierView setNumber:0 price:self.price];
 [ShoppingCarData showOrder];
//    NSLog(@"%@",self.selectArray);
}

- (NSMutableArray *)selectArray{
    if(!_selectArray){
        _selectArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _selectArray;
}

-(SlideCashierView *)slideCashierView{
    if (!_slideCashierView){
        _slideCashierView = [[SlideCashierView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT - 50, SCREEN_WIDTH, 50)];
        _slideCashierView.delegate = self;
    }
    return _slideCashierView;
}

- (void)slideCashierViewGotoBillView{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
