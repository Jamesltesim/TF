//
//  LTPersonMainPageDemo.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/19.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "LTPersonMainPageDemo.h"
#import "LTPersonalMainPageTestVC.h"
#import "MJRefresh.h"


//#define RGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)
#define HeaderHeight 258.0f
#define NavHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44)

@interface LTPersonMainPageDemo () <LTSimpleScrollViewDelegate>

@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;

@property(strong, nonatomic) LTLayout *layout;


@property(assign, nonatomic) CGFloat currentProgress;
@end

@implementation LTPersonMainPageDemo

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = self.currentProgress;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18.0f]};
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
  
//    [self setupSubViews];
}





-(void)glt_scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"---> %lf", scrollView.contentOffset.y);
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat headerImageY = offsetY;
    CGFloat headerImageH = HeaderHeight - offsetY;
    if (offsetY <= 0.0) {
        self.navigationController.navigationBar.alpha = 0.0;
        self.currentProgress = 0.0;
    }else {
        headerImageY = 0;
        headerImageH = HeaderHeight;
        
        CGFloat adjustHeight = HeaderHeight - NavHeight;
        
        CGFloat progress = 1 - (offsetY / adjustHeight);
        self.navigationController.navigationBar.barStyle = progress > 0.5 ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
        
        self.navigationController.navigationBar.alpha = 1 - progress;
        self.currentProgress = 1 - progress;
    }
    CGRect headerImageFrame = self.headerImageView.frame;
    headerImageFrame.origin.y = headerImageY;
    headerImageFrame.size.height = headerImageH;
//    headerImageFrame.size.width = scrollView.frame.size.width -offsetY;
    self.headerImageView.frame = headerImageFrame;
}

-(LTSimpleManager *)managerView {
    if (!_managerView) {
    
        _managerView = [[LTSimpleManager alloc] initWithFrame:RECT_NONAVBAR_AND_NOTABBAR viewControllers:self.viewControllers titles:self.titles currentViewController:self layout:self.layout];
        
        /* 设置代理 监听滚动 */
        _managerView.delegate = self;
        
        /* 设置悬停位置 */
        _managerView.hoverY = NavHeight;
        
    }
    return _managerView;
}

-(UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.headerView.frame.size.width, HeaderHeight)];
        _headerImageView.image = [UIImage imageNamed:@"timg-2.jpeg"];
      
    }
    return _headerImageView;
}

-(UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, HeaderHeight)];
    }
    return _headerView;
}

-(LTLayout *)layout {
    if (!_layout) {
        _layout = [[LTLayout alloc] init];
        _layout.titleViewBgColor = [UIColor whiteColor];
        _layout.titleColor = THEME_FONT_COLOR_GRAY;
        _layout.titleSelectColor = THEME_FONT_COLOR_BLACK;
        _layout.bottomLineColor = THEME_COLOR_RED;
        _layout.isNeedScale = NO;
//        _layout.pageBottomLineHeight = 15;
        _layout.pageBottomLineColor = RGBA(231, 231, 231, 0.7);
//        _layout.sliderHeight = 60;
    }
    return _layout;
}


//- (NSArray <NSString *> *)titles {
//    if (!_titles) {
//        _titles = @[@"热门", @"精彩推荐", @"科技控", @"游戏", @"汽车", @"财经", @"搞笑", @"图片"];
//    }
//    return _titles;
//}


//-(NSArray <UIViewController *> *)viewControllers {
//    if (!_viewControllers) {
//        _viewControllers = [self setupViewControllers];
//    }
//    return _viewControllers;
//}
//
//
//-(NSArray <UIViewController *> *)setupViewControllers {
//    NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
//    [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        LTPersonalMainPageTestVC *testVC = [[LTPersonalMainPageTestVC alloc] init];
//        [testVCS addObject:testVC];
//    }];
//    return testVCS.copy;
//}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //侧滑出现的透明细节调整
    self.navigationController.navigationBar.alpha = self.currentProgress;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.alpha = 0;
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

