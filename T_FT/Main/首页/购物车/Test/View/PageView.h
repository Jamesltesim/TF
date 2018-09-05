//
//  PageView.h
//  TTTT
//
//  Created by James on 2018/9/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewDelegate.h"
#import "ContentView.h"

@interface PageView : UIView

//@property (nonatomic,strong) NSArray *dataArray;


@property (nonatomic,weak) id<PageViewDelegate> delegate;

@property (nonatomic) CGFloat segmentViewHeight; //default 50


- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;

- (void)reloadData:(NSArray <NSDictionary *>*)dataArray;

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;

@end
