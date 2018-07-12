//
//  TFLocalHTMLViewController.m
//  T_FT
//
//  Created by James on 2018/7/12.
//  Copyright © 2018年 James. All rights reserved.
//

#import "TFLocalHTMLViewController.h"
#import <WebKit/WebKit.h>
@interface TFLocalHTMLViewController ()

@property (nonatomic,strong) WKWebView *webView;
@end

@implementation TFLocalHTMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐私政策";
    
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
     [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"file://%@",[[NSBundle mainBundle] pathForResource:@"policy" ofType:@"html"]]]]];
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
