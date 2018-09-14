//
//  ConvertDetailController.m
//  T_FT
//
//  Created by James on 2018/9/13.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ConvertDetailController.h"
#import "ConvertDetailCell.h"
#import "ConvertHeaderView.h"
#import "ConvertBannerHeaderView.h"

@interface ConvertDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tabView;
@property (nonatomic,strong) UIButton *bottomBtn;

@end

@implementation ConvertDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"积分商城";
    
    _tabView  = [[UITableView alloc]initWithFrame:RECT_NAVBAR_AND_TABBAR style:UITableViewStyleGrouped];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    _tabView.rowHeight = UITableViewAutomaticDimension;
    _tabView.tableFooterView.frame = CGRectZero;
    _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tabView.backgroundColor = [UIColor whiteColor];
    [_tabView registerNib:[UINib nibWithNibName:@"ConvertDetailCell" bundle:nil] forCellReuseIdentifier:@"ConvertDetailCell"];
    [self.view addSubview:_tabView];
    
    self.dataArray = @[@{@"a":@"1.文化出海，中国优质游戏扬帆远航正当时\n2.美国监管机构开始行动：处罚涉嫌欺诈加密货币公司\n3.Facebook推出新AI系统：有助于检测仇恨言论\n4.无人商店走上香港街头 消费者却褒贬不一\n5.知情人士:腾讯内部要求不许见子弹短信 怕被\n6.文化出海，中国优质游戏扬帆远航正当时\n7.美国监管机构开始行动：处罚涉嫌欺诈加密货币公司\n8.Facebook推出新AI系统：有助于检测仇恨言论\n9.无人商店走上香港街头 消费者却褒贬不一\n10.知情人士:腾讯内部要求不许见子弹短信 怕被"},
                       @{@"a":@"1.文化出海，中国优质游戏扬帆远航正当时\n2.美国监管机构开始行动：处罚涉嫌欺诈加密货币公司\n3.Facebook推出新AI系统：有助于检测仇恨言论"}];
    
    
    [self.bottomBtn setTitle:@"今日售罄" forState:UIControlStateNormal];
    [self.view addSubview:self.bottomBtn];
}

- (UIButton *)bottomBtn{
    if(!_bottomBtn){
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomBtn.frame = CGRectMake(0, self.tabView.bottom, self.tabView.width, 50);
        _bottomBtn.backgroundColor = THEME_BACKGROUND_VIEW_GRAY;
    }
    return _bottomBtn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 258;
    }
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        ConvertBannerHeaderView *header = [[ConvertBannerHeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 248) title:@"产品介绍"];
        return header;
    }
    ConvertHeaderView *header = [[ConvertHeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 40) title:@"注意事项"];
    return header;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.dataArray[indexPath.section];
    
    ConvertDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConvertDetailCell"];
 
    cell.textLab.attributedText =  [[NSAttributedString alloc]initWithString:dict[@"a"]];
    [cell.textLab changeLineSpaceWithSpace:5];
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
