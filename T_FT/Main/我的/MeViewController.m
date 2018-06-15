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

@interface MeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    
    CGFloat headerViewHeight;
}


@property (nonatomic,strong) ScrollImage *scrImage;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *labArray;


@end

@implementation MeViewController

static NSString *iden = @"cell";

- (instancetype)init{
    if(self = [super init]){
        
    }
    return self;
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

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.labArray = @[@[@{@"title":@"积分",@"num":@"-"},
                      @{@"title":@"资产.充值",@"num":@"-"},
                      @{@"title":@"优惠券",@"num":@"-"},
                      @{@"title":@"礼品",@"num":@"-"}
                      ],
                    @[@{@"title":@"我的地址",@"img":@"-"},
                      @{@"title":@"客服与帮助",@"img":@"-"},
                      @{@"title":@"帮助中心",@"img":@"-"},
                      @{@"title":@"签到惊喜",@"img":@"-"},
                      @{@"title":@"客户服务",@"img":@"-"},
                      @{@"title":@"我的收藏",@"img":@"-"},
                      @{@"title":@"欢迎评分",@"img":@"-"},
                      @{@"title":@"意见反馈",@"img":@"-"},
                      @{@"title":@"人人贡献者",@"img":@"-"},
                      @{@"title":@"校园合伙人",@"img":@"-"},
                      @{@"title":@"设置",@"img":@"-"}
                      ]
                      ];
    

//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.collectionView];
    
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
        
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        return cell;
        
    }else if(indexPath.section == 1){
        ImgAndTextCollectionViewCell *cell = (ImgAndTextCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        //    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
        
        NSArray *array = self.labArray[indexPath.section];
        NSDictionary *dict = [array objectAtIndex:indexPath.row];
        
        cell.title.text = dict[@"title"];
        cell.imgView.image = [UIImage imageNamed:dict[@"img"]];
        
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        
        return cell;
    }
    return nil;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        CGFloat itemWidth = (self.view.width)/4;
        return CGSizeMake(itemWidth, itemWidth);
    }else if (indexPath.section == 1){
        CGFloat itemWidth = (self.view.width)/4;
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
        return CGSizeMake(collectionView.width, 130);
    }else if (section == 1){
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
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *headerView = nil;
    headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    if(indexPath.section == 0){
        [headerView addSubview:[[MeHeaderView alloc]initWithFrame:CGRectMake(0, 0, collectionView.width, 130)]];
    }else{
        
        headerView.backgroundColor =[UIColor grayColor];
        UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
        label.text = @"这是collectionView的头部";
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
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -STATUSVIEW_HEIGHT-44, self.view.width, self.view.height) collectionViewLayout:layout];
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
    }
 
    
    return _collectionView;
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
