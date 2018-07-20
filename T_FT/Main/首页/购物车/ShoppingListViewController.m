//
//  ShoppingListViewController.m
//  T_FT
//
//  Created by James on 2018/7/9.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"
#import "ShowShoppingCarView.h"
#import "ShoppingCarData.h"
#import "UIView+LXShadowPath.h"
#import "DeliveryPickView.h"

#import "LTPersonalMainPageTestVC.h"

@interface ShoppingListViewController ()<ShoppingCarDelegate,TFShoppingListDelegate>

@property (nonatomic,strong)ShowShoppingCarView *carView;
@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(nonatomic,strong) NSMutableArray *controllerDataArray;

@end

@implementation ShoppingListViewController

-(NSArray <UIViewController *> *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [self setupViewControllers];
    }
    return _viewControllers;
}


-(NSArray <UIViewController *> *)setupViewControllers {
    NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
    [self.controllerDataArray enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LTPersonalMainPageTestVC *testVC = [[LTPersonalMainPageTestVC alloc] init];
        testVC.dataArray = obj;
        testVC.delegate = self;
        [testVCS addObject:testVC];
    }];
    return testVCS.copy;
}

-(void)setupSubViews {
    
    [self.view addSubview:self.managerView];
    
    __weak typeof(self) weakSelf = self;
    
    //配置headerView
    [self.managerView configHeaderView:^UIView * _Nullable{
        [weakSelf.headerView addSubview:weakSelf.headerImageView];
        return weakSelf.headerView;
    }];
    
    //pageView点击事件
    [self.managerView didSelectIndexHandle:^(NSInteger index) {
        NSLog(@"点击了 -> %ld", index);
    }];
    
    
    
}
#pragma mark---  lefe cycle  ---

- (instancetype)initWithTitles:(NSArray<NSString *>*)titles{
    if(self = [super init]){
        self.titles = titles;
         self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
    
- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.hidesBottomBarWhenPushed = YES;
        }
        return self;
    }
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}



- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

