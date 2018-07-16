//
//  FeedbackViewController.m
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITextViewDelegate>

@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIButton *submit;

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView.title = @"意见反馈";
    
    // 初始化控件
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10,self.navView.bottom+10,self.view.frame.size.width-20,self.view.height/10*4)];
    self.textView .layer.cornerRadius = 4;
    self.textView .layer.masksToBounds = YES;
    self.textView .delegate = self;
    self.textView.layer.borderWidth = 1;
//    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.4] CGColor];
    //加下面一句话的目的是，是为了调整光标的位置，让光标出现在UITextView的正中间
//    self.textView.textContainerInset = UIEdgeInsetsMake(10,0, 0, 0);
    [self.view addSubview:self.textView ];
    
    _submit  = [UIButton buttonWithType:UIButtonTypeCustom];
    _submit.frame = CGRectMake(self.textView.left, self.textView.bottom+20, self.textView.width, 50);
    [_submit setTitle:@"提交赢红包" forState:UIControlStateNormal];
    [_submit addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    [_submit setBackgroundColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1]];
    [self.view addSubview:_submit];
    
    
    
}

- (void)textViewDidChange:(UITextView *)textView{
    

    if(textView.text.length > 0 ){
        if(![[textView.text substringToIndex:1] isEqualToString:@"\n"]){
             [_submit setBackgroundColor:[UIColor colorWithRed:234/255.0 green:52/255.0 blue:107/255.0 alpha:1]];
        }else{
            textView.text = [textView.text substringToIndex:textView.text.length-1];
        }
       
    }
}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
//        //在这里做你响应return键的代码
//        [textView resignFirstResponder];
//        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
//    }
//    return YES;
//}

- (void)submit:(UIButton *)dender {
    
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
