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

@interface SlideFoodViewController ()
@property (nonatomic,strong) TFNavView *navView;
@end

@implementation SlideFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navView = [TFNavView creatNavView];
    [self.navView addLeftButtonWithTarget:self action:@selector(back:)];
    self.navView.bottomLineAlpha = 1;
    self.navView.title = @"自订";
    [self.view addSubview:self.navView];
  
    [self.tableView registerNib:[UINib nibWithNibName:@"SlideFoodTableViewCell" bundle:nil] forCellReuseIdentifier:@"SlideFoodTableViewCell"];
    SlideFoodHeaderView *headerView = [[SlideFoodHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.width, 200)];
    headerView.content.text = @"dfkasdfjdajglhdksa;fdsajkfhdlsjahfjdslhafjldshfjdlskahfjdslhagvkdsahgjkldshguewhvguken.vnjdknlvjen..KLVJEKANLVJKNVJKENJVK.ENjv ne.wlnvje.knvje.nkjvn´≥√˜kjdx,.";
    [headerView updateConstraints];
    self.tableView.tableHeaderView = headerView;
    
}

- (void)back:(UIButton *)sender {
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
    NSDictionary *dict = self.dataArray[indexPath.row];
    cell.title.text = dict[@"title"];
    cell.price.text = [NSString stringWithFormat:@"¥ %@",dict[@"price"]];
    
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
