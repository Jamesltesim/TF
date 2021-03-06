//
//  HomeViewController.m
//  T_FT
//
//  Created by James on 2018/6/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "DrinksCollectionViewCell.h"
#import "FruitCollectionViewCell.h"
#import "BundlingCollectionViewCell_1.h"
#import "HomeFooterReusableView.h"

#import "UIScrollView+MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "HomeheaderReusableView.h"
#import "FloatingView.h"

#import "TFAPICenter.h"
#import "TFAPIForHomebanner.h"

#import "HomeNavView.h"

#import "ShoppingListController.h"



@interface HomeViewController ()<UICollectionViewDataSource,
                                 UICollectionViewDelegate,
                                 UICollectionViewDelegateFlowLayout,
                                 UIScrollViewDelegate,
                                 UITabBarControllerDelegate,
                                 TFAPICallBackProtocol>

@property (nonatomic,strong) SDCycleScrollView *bannerView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) FloatingView *floatView;
@property (nonatomic,strong) HomeNavView *navView;

@property (nonatomic,strong) ShoppingListController *shoppingController;


@end

@implementation HomeViewController{
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    UINavigationController *navController = (UINavigationController *)viewController;
    if([navController.visibleViewController isKindOfClass:[HomeViewController class]]){
        self.floatView.hidden = NO;
    }else{
        self.floatView.hidden = YES;
    }
}

#pragma -mark life cycle

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
  
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
      self.floatView.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
      self.floatView.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    [self.view addSubview:self.navView];
  
     self.navigationController.navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.delegate = self;
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // Hide the time
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // Hide the status
    header.stateLabel.hidden = YES;
    self.collectionView.mj_header = header;
    //
    //    // 马上进入刷新状态
    [self.collectionView.mj_header beginRefreshing];
    
    
    self.dataArray = @[
                        @[@{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"甜心大苹果",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                          @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                          @{@"name":@"甜心大苹果",@"price":@""},
                          @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""}
                         ],
                       
                       @[@{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""},
                         @{@"name":@"巨无霸超级新西兰阳光金果系列",@"price":@""}]];
    
    
    
    //    [self.view insertSubview:self.stretchView atIndex:0];
    
    
    //悬浮窗
    self.floatView = [[FloatingView alloc]initWithFrame:CGRectMake(kScreenWidth-80, kScreenHeight-150, 65, 65) mainImageName:@"timg1.png" bgcolor:[UIColor lightGrayColor] animationColor:[UIColor purpleColor]];
    
//    [self.tabBarController.view addSubview:self.floatView];
    
    __weak __typeof(self)weakSelf = self;
    self.floatView.callService = ^{
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拨打候鸟旅居网客服电话？" message:@"4000301679" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        UIAlertAction *defintAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//            UIApplication *app = [UIApplication sharedApplication];
//
//            NSString *strUrl = [NSString stringWithFormat:@"tel://4000301679"];
//
//            NSURL *url = [NSURL URLWithString:strUrl];
//
//            [app openURL:url ];
//        }];
//
//        [alert addAction:cancleAction];
//        [alert addAction:defintAction];
//        [strongSelf presentViewController:alert animated:YES completion:nil];
//        [strongSelf.navigationController pushViewController:self.shoppingListController animated:YES];
//        [strongSelf.navigationController pushViewController:[[TestViewController alloc]init] animated:YES];
    };

//    [TFAPICenter loadData:TFAPIRequestNameForHomeBannner delegate:weakSelf];
    TFAPIForHomebanner *apiBanner = [[TFAPIForHomebanner alloc]init];
    apiBanner.delegate = self;
    [apiBanner loadData];
}


#pragma mark - TFAPICallBackProtocol

- (void)TFAPICallBackDidSuccess:(TFAPIBaseManager *)manager{
    NSLog(@"%@ %@",NSStringFromSelector(_cmd),manager);
}

- (void)TFAPIWithHomeBanner:(TFAPIBaseManager *)manager success:(requestSuccessBlock)success failurere:(requestFailureBlock)failurere{
    
}

