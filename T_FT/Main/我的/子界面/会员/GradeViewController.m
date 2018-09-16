//
//  GradeViewController.m
//  T_FT
//
//  Created by James on 2018/7/30.
//  Copyright © 2018年 James. All rights reserved.
//

#import "GradeViewController.h"
#import "GradeCollectionViewCell.h"
#import "GradeCollectionReusableView.h"
#import "GradeHeaderView1.h"

@interface GradeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation GradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@[@{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"}],
                       
                       @[@{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"},
                         @{@"title":@"aaa"}]];
       [self createCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    return array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    GradeCollectionViewCell *cell = (GradeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"GradeCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = RANDOM_COLOR;
    
    NSArray *titleArray = self.dataArray[indexPath.section];
    NSDictionary *titleDict = titleArray[indexPath.row];
    
    cell.titleLab.text = titleDict[@"title"];
    return cell;

}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    return CGSizeMake(90, 130);
}

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
  return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
   return 0.;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if(section == 0){
        return 0.;
    }
    return 8;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        UICollectionReusableView *headerView = nil;
        if(indexPath.section == 0){
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GradeCollectionReusableView" forIndexPath:indexPath];
        
        }else if (indexPath.section == 1){
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GradeHeaderView1" forIndexPath:indexPath];
        }
        return headerView;
    
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
       
    }


    return nil;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GradeCollectionViewCell *cell = (GradeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    NSString *msg = cell.botlabel.text;
    //    NSLog(@"%@",msg);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if(section == 0){
        return CGSizeMake(self.view.frame.size.width, 230);
    }
    return CGSizeMake(self.view.frame.size.width, 50);
}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    if(section == self.dataArray.count-1){
//        return CGSizeMake(self.view.frame.size.width, 30);
//    }
//    return CGSizeZero;
//}

- (void)createCollectionView{
    
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView的尺寸大小
//    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 130);
    //该方法也可以设置itemSize
    
    //2.初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:RECT_NAVBAR_AND_TABBAR collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    //    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [_collectionView registerNib:[UINib nibWithNibName:@"GradeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GradeCollectionViewCell"];

    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [_collectionView registerNib:[UINib nibWithNibName:@"GradeCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GradeCollectionReusableView"];
     [_collectionView registerNib:[UINib nibWithNibName:@"GradeHeaderView1" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GradeHeaderView1"];
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView"];
//    [_collectionView registerNib:[UINib nibWithNibName:@"HomeFooterReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomeFooterReusableView"];
    
    //4.设置代理
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
    //    UIView *view = [[UIView alloc]initWithFrame:_collectionView.bounds];
    //    view.backgroundColor = [UIColor blueColor];
    //    _collectionView.backgroundView = view;
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
