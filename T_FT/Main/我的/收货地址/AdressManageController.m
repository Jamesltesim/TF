//
//  AdressManageController.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "AdressManageController.h"
#import "NewAddressViewController.h"
#import "EditAddressViewController.h"
#import "YXAlertController.h"

#import "AddressManageCell.h"

@interface AdressManageController ()<UITableViewDelegate,UITableViewDataSource,AddressManageCellDelegate>

@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation AdressManageController

- (void)defaultAction:(AddressManageCell *)cell index:(NSInteger)index{
        if(cell.defaultBtn.tag == 0){
            [cell.defaultBtn setImage:[UIImage imageNamed:@"address_check@2x"] forState:UIControlStateNormal];
            cell.defaultBtn.tag =999;
        }else{
            [cell.defaultBtn setImage:[UIImage imageNamed:@"address_circle@2x"] forState:UIControlStateNormal];
            cell.defaultBtn.tag =0;
        }
}

- (void)editAction:(AddressManageCell *)cell index:(NSInteger)index{
    NSDictionary *dict = self.dataArray[index];
    
    EditAddressViewController *controller = [[EditAddressViewController alloc]init];
    controller.name = dict[@"name"];
    controller.phone = dict[@"number"];
    controller.address = dict[@"address"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)cancelAction:(AddressManageCell *)cell index:(NSInteger)index{
    YXAlertController *alertController = [YXAlertController alertControllerWithTitle:@"是否确认删除该地址?" message:@"" style:YXAlertControllerStyleAlert];
    YXAlertAction *cancel = [YXAlertAction actionWithTitle:@"取消" style:1 handler:^(YXAlertAction * _Nonnull action) {
        NSLog(@"custom:点击了取消");
    }];
    
    
    YXAlertAction *done = [YXAlertAction actionWithTitle:@"确定" style:2 handler:^(YXAlertAction * _Nonnull action) {
        NSLog(@"custom:点击了确定");
    }];
    
    //    YXAlertAction *done1 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //
    //    YXAlertAction *done2 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //    YXAlertAction *done3 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];YXAlertAction *done4 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //    YXAlertAction *done5 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //    YXAlertAction *done6 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //    YXAlertAction *done7 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //    YXAlertAction *done8 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //    YXAlertAction *done9 = [YXAlertAction actionWithTitle:@"确认" style:0 handler:^(YXAlertAction * _Nonnull action) {
    //
    //    }];
    //自定义颜色设置
    alertController.layout.doneActionTitleColor = [UIColor whiteColor];
    alertController.layout.cancelActionBackgroundColor = [UIColor whiteColor];
    alertController.layout.cancelActionTitleColor =THEME_FONT_COLOR_BLACK;
    alertController.layout.doneActionBackgroundColor = THEME_COLOR_RED;
    alertController.layout.lineColor = THEME_BACKGROUND_VIEW_GRAY;
    alertController.layout.topViewBackgroundColor = [UIColor whiteColor];
    alertController.layout.titleColor = THEME_FONT_COLOR_BLACK;
    [alertController layoutSettings];
    
    [alertController addAction:cancel];
    [alertController addAction:done];
    //    [alertController addAction:done1];
    //    [alertController addAction:done2];
    //    [alertController addAction:done3];
    //    [alertController addAction:done4];
    //    [alertController addAction:done5];
    //    [alertController addAction:done6];
    //    [alertController addAction:done7];
    //    [alertController addAction:done8];
    //    [alertController addAction:done9];
    
    [alertController presentFromViewController:self animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView.title = @"地址管理";
    self.view.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
    UITableView *tabView = [[UITableView alloc]initWithFrame:RECT_NAVBAR_AND_NOTABBAR_REMOVEHEIGHT(60) style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
//    tabView
    [tabView registerNib:[UINib nibWithNibName:@"AddressManageCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tabView];
    tabView.tableFooterView = [[UIView alloc] init];
     tabView.separatorStyle = UITableViewCellSelectionStyleNone;
    tabView.backgroundColor = [UIColor clearColor];
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
                         @"address":@"tableView的estimatedRowHeight 这个特性是在iOS 7以后才存"},
                       @{@"name":@"tentSize会随着滚动从估算高度慢慢替",
                         @"number":@"15511111111",
                         @"address":@"tableView的estimatedRowHeight 这个特性是在iOS 7以后才存"}];
    
    
    UIButton *newAddress = [UIButton buttonWithType:UIButtonTypeCustom];
    [newAddress setTitle:@"新建地址" forState:UIControlStateNormal];
    newAddress.titleLabel.font = [UIFont systemFontOfSize:15];
    [newAddress setBackgroundColor:THEME_COLOR_RED];
    newAddress.frame = CGRectMake(20, tabView.bottom+10, SCREEN_WIDTH-40, 45);
    [newAddress addTarget:self action:@selector(addNewAddress:) forControlEvents:UIControlEventTouchUpInside];
    [newAddress add_middle_cornerRadius];
    [self.view addSubview:newAddress];
}

- (void)addNewAddress:(UIButton *)dender {
    NewAddressViewController *controller = [[NewAddressViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
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
    AddressManageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.name.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.index = indexPath.section;
    cell.delegate = self;
    
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