- (void)loadNewData
{
    // 1.添加假数据
    //    for (int i = 0; i<5; i++) {
    //        [self.data insertObject:MJRandomData atIndex:0];
    //    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    //    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        //        [tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.collectionView.mj_header endRefreshing];
    });
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    [self.navView scrollToChangeAlpha:scrollView.contentOffset.y];
    if((scrollView.contentOffset.y+STATUSVIEW_HEIGHT+CONTENT_HEIGHT_NO_BAR_HERGHT) > scrollView.contentSize.height){
        NSLog(@"到底部了");
        
        
        //        NSLog(@"%f",(scrollView.contentOffset.y+STATUSVIEW_HEIGHT+CONTENT_HEIGHT_NO_BAR_HERGHT) - scrollView.contentSize.height);
    }
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
    
    if(indexPath.section == 0){
    
//       BundlingCollectionViewCell_1 *cell = (BundlingCollectionViewCell_1 *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BundlingCollectionViewCell_1" forIndexPath:indexPath];
//        cell.backgroundColor = [UIColor yellowColor];
//        return cell;
//
//    }else if (indexPath.section == 1){
        DrinksCollectionViewCell *cell = (DrinksCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DrinksCollectionViewCell" forIndexPath:indexPath];
        
        
        NSArray *array = self.dataArray[indexPath.section];
        NSDictionary *dict = array[indexPath.row];
        
        cell.hint.text = @"热\n销\n万\n件";
        cell.youhui.text = @"限时特惠";
        cell.name.text = dict[@"name"];
        cell.detail.text = @"多汁脆嫩 浓郁甜心";
        
        
        
        NSString *price = @"¥189/22个";
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: price];
        [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0,  1)];
        NSArray *strArray = [price componentsSeparatedByString:@"/"];
        NSString *string0 = strArray[0];
        NSString *string1 = strArray[1];
        [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15.0f] range:NSMakeRange(string0.length+1,  string1.length)];
        //    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,  1)];
        cell.price.attributedText =  attributedStr;
        
        return cell;
    }
    
    else{
        FruitCollectionViewCell *cell = (FruitCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FruitCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
//        CGFloat height = 0.;
//        switch ([TFUtils deviceScreenSize]) {
//
//            case TFScreenSize_3_5:
//                height = 165;
//                break;
//            case TFScreenSize_4_0:
//                height = 145;
//                break;
//            case TFScreenSize_4_7:
//                height = 170;
//                break;
//            case TFScreenSize_5_5:
//                height = 200;
//                break;
//            case TFScreenSize_5_8:
//                height = 205;
//                break;
//            default:
//                height = 0.;
//                break;
//        }
//
//        return CGSizeMake(self.view.width, height);
//
//    }else if (indexPath.section == 1){
        CGFloat height = 0.;
        switch ([TFUtils deviceScreenSize]) {
                
            case TFScreenSize_3_5:
                height = 165;
                break;
            case TFScreenSize_4_0:
                height = 125;
                break;
            case TFScreenSize_4_7:
                height = 140;
                break;
            case TFScreenSize_5_5:
                height = 152;
                break;
            case TFScreenSize_5_8:
                height = 145;
                break;
            default:
                height = 0.;
                break;
        }
        
        return CGSizeMake(self.view.width-16, height);
    }
    
    else{
        CGFloat itemWidth = (self.view.width-8*4)/3.0 ;
        //        CGFloat itemWidth = (self.view.width-16)/2.0 - 3;
        return CGSizeMake(itemWidth, itemWidth+40);
    }
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
//    if(section == 0){
//       return UIEdgeInsetsMake(0, 0, 0, 0);
//    }
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
//    if(section == 0){
//        return 0.;
//    }
    return 5;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
//    if(section == 0){
//        return 0.;
//    }
    return 8;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    

    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
            UICollectionReusableView *headerView = nil;
        if(indexPath.section == 0){
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView" forIndexPath:indexPath];
            [headerView addSubview:self.bannerView];
            headerView.backgroundColor = [UIColor blueColor];

        }else{
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
            headerView.backgroundColor =[UIColor whiteColor];
            //        UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
            //        label.text = @"这是collectionView的头部";
            //        label.font = [UIFont systemFontOfSize:20];
            //        [headerView addSubview:label];
        }
        return headerView;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        if(indexPath.section == self.dataArray.count-1){
            HomeFooterReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomeFooterReusableView" forIndexPath:indexPath];
            return footer;
        }
    }
   
    
    return nil;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DrinksCollectionViewCell *cell = (DrinksCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self.navigationController pushViewController:self.shoppingController animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        return CGSizeMake(self.view.frame.size.width, 130);
    }
    return CGSizeMake(self.view.frame.size.width, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if(section == self.dataArray.count-1){
        return CGSizeMake(self.view.frame.size.width, 30);
    }
    return CGSizeZero;
}

#pragma mark get set

- (ShoppingListController *)shoppingController{
    if(!_shoppingController){
        _shoppingController = [[ShoppingListController alloc]init];
    }
    return _shoppingController;
}

- (HomeNavView *)navView{
    if(!_navView){
        _navView = [[HomeNavView alloc] initWithNoBackButton];
        [_navView addRightButtonWithTarget:self action:@selector(qrCode:) backgroundImage:[UIImage imageNamed:@""]];
//        [_navView addBackButtonWithTarget:self action:@selector(backTap:)];
        
    }
    return _navView;
}


- (void)qrCode:(UIButton *)sender{
    
}


- (void)createCollectionView{
    
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView的尺寸大小
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 130);
    //该方法也可以设置itemSize
    
    //2.初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:RECT_NONAVBAR_AND_TABBAR collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    //    _collectionView.contentOffset = CGPointMake(0, NAV_HEIGHT);
    _collectionView.contentInset = UIEdgeInsetsMake(-STATUSVIEW_HEIGHT, 0, 0, 0);
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    //    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [_collectionView registerNib:[UINib nibWithNibName:@"DrinksCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DrinksCollectionViewCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"FruitCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FruitCollectionViewCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"BundlingCollectionViewCell_1" bundle:nil] forCellWithReuseIdentifier:@"BundlingCollectionViewCell_1"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeheaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"index0_ReusableView"];
   [_collectionView registerNib:[UINib nibWithNibName:@"HomeFooterReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomeFooterReusableView"];
    
    //4.设置代理
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
    //    UIView *view = [[UIView alloc]initWithFrame:_collectionView.bounds];
    //    view.backgroundColor = [UIColor blueColor];
    //    _collectionView.backgroundView = view;
}

- (SDCycleScrollView *)bannerView{
    if(!_bannerView){
        // 情景二：采用网络图片实现
        NSArray *imagesURLStrings = @[
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                      ];
        
        // 情景三：图片配文字
        NSArray *titles = @[@"新建交流QQ群：185534916 ",
                            @"disableScrollGesture可以设置禁止拖动",
                            @"感谢您的支持，如果下载的",
                            @"如果代码在使用过程中出现问题",
                            @"您可以发邮件到gsdios@126.com"
                            ];
        
        // 网络加载 --- 创建带标题的图片轮播器
        _bannerView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.width, 130) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        _bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        //    cycleScrollView2.titlesGroup = titles;
        _bannerView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        _bannerView.autoScrollTimeInterval = 5;
        _bannerView.imageURLStringsGroup = imagesURLStrings;
        //         --- 模拟加载延迟
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        //        });
        
        
    }
    return _bannerView;
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

