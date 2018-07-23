//
//  LTPageViewTestOneVC.m
//  OCExample
//
//  LTPageViewTestOneVC.m
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

#import "LTPersonalMainPageTestVC.h"
#import "LTScrollView-Swift.h"

//#import "ShoppingCarData.h"
#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"


#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)

@interface LTPersonalMainPageTestVC () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;

@property (nonatomic,strong) TFShoppingIndexPath *selectIndexPath;

@property (nonatomic) CGFloat cashierDeskHeight;

@end

@implementation LTPersonalMainPageTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.selectIndexPath.titleIndex = self.titleIndex;

#warning 重要 必须赋值
    self.glt_scrollView = self.tableView;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//    [self.view addSubview:self.tableView];
//    self.tableView.tableFooterView = [[UIView alloc]init];
//    self.selectIndexPath.titleIndex = self.titleIndex;
//
//#warning 重要 必须赋值
//    self.glt_scrollView = self.tableView;
    
    
}
- (void)reloadData{
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     GoodModel *model = self.dataArray[indexPath.row];
    NSString *imgUrl = model.imgUrl;
    if([imgUrl isEqualToString:@""]){
        return tableView.estimatedRowHeight;
    }else{
        return 140.f;
    }
    
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      GoodModel *model = self.dataArray[indexPath.row];
    NSString *imgUrl = model.imgUrl;

    ShoppingTableViewCell *shoppingCell = nil;

    if([imgUrl isEqualToString:@""]){
        ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];


        cell.title.text = model.title;
        cell.content.text = model.content;

        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
        shoppingCell = cell;
    }else{
        ShoppingListImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListImageCell"];


        cell.title.text = model.title;
        cell.content.text = model.content;
        cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
        shoppingCell = cell;
    }

    if([self.delegate respondsToSelector:@selector(TFShoppingListWithTableView:cell:cellForRowAtIndexPath:data:)]){
        [self.delegate TFShoppingListWithTableView:tableView cell:shoppingCell cellForRowAtIndexPath:indexPath data:model];
    }

//         [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];



    return shoppingCell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
          GoodModel *model = self.dataArray[indexPath.row];
    
        ShoppingTableViewCell *shoppingCell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectIndexPath.rowIndex = indexPath.row;
    
    if([self.delegate respondsToSelector:@selector(TFShoppingListWithTableView:cell:didSelectRowAtIndexPath:data:)]){
        [self.delegate TFShoppingListWithTableView:tableView cell:shoppingCell didSelectRowAtIndexPath:self.selectIndexPath data:model];
    }

}
- (TFShoppingIndexPath *)selectIndexPath{
    if(!_selectIndexPath){
        _selectIndexPath = [[TFShoppingIndexPath alloc]init];
    }
    return _selectIndexPath;
}
- (UITableView *)tableView {
    if (!_tableView) {
        CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
        //这个44为导航高度
        CGFloat Y = statusBarH + 44;
        //这个44为切换条的高度
        CGFloat H = kIPhoneX ? (self.view.bounds.size.height - Y - 34 -44) : self.view.bounds.size.height - Y - 44;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, H-self.cashierDeskHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListImageCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListImageCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListTextCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListTextCell"];
    }
    return _tableView;
}

- (void)showCashierDeskWithHeight:(CGFloat)height{
    self.cashierDeskHeight = height;
    CGRect frame = self.tableView.frame;
    _tableView.frame = CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,frame.size.height-height);
}

- (void)hienCashierDesk{
    CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
    //这个44为导航高度
    CGFloat Y = statusBarH + 44;
    //这个44为切换条的高度
    CGFloat H = kIPhoneX ? (self.view.bounds.size.height - Y - 34 -44) : self.view.bounds.size.height - Y - 44;
    _tableView.frame = CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, H);
}
@end

@implementation TFShoppingIndexPath

@end
