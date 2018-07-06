//
//  MeViewController.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeaderView.h"
#import "ScrollImage.h"
#import "MeCollectionViewCell.h"
#import "ImgAndTextCollectionViewCell.h"
#import "LostViewController.h"
#import "PrintPhotoViewController.h"
//#import "MeNavView.h"
#import "NoiseViewController.h"
#import "iBeaconViewController.h"



@interface MeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    
    CGFloat headerViewHeight;
}


@property (nonatomic,strong) ScrollImage *scrImage;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *labArray;

@property (nonatomic,strong) TFNavView *navView;


@end

@implementation MeViewController

static NSString *iden = @"cell";

- (instancetype)init{
    if(self = [super init]){
        headerViewHeight = 150;
    }
    return self;
}

#pragma mark get set

- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置collectionView滚动方向
        //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        //设置headerView的尺寸大小
        //        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 130);
        //该方法也可以设置itemSize
        
        
        
        //2.初始化collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, CONTENT_HEIGHT_WITH_BAR_HERGHT + NAV_HEIGHT) collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        //3.注册collectionViewCell
        //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
        //    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
        [_collectionView registerNib:[UINib nibWithNibName:@"MeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
        [_collectionView registerNib:[UINib nibWithNibName:@"ImgAndTextCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
        
        //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView"];
        
        
        //4.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    }
    
    
    return _collectionView;
}
- (ScrollImage *)scrImage{
    if(!_scrImage){
        UIImage *image1 = [UIImage imageNamed:@"12.jpg"];
        UIImage *image2 = [UIImage imageNamed:@"19.jpg"];
        UIImage *image3 = [UIImage imageNamed:@"25.jpg"];
        UIImage *image4 = [UIImage imageNamed:@"29.jpg"];
        NSMutableArray *array = @[image1, image2, image3, image4].mutableCopy;
        _scrImage = [[ScrollImage alloc] initWithFrame:CGRectMake(0, 50, self.view.width/2+15, 130) withArray:array];
        _scrImage.backgroundColor = [UIColor blueColor];
    }
    return _scrImage;
}

- (TFNavView *)navView{
    if(!_navView){
        _navView = [TFNavView creatNavView];
        
        _navView.clearColor = YES;
    
    }
    return _navView;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

//    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.navigationItem setHidesBackButton:YES];
//      self.navigationController.navigationBar.hidden = YES;
//}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//      self.navigationController.navigationBar.hidden = NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.navView.title = @"个人中心";
    self.navigationController.navigationBar.hidden = YES;
 
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.labArray = @[
                      @[@{@"title":@"积分",@"num":@"-"},
                      @{@"title":@"资产.充值",@"num":@"-"},
                      @{@"title":@"优惠券",@"num":@"-"},
                      @{@"title":@"礼品",@"num":@"-"}
                      ],
                      
                      @[@{@"title":@"失物招领公益平台",@"img":@"-"},
                        @{@"title":@"废品收购",@"img":@"-"},
                        @{@"title":@"打印/复印",@"img":@"-"}, //打印照片参考趣印 有福 口袋冲印 app
                        @{@"title":@"噪声检测",@"img":@"-"},
                        @{@"title":@"iBeacon",@"img":@"-"}
                        ],
                      
                    @[@{@"title":@"我的地址",@"img":@"-"},
                      @{@"title":@"客服与帮助",@"img":@"-"},
                      @{@"title":@"帮助中心",@"img":@"-"},
                      @{@"title":@"签到惊喜",@"img":@"-"},
                      
                      @{@"title":@"客户服务",@"img":@"-"},
                      @{@"title":@"我的收藏",@"img":@"-"},
                      @{@"title":@"欢迎评分",@"img":@"-"},
                      @{@"title":@"意见反馈",@"img":@"-"},
                      
                      @{@"title":@"每月账本",@"img":@"-"}, //详情见 柠檬记账 小程序
                                                         // 拓展项目，校园记账 自动生成
                      @{@"title":@"关于我们",@"img":@"-"},
                      @{@"title":@"设置",@"img":@"-"},
                    
                      ],
                      
                      @[ @{@"title":@"果园兼职",@"img":@"-"},
                         @{@"title":@"校园合伙人",@"img":@"-"},
                         @{@"title":@"人人贡献者",@"img":@"-"},
                         @{@"title":@"面包猎人",@"img":@"-"}
                          ]
                ];
    

 
    [self.view addSubview:self.collectionView];
    
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    
       [self.view addSubview:self.navView];
    [self setGradualNavView:self.navView];
    
    NSLog(@"%@",self.navView);
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.labArray.count;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        NSArray *array = [self.labArray objectAtIndex:section];
        return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        MeCollectionViewCell *cell = (MeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
        
        //    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
        
        NSArray *array = self.labArray[indexPath.section];
        NSDictionary *dict = [array objectAtIndex:indexPath.row];
        cell.title.text = dict[@"title"];
        cell.number.text = dict[@"num"];
        cell.backgroundColor = [UIColor whiteColor];
//        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        return cell;
        
    }else{
        ImgAndTextCollectionViewCell *cell = (ImgAndTextCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        //    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
        
        NSArray *array = self.labArray[indexPath.section];
        NSDictionary *dict = [array objectAtIndex:indexPath.row];
        
        cell.title.text = dict[@"title"];
        cell.imgView.image = [UIImage imageNamed:dict[@"img"]];
        
//        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        cell.backgroundColor = [UIColor whiteColor];
        
        return cell;
    }
    return nil;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        CGFloat itemWidth = (self.view.width-3)/4;
        return CGSizeMake(itemWidth, itemWidth);
    }else {
        CGFloat itemWidth = (self.view.width-3)/4;
        return CGSizeMake(itemWidth, itemWidth+10);
    }
    
    return CGSizeZero;
}

//footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return CGSizeMake(collectionView.width, headerViewHeight);
    }else{
        return CGSizeMake(collectionView.width, 10);
    }
    
    return CGSizeZero;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *headerView = [UICollectionReusableView new];
    
    if(indexPath.section == 0){
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        [headerView addSubview:[[MeHeaderView alloc]initWithFrame:CGRectMake(0, 0, collectionView.width, headerViewHeight)]];
    }else{
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView" forIndexPath:indexPath];
        headerView.backgroundColor =[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
        UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
//        label.text = @"这是collectionView的头部";
        label.font = [UIFont systemFontOfSize:20];
        [headerView addSubview:label];
    }
    
    return headerView;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MeCollectionViewCell *cell = (MeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    NSString *msg = cell.botlabel.text;
    //    NSLog(@"%@",msg);
    
    //失物招领
    if([indexPath isEqual:[NSIndexPath indexPathForRow:0 inSection:1]]){
        LostViewController *lost = [[LostViewController alloc]init];
       
        [self.navigationController pushViewController:lost animated:YES];
    }
    else if ([indexPath isEqual:[NSIndexPath indexPathForRow:2 inSection:1]]){
        PrintPhotoViewController *print = [[PrintPhotoViewController alloc]init];
        [self.navigationController pushViewController:print animated:YES];
    }
    else if ([indexPath isEqual:[NSIndexPath indexPathForRow:3 inSection:1]]){
        NoiseViewController *print = [[NoiseViewController alloc]init];
        [self.navigationController pushViewController:print animated:YES];
    }
    else if ([indexPath isEqual:[NSIndexPath indexPathForRow:4 inSection:1]]){
        iBeaconViewController *iBeacon = [[iBeaconViewController alloc]initWithNibName:@"iBeaconViewController" bundle:nil];
        [self.navigationController pushViewController:iBeacon animated:YES];
    }
    
    else{
        UIViewController *controller = [[UIViewController alloc]init];
        controller.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    
}




#pragma mark - UITableViewDataSource

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.1;
//}
//
////- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
////    return @"充值有礼";
////}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
////- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
////
////
////    UIView *header = [[UIView alloc]init];
////    header.backgroundColor = [UIColor blueColor];
////    return header;
////}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 180;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if(indexPath.row == 0){
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
//        cell.textLabel.text = @"wj";
//        cell.backgroundColor = [UIColor redColor];
//
//
//
//        [cell.contentView addSubview:self.scrImage];
//        return cell;
//    }
//    return nil;
//}


@end