-(void)tapGesture:(UITapGestureRecognizer *)gesture {
    DeliveryPickView *pickerView = [[DeliveryPickView alloc]init];
    pickerView.titleLable.text = @"送餐时间";
    [pickerView.confirmButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
     [pickerView.cancelButton setTitleColor:THEME_COLOR_RED forState:UIControlStateNormal];
    [pickerView showOn:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    
    GoodModel *model1 = [[GoodModel alloc] init];
    model1.goodId = @(1001);
    model1.title = @"Ferrero - Toffee Almond Roca Harmony";
    model1.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model1.imgUrl = @"www";
    model1.price = 300.00;
    
    GoodModel *model2 = [[GoodModel alloc] init];
    model2.goodId = @(1002);
    model2.title = @"Ferrero - Toffee Almond Roca Harmony";
    model2.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model2.imgUrl = @"www";
    model2.price = 199.00;
    
    GoodModel *model3 = [[GoodModel alloc] init];
    model3.goodId = @(1003);
    model3.title = @"Ferrero - Toffee Almond Roca Harmony";
    model3.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model3.imgUrl = @"www";
    model3.price = 168.00;
    
    GoodModel *model4 = [[GoodModel alloc] init];
    model4.goodId = @(1004);
    model4.title = @"Ferrero - Toffee Almond Roca Harmony";
    model4.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model4.imgUrl = @"";
    model4.price = 299.00;
    
    GoodModel *model5 = [[GoodModel alloc] init];
    model5.goodId = @(1005);
    model5.title = @"Ferrero - Toffee Almond Roca Harmony";
    model5.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model5.imgUrl = @"www";
    model5.price = 16.88;
    
    GoodModel *model6 = [[GoodModel alloc] init];
    model6.goodId = @(1006);
    model6.title = @"Ferrero - Toffee Almond Roca Harmony";
    model6.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model6.imgUrl = @"www";
    model6.price = 9.9;
    
    GoodModel *model7 = [[GoodModel alloc] init];
    model7.goodId = @(1007);
    model7.title = @"Ferrero - Toffee Almond Roca Harmony";
    model7.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model7.imgUrl = @"www";
    model7.price = 1.58;
    
    GoodModel *model8 = [[GoodModel alloc] init];
    model8.goodId = @(1008);
    model8.title = @"Ferrero - Toffee Almond Roca Harmony";
    model8.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model8.imgUrl = @"www";
    model8.price = 0.99;
    
    GoodModel *model9 = [[GoodModel alloc] init];
    model9.goodId = @(1009);
    model9.title = @"Ferrero - Toffee Almond Roca Harmony";
    model9.content = @"Scoops of Ferrero and Toffee Almond Roca Gelato topped with whipped cream,caramel syrup and brownie chunks";
    model9.imgUrl = @"www";
    model9.price = 1.99;
    
//   ,
//      @"":@[model1,model2,model3,model4,model5,model6,model7,model8,model9],
//      @"":@[model1,model2,model3,model4,model5,model6,model7,model8,model9],
//      @"超大杯柠檬":@[model1,model2,model3,model4,model5,model6,model7,model8,model9],
//      @"瞎扯淡":@[model1,model2,model3,model4,model5,model6,model7,model8,model9],
//      @"柠檬+耳朵+牛奶":@[model1,model2,model3,model4,model5,model6,model7,model8,model9],
//      @"牛奶+椰子+榴莲":@[model1,model2,model3,model4,model5,model6,model7,model8,model9]
//      }
    NSDictionary *dataDict = @{@"code":@"200",
                               @"data":@[ @{@"title":@"粽子+包子",@"data":[self ramdomArray]},
                                          @{@"title":@"海鲜大餐",@"data":[self ramdomArray]},
                                          @{@"title":@"酱油炒饭",@"data":[self ramdomArray]},
                                          @{@"title":@"超大杯柠檬",@"data":[self ramdomArray]},
                                          @{@"title":@"瞎扯淡",@"data":[self ramdomArray]},
                                          @{@"title":@"柠檬+耳朵+牛奶",@"data":[self ramdomArray]},
                                          @{@"title":@"牛奶+椰子+榴莲",@"data":[self ramdomArray]},
                                          @{@"title":@"粽子+包子",@"data":[self ramdomArray]}
                                          ]};
    
    NSArray *array = dataDict[@"data"];
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.controllerDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    for(NSDictionary *dict in array){
        [titleArray addObject:dict[@"title"]];
        [self.controllerDataArray addObject:dict[@"data"]];
    }
    
    self.titles = titleArray;

    [self setupSubViews];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    self.headerImageView.userInteractionEnabled = YES;
    [self.headerImageView addGestureRecognizer:gesture];
    
    
    //
    _carView = [[ShowShoppingCarView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-50-HOME_INDICATOR_HEIGHT, SCREEN_WIDTH, 50)];
    _carView.delegate = self;
    [_carView LX_SetShadowPathWith:[UIColor blackColor] shadowOpacity:0.01 shadowRadius:2 shadowSide:LXShadowPathTop shadowPathWidth:30];
    
    if([ShoppingCarData getCount]){
        [self showCashierDesk];
    }
}
- (NSArray *)ramdomArray{
    NSMutableArray *marr = [[NSMutableArray alloc]initWithCapacity:0];
    
    for(int i=0;i<(arc4random() % 30);i++){
        [marr addObject:[self ramdomModelWithIndex:i]];
    }
    return marr.copy;
}
- (GoodModel *)ramdomModelWithIndex:(int)index{
    GoodModel *model9 = [[GoodModel alloc] init];
    model9.goodId = @(1000+index);
    model9.title = [self randomCreatChinese:arc4random() % 20+2];
    model9.content = [self randomCreatChinese:arc4random() % 50+20];
    model9.imgUrl = (arc4random()%2 == 0? @"www":@"");
    model9.price = [self ramdomFloat];
    return model9;
}

- (CGFloat)ramdomFloat{
//    iOS随机生成浮点数小数
    int x = (arc4random() % 1000) + 10;
    int y = (arc4random() % 10) ;
    int z = (arc4random() % 10) ;
    NSString *str=[NSString stringWithFormat:@"%d.%d%d",x,y,z];
    CGFloat f =[str floatValue];
    
    return f;
}
- (NSMutableString*)randomCreatChinese:(NSInteger)count{
    
    NSMutableString*randomChineseString =@"".mutableCopy;
    
    for(NSInteger i =0; i < count; i++){
        
        NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        
        //随机生成汉字高位
        
        NSInteger randomH =0xA1+arc4random()%(0xFE - 0xA1+1);
        
        //随机生成汉子低位
        
        NSInteger randomL =0xB0+arc4random()%(0xF7 - 0xB0+1);
        
        //组合生成随机汉字
        
        NSInteger number = (randomH<<8)+randomL;
        
        NSData *data = [NSData dataWithBytes:&number length:2];
        
        NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
        
        [randomChineseString appendString:string];
        
    }
    
    return randomChineseString;
    
}

-(NSString *)randomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---  get set  ---



#pragma mark ---  内部方法  ---
- (void)showCashierDesk{
    if(!self.carView.superview){
        [self.view addSubview:self.carView];
//        CGRect rect = self.tableView.frame;
//        self.tableView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, SCREEN_HEIGHT-self.carView.height-self.scrollTitle.bottom - HOME_INDICATOR_HEIGHT);
        
        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
        
    }
}

- (void)hidenCashierDesk{
    if(self.carView.superview){
        [self.carView removeFromSuperview];
//        self.tableView.frame =CGRectMake(0, self.scrollTitle.bottom, self.view.width, self.view.height - self.scrollTitle.height-HOME_INDICATOR_HEIGHT);
    }
    
}
#pragma mark ---  TFShoppingListDelegate  ---

- (void)TFShoppingListWithTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@ : %ld",NSStringFromSelector(_cmd),indexPath.row);
}
#pragma mark ---  ShoppingCarDelegate  ---

- (void)cashierDeskTap{
    
}

- (void)scrollTitleView:(ScrollTitleView *)scrollView didSelectedAtTitle:(NSString *)title{
    NSLog(@"title:%@",title);
}

//#pragma mark ---  UItableViewDelegate  ---
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//     GoodModel *model = self.dataArray[indexPath.row];
//    NSString *imgUrl = model.imgUrl;
//    if([imgUrl isEqualToString:@""]){
//        return 120.f;
//    }else{
//        return 140.f;
//    }
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return self.dataArray.count;
//
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//      GoodModel *model = self.dataArray[indexPath.row];
//    NSString *imgUrl = model.imgUrl;
//
//    ShoppingTableViewCell *shoppingCell = nil;
//
//    if([imgUrl isEqualToString:@""]){
//        ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];
//
//
//        cell.title.text = model.title;
//        cell.content.text = model.content;
//
//        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
//        shoppingCell = cell;
//    }else{
//        ShoppingListImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListImageCell"];
//
//
//        cell.title.text = model.title;
//        cell.content.text = model.content;
//        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
//        shoppingCell = cell;
//    }
//
//
//         [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
//
//
//
//    return shoppingCell;
//
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//      GoodModel *model = self.dataArray[indexPath.row];
//
//    ShoppingTableViewCell *shoppingCell = [tableView cellForRowAtIndexPath:indexPath];
//
//    //如果需要选择辅食 就弹出新界面
//    if(model.isHaveSlideFood){
//
//    }else{
////        否则 就更新购物篮
//
//        [self showCashierDesk];
//
//        [ShoppingCarData addGood:model];
//        [self.carView setNumber:[ShoppingCarData getCount] price:[ShoppingCarData getTotalPrices]];
//    }
//
//
//
//    [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
//    [ShoppingCarData showOrder];
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
