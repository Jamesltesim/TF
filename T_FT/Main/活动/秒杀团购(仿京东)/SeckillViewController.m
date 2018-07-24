//
//  SeckillViewController.m
//  T_FT
//
//  Created by James on 2018/6/27.
//  Copyright © 2018年 James. All rights reserved.
//

#import "SeckillViewController.h"
#import "SeckillTableViewCell.h"
#import "ScrollImage.h"

@interface SeckillViewController ()<
                                    UITableViewDelegate,
                                    UITableViewDataSource>



@property (nonatomic,strong) UITableView *tabView;
@property (nonatomic,strong) ScrollImage *headerView;

@end

@implementation SeckillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabView.frame = self.adjustmentRect;
    [self.view addSubview:self.tabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ScrollImage *)headerView{
    if(!_headerView){
        UIImage *image1 = [UIImage imageNamed:@"12.jpg"];
        UIImage *image2 = [UIImage imageNamed:@"19.jpg"];
        UIImage *image3 = [UIImage imageNamed:@"25.jpg"];
        UIImage *image4 = [UIImage imageNamed:@"29.jpg"];
        NSMutableArray *array = @[image1, image2, image3, image4].mutableCopy;
        _headerView = [[ScrollImage alloc] initWithFrame:CGRectMake(0, 50, self.view.width/2+15, 100) withArray:array];
        _headerView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    }
    return _headerView;
}

- (UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.tableHeaderView = self.headerView;
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
    
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"¥%@",seckill_price]];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0,  1)];
    
    
    SeckillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.soldStatus sold:[sold_count integerValue]  total:[count integerValue]];
    cell.name.text = name;
    cell.price.attributedText = attributedStr;
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
