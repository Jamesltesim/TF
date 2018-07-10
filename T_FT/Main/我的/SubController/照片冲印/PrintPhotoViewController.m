//
//  PrintPhotoViewController.m
//  T_FT
//
//  Created by James on 2018/6/20.
//  Copyright © 2018年 James. All rights reserved.
//

#import "PrintPhotoViewController.h"
#import "PrintPhotoTableViewCell.h"
#import "PhotoDescViewController.h"

@interface PrintPhotoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation PrintPhotoViewController

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CONTENT_FRAME_NO_BAR_HERGHT style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    
        [_tableView registerNib:[UINib nibWithNibName:@"PrintPhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PrintPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.name.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *sizeArray = @[@"89mm X 89mm",@"89mm X 127mm",@"102mm X 152mm",@"114mm X 152mm",@"127mm X 178mm",@""];
    
    NSArray*contentArray = @[@"由高端干式扩印设备制作,使用日本原装进口相纸和墨水，防水不褪色，色彩与京都均将超越冲印",
                             @"由高端干式扩印设备制作,使用日本原装进口相纸和墨水，防水不褪色，色彩与京都均将超越冲印",
                             @"由高端干式扩印设备制作,使用日本原装进口相纸和墨水，防水不褪色，色彩与京都均将超越冲印",
                             @"由高端干式扩印设备制作,使用日本原装进口相纸和墨水，防水不褪色，色彩与京都均将超越冲印",
                             @"由高端干式扩印设备制作,使用日本原装进口相纸和墨水，防水不褪色，色彩与京都均将超越冲印",
                             @"由高端干式扩印设备制作,使用日本原装进口相纸和墨水，防水不褪色，色彩与京都均将超越冲印"];
    
    NSArray *priceArray = @[@"¥1.00/张",@"¥0.7/张",@"¥0.80/张",@"¥0.9/张",@"¥2.00/张",@""];
    PhotoDescViewController *controller = [[PhotoDescViewController alloc]init];
    
    controller.sizeString = sizeArray[indexPath.row];
     controller.contentString = contentArray[indexPath.row];
     controller.priceString = priceArray[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"offset:%f",scrollView.contentOffset.y);
//    NSArray *cells = [self.tableView visibleCells];
//
//    for(PrintPhotoTableViewCell *cell in cells){
//        cell.top.constant = -scrollView.contentOffset.y/4.0;
//        cell.bottom.constant = scrollView.contentOffset.y/4.0;
//    }
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[@"小方块",@"5寸",@"6寸",@"大6寸",@"7寸",@"证件照"];
    
    [self.view addSubview:self.tableView];
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
