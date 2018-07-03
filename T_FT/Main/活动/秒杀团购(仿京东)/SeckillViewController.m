//
//  SeckillViewController.m
//  T_FT
//
//  Created by James on 2018/6/27.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SeckillViewController.h"
#import "SeckillTableViewCell.h"

@interface SeckillViewController ()<
                                    UITableViewDelegate,
                                    UITableViewDataSource>

@property (nonatomic,strong) UITableView *tabView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation SeckillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[@{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(20),@"iamge":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530009527846&di=9c4b0a819ee9619e8a2d5f1969e7e9c4&imgtype=0&src=http%3A%2F%2Fcbu01.alicdn.com%2Fimg%2Fibank%2F2015%2F079%2F048%2F2589840970_435159613.jpg"},
                       
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(20)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(80)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(60)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(90)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(20)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(20)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(62)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(20)},
                       @{@"name":@"夜光小学生女童手表儿童男孩女孩手表电子表",@"seckill_price":@"15.8",@"original_price":@"58",@"count":@(100),@"sold_count":@(39)}];
    
//    NSLog(@"rect:%@",NSStringFromCGRect(self.adjustmentRect));
    self.tabView.frame = self.adjustmentRect;
    [self.view addSubview:self.tabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tabView.delegate = self;
        _tabView.dataSource = self;
        [_tabView registerNib:[UINib nibWithNibName:@"SeckillTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tabView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.dataArray[indexPath.row];
    
    NSNumber *count = dict[@"count"];
    NSNumber *sold_count = dict[@"sold_count"];
    NSString *name = dict[@"name"];
    NSString *seckill_price = dict[@"seckill_price"];
    NSString *original_price = dict[@"original_price"];
    
    SeckillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.soldStatus sold:[sold_count integerValue]  total:[count integerValue]];
    cell.name.text = name;
    cell.price.text = seckill_price;
    cell.yuanjia.text = original_price;
    
    return cell;
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
