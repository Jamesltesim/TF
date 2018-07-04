//
//  ActivityViewController.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ActivityViewController.h"
#import "SeckillNavBarView.h"
#import "SeckillViewController.h"
#import "TFSegmentTitleView.h"

@interface ActivityViewController ()<FSPageContentViewDelegate,
                                     TFSegmentTitleViewDelegate>

//@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) SeckillNavBarView *navView;

@property (nonatomic, strong) FSPageContentView *pageContentView;

@end

@implementation ActivityViewController


#pragma mark --
- (void)TFSegmentTitleView:(TFSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
//    self.title = @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"][endIndex];
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.navView.titleView.selectIndex = endIndex;
    
    
//    self.title = @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"][endIndex];
}

#pragma -mark life cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navView.seckillTimes = @[@"16:00\n即将开始",@"18:00",@"20:00",@"22:00",@"00:00"];
    [self.view addSubview:self.navView];
    self.navView.segmentTitleDelegate = self;
    [self.navView.titleView loadTitles: @[@"10:00",@"12:00",@"14:00",@"16:00",@"18:00"]];
    
    
    SeckillViewController *controller1 = [[SeckillViewController alloc]init];
    SeckillViewController *controller2 = [[SeckillViewController alloc]init];
    SeckillViewController *controller3 = [[SeckillViewController alloc]init];
    SeckillViewController *controller4 = [[SeckillViewController alloc]init];
    SeckillViewController *controller5 = [[SeckillViewController alloc]init];
    
    
    controller1.adjustmentRect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.navView.bottom - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT);
    controller2.adjustmentRect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.navView.bottom - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT);
    controller3.adjustmentRect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.navView.bottom - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT);
    controller4.adjustmentRect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.navView.bottom - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT);
    controller5.adjustmentRect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.navView.bottom - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT);
    
    self.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, self.navView.bottom, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.navView.bottom - HOME_INDICATOR_HEIGHT - TABNAR_HEIGHT) childVCs:@[controller1,controller2,controller3,controller4,controller5] parentVC:self delegate:self];
    self.pageContentView.contentViewCurrentIndex = 0;
    //    self.pageContentView.contentViewCanScroll = NO;//设置滑动属性
    [self.view addSubview:_pageContentView];
    
   
}

- (SeckillNavBarView *)navView{
    if(!_navView){
        _navView = [SeckillNavBarView creatNavView];
        _navView.segmentTitleDelegate = self;
        _navView.title = @"秒杀";
        _navView.hidenBottomLine = YES;
    }
    return _navView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark collectionView代理方法
////返回section个数
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 3;
//}
//
////每个section的item个数
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 9;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    ActivityCollectionViewCell *cell = (ActivityCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
//
//    //    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
//
//
//    cell.backgroundColor = [UIColor yellowColor];
//
//    return cell;
//}

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
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(8, 8, 8, 8);
//}
//
////设置每个item水平间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0;
//}
//
//
////设置每个item垂直间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 8;
//}


////通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//
//    UICollectionReusableView *headerView = nil;
//
//        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
//        headerView.backgroundColor =[UIColor grayColor];
//        UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
//        label.text = @"这是collectionView的头部";
//        label.font = [UIFont systemFontOfSize:20];
//        [headerView addSubview:label];
//
//
//    return headerView;
//}
//
//
////点击item方法
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    ActivityCollectionViewCell *cell = (ActivityCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    //    NSString *msg = cell.botlabel.text;
//    //    NSLog(@"%@",msg);
//}
//
//
//
//#pragma mark get set
//
//- (void)createCollectionView{
//    //1.初始化layout
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    //设置collectionView滚动方向
//    //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    //设置headerView的尺寸大小
//    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 130);
//    //该方法也可以设置itemSize
//
//    CGFloat itemWidth = (self.view.width-16-10)/3.0;
//    layout.itemSize =CGSizeMake(itemWidth, 185);
//
//    //2.初始化collectionView
//    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//    [self.view addSubview:_collectionView];
//    _collectionView.backgroundColor = [UIColor whiteColor];
//
//    //3.注册collectionViewCell
//    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
//    //    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
//    [_collectionView registerNib:[UINib nibWithNibName:@"ActivityCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
//
//    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView"];
//
//
//    //4.设置代理
//    _collectionView.delegate = self;
//    _collectionView.dataSource = self;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
