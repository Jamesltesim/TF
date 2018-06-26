//
//  ActivityViewController.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityCollectionViewCell.h"
#import "SeckillNavBarView.h"
#import "SeckillTableViewCell.h"


@interface ActivityViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,
                                    UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UITableView *tabView;
@property (nonatomic,strong) SeckillNavBarView *navView;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation ActivityViewController

#pragma -mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createCollectionView];
//
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _navView = [SeckillNavBarView creatNavView];
    _navView.title = @"秒杀";
    _navView.hidenBottomLine = YES;
    [self.view addSubview:_navView];
    
    [self.view addSubview:self.tabView];
    
    
    self.navView.seckillTimes = @[@"18:00:00",@"18:00:00",@"18:00:00"];
    

    
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
    
    
    
//    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
//
//    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    // Hide the time
//    header.lastUpdatedTimeLabel.hidden = YES;
//
//    // Hide the status
//    header.stateLabel.hidden = YES;
//    self.collecstionView.mj_header = header;
//    //
//    //    // 马上进入刷新状态
//    [self.collectionView.mj_header beginRefreshing];
    
}


- (UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navView.bottom, self.view.width, CONTENT_HEIGHT_WITH_BAR_HERGHT - self.navView.height + NAV_HEIGHT) style:UITableViewStylePlain];
        
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





//- (void)loadNewData
//{
//    // 1.添加假数据
//    //    for (int i = 0; i<5; i++) {
//    //        [self.data insertObject:MJRandomData atIndex:0];
//    //    }
//
//    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
//    //    __weak UITableView *tableView = self.tableView;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 刷新表格
//        //        [tableView reloadData];
//
//        // 拿到当前的下拉刷新控件，结束刷新状态
//        [self.collectionView.mj_header endRefreshing];
//    });
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActivityCollectionViewCell *cell = (ActivityCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    //    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    
    
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

//设置每个item的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(90, 130);
//}

//footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 8;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *headerView = nil;
 
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        headerView.backgroundColor =[UIColor grayColor];
        UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
        label.text = @"这是collectionView的头部";
        label.font = [UIFont systemFontOfSize:20];
        [headerView addSubview:label];
    
    
    return headerView;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityCollectionViewCell *cell = (ActivityCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    NSString *msg = cell.botlabel.text;
    //    NSLog(@"%@",msg);
}



#pragma mark get set

- (void)createCollectionView{
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView的尺寸大小
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 130);
    //该方法也可以设置itemSize
    
    CGFloat itemWidth = (self.view.width-16-10)/3.0;
    layout.itemSize =CGSizeMake(itemWidth, 185);
    
    //2.初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    //    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [_collectionView registerNib:[UINib nibWithNibName:@"ActivityCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView"];
    
    
    //4.设置代理
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
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
