//
//  TestViewController.m
//  T_FT
//
//  Created by James on 2018/9/5.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TestViewController.h"
#import "PageView.h"
#import "TFAPIForShoppingList.h"
#import "PageViewDelegate.h"

#import "ShoppingListTextCell.h"
#import "ShoppingListImageCell.h"

@interface TestViewController ()<TFAPICallBackProtocol,PageViewDelegate>

@property (nonatomic,strong)PageView *pageView;

@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSMutableArray *contentArray;


@end

@implementation TestViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.pageView];
    
    TFAPIForShoppingList *apiBanner = [[TFAPIForShoppingList alloc]init];
    apiBanner.delegate = self;
    [apiBanner loadData];
}

- (PageView *)pageView{
    if (!_pageView){
         _pageView = [[PageView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-100) dataArray:@[]];
        _pageView.delegate = self;
    }
    return _pageView;
}
#pragma mark ---  TFAPICallBackProtocol  ---
- (void)TFAPICallBackDidSuccess:(TFAPIBaseManager *)manager{
    NSDictionary *dataDict = manager.responseObject;
    NSArray *array = dataDict[@"data"];
    
    
    //    处理数据
    _titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    _contentArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (NSDictionary *dict in array){
        [_titleArray addObject:dict[@"title"]];
        [_contentArray addObject:dict[@"data"]];
    }
    
    [self.pageView reloadData:array];
}

- (void)TFAPICallBackDidFailed:(TFAPIBaseManager *)manager{
    
}

#pragma mark ---  PageViewDelegate  ---

- (CGFloat)shoppingTableView:(TFShoppingTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSArray *array = self.contentArray[tableView.segmentIndex];
    GoodModel *model = array[indexPath.row];
    NSString *imgUrl = model.imgUrl;
    if([imgUrl isEqualToString:@""]){
        return tableView.estimatedRowHeight;
    }else{
        return 140.f;
    }
}

- (NSInteger)shoppingTableView:(TFShoppingTableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *array = self.contentArray[tableView.segmentIndex];
    return array.count;
}

- (UITableViewCell *)shoppingTableView:(TFShoppingTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//
//    NSArray *array = self.contentArray[tableView.segmentIndex];
//    GoodModel *model = array[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"index ---> %ld    %@",indexPath.row,model.title];
//    return cell;
    
    NSArray *array = self.contentArray[tableView.segmentIndex];
    GoodModel *model = array[indexPath.row];
    NSString *imgUrl = model.imgUrl;
    
    ShoppingTableViewCell *shoppingCell = nil;
    
    ShoppingListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingListTextCell"];
    
    
    cell.title.text = model.title;
    cell.content.text = model.content;
    
    cell.price.text = [NSString stringWithFormat:@"%.2f",model.price];
    shoppingCell = cell;
    //
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
    
//    if([self.delegate respondsToSelector:@selector(TFShoppingListWithTableView:cell:cellForRowAtIndexPath:data:)]){
//        [self.delegate TFShoppingListWithTableView:tableView cell:shoppingCell cellForRowAtIndexPath:indexPath data:model];
//    }
//
//    [shoppingCell setGoodsCount:[ShoppingCarData countOfGood:model]];
    
    
    
    return shoppingCell;
    
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
