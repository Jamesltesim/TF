//
//  ConvertViewController.m
//  T_FT
//
//  Created by James on 2018/9/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ConvertViewController.h"
#import "SeckillTableViewCell1.h"
#import "TFAPIForActivity.h"
#import "ConvertDetailController.h"

@interface ConvertViewController ()<UITableViewDelegate,UITableViewDataSource,TFAPICallBackProtocol>

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tabView;

@end

@implementation ConvertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分商城";
    self.view.backgroundColor  = [UIColor whiteColor];
    _tabView  = [[UITableView alloc]initWithFrame:RECT_NAVBAR_AND_TABBAR style:UITableViewStylePlain];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [_tabView registerNib:[UINib nibWithNibName:@"SeckillTableViewCell1" bundle:nil] forCellReuseIdentifier:@"SeckillTableViewCell1"];
    [self.view addSubview:_tabView];
    
    TFAPIForActivity *activityManager = [[TFAPIForActivity alloc]init];
    activityManager.delegate = self;
    [activityManager loadData];
    
}

- (void)TFAPICallBackDidSuccess:(TFAPIBaseManager *)manager{
    NSArray *array = (NSArray *)manager.responseObject;
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    self.dataArray = array[0][@"data"];
    [self.tabView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.dataArray[indexPath.row];
    
    NSNumber *count = dict[@"count"];
    NSNumber *sold_count = dict[@"sold_count"];
    NSString *name = dict[@"name"];
    NSString *seckill_price = dict[@"seckill_price"];
    NSString *original_price = dict[@"original_price"];
    
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"¥%@",seckill_price]];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0,  1)];
    
    
    SeckillTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"SeckillTableViewCell1"];
    [cell.soldStatus sold:[sold_count integerValue]  total:[count integerValue]];
    cell.name.text = name;
    cell.price.attributedText = attributedStr;
    cell.yuanjia.text = original_price;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ConvertDetailController *controller = [[ConvertDetailController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
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
