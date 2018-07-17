//
//  AdressManageController.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "AdressManageController.h"
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
    
}

- (void)cancelAction:(AddressManageCell *)cell index:(NSInteger)index{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要删除吗?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    //    //可以给alertview中添加一个输入框
    //    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    //        textField.placeholder = @"alert中的文本";
    //    }];
    //
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
//        //textFields是一个数组，获取所输入的字符串
//        NSLog(@"%@",alert.textFields.lastObject.text);
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
    UITableView *tabView = [[UITableView alloc]initWithFrame:RECT_NAVBAR_AND_NOTABBAR_REMOVEHEIGHT(50) style:UITableViewStylePlain];
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
    newAddress.frame = CGRectMake(20, tabView.bottom+5, SCREEN_WIDTH-40, 45);
    [newAddress addTarget:self action:@selector(addNewAddress:) forControlEvents:UIControlEventTouchUpInside];
    [newAddress add_middle_cornerRadius];
    [self.view addSubview:newAddress];
}

- (void)addNewAddress:(UIButton *)dender {
    
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
