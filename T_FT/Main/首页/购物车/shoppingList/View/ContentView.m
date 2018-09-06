//
//  FirstView.m
//  TTTT
//
//  Created by James on 2018/9/3.
//  Copyright © 2018年 James. All rights reserved.
//

#import "ContentView.h"


@interface ContentView()



@end

@implementation ContentView

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier{
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
}

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray<GoodModel *> *)array segmentTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _dataArray = array;
        _tableView = [[TFShoppingTableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain segmentTitle:title];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListImageCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListImageCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ShoppingListTextCell" bundle:nil] forCellReuseIdentifier:@"ShoppingListTextCell"];
        
        [self addSubview:_tableView];
    }
    return self;
}

- (void)setIndex:(NSInteger)index{
    _index = index;
    _tableView.segmentIndex = index;
}

- (void)updateFrame:(CGRect)frame{
    _tableView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.frame = frame;
}

- (void)setFrame:(CGRect)frame{
    
    [super setFrame:frame];
    
    CGRect rect = _tableView.frame;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([self.delegate respondsToSelector:@selector(shoppingTableView:heightForRowAtIndexPath:)]){
        return [self.delegate shoppingTableView:self.tableView heightForRowAtIndexPath:indexPath];
    }else{
        return 0;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if([self.delegate respondsToSelector:@selector(shoppingTableView:numberOfRowsInSection:)]){
        return [self.delegate shoppingTableView:self.tableView numberOfRowsInSection:section];
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([self.delegate respondsToSelector:@selector(shoppingTableView:cellForRowAtIndexPath:)]){
        return [self.delegate shoppingTableView:self.tableView cellForRowAtIndexPath:indexPath];
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        GoodModel *model = self.dataArray[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"index ---> %ld    %@",indexPath.row,model.title];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([self.delegate respondsToSelector:@selector(shoppingTableView:didSelectRowAtIndexPath:)]){
        return [self.delegate shoppingTableView:self.tableView didSelectRowAtIndexPath:indexPath];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
