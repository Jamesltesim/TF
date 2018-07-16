//
//  AdressManageController.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "AdressManageController.h"
#import "AdressManageCell.h"

@interface AdressManageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation AdressManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navView.bottom, self.view.width, self.view.height-self.navView.bottom-HOME_INDICATOR_HEIGHT) style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
//    tabView
    [tabView registerNib:[UINib nibWithNibName:@"AdressManageCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tabView];
    tabView.tableFooterView = [[UIView alloc] init];
     tabView.separatorStyle = UITableViewCellSelectionStyleNone;
    tabView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    tabView.estimatedRowHeight = 150;//估算高度
    tabView.rowHeight = UITableViewAutomaticDimension;
    self.dataArray = @[@{@"name":@"aaaa",
                         @"number":@"15511111111",
                         @"address":@"tableView的estimatedRowHeight 这个特性是在iOS 7以ntSize会随着滚动从估算高度慢慢替换成真实高度,这完全可以通过肉眼看出 (当然如果你的公司不适配7的话,你懂得😉)"},
                       @{@"name":@"aaaa",
                         @"number":@"15511111111",
                         @"address":@"tableView的estimatedRowHeight 这个特性是在iOS 7以后才存在,貌似在iOS 8以后才少了许多7中出现的bug,比如在7中你用这个estimatedRowHeight会导致滚动条的大小处于不稳定的状态，contentSize会随着滚动从估算高度慢慢替换成真实高度,这完全可以通过肉眼看出 (当然如果你的公司不适配7的话,你懂得😉)"},
  
                       @{@"name":@"tentSize会随着滚动从估算高度慢慢替",
                         @"number":@"15511111111",
                         @"address":@"tableView的estimatedRowHeight 这个特性是在iOS 7以后才存"}];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AdressManageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.name.text = [self.dataArray objectAtIndex:indexPath.row];
    
    
    NSDictionary *dict = self.dataArray[indexPath.section];
    cell.name.text = dict[@"name"];
    
    cell.phoneNumber.text = dict[@"number"];
    cell.address.text = dict[@"address"];
    
  
    return cell;
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
