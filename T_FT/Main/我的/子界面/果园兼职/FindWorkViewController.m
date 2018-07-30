//
//  FindWorkViewController.m
//  T_FT
//
//  Created by James on 2018/7/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import "FindWorkViewController.h"
#import "PartimeTableViewCell.h"

@interface FindWorkViewController ()

@end

@implementation FindWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"PartimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"PartimeTableViewCell"];
    
    
    self.dataArray = @[@{@"name":@"Android开发工程师",
                         @"treatment":@"25K-50K",
                         @"address":@"北京 | 3-5年 | 本科",
                         @"date":@"发布于昨天",
                         @"contact_name":@"黄珍",
                         @"contact_info":@"腾讯hr",
                         @"desc":@"工作职责：\n1、根据公司要求独立完成基于Android系统平台进行应用程序开发设计、调试工作；\n2、根据项目任务计划独立按时完成软件高质量编码和测试工作；\n3、规范文档的编写、维护，以及其他与项目相关工作；\n\n工作要求：\n1、本科以上学历，计算机相关专业，有扎实的Java语言基础；\n2、三年以上Android项目开发经验，5年手机开发经验；\n3、熟悉Android框架及各种特性，熟悉面向对象编程；\n4、熟悉网络编程、安卓UI框架及相关开发工具；\n5、熟悉Android的线程机制，能够熟练使用各种安悉Android系统的线程类，及service、广播等；\n6、熟悉SVN或Git等相关的代码管理工具；\n7、熟练掌握UDP/TCP/IP、http等网络协议，精通协议设计；\n8、精通移动客户端程序设计方法以及安全的应用层协议设计；\n9、熟悉常用的设计模式，有大型终端软件架构能力，有上线产品者优先。"},
                       
                       @{@"name":@"Android开发工程师",
                         @"treatment":@"25K-50K",
                         @"address":@"北京 | 3-5年 | 本科",
                         @"date":@"发布于昨天",
                         @"contact_name":@"黄珍",
                         @"contact_info":@"腾讯hr",
                         @"desc":@"工作职责：\n1、根据公司要求独立完成基于Android系统平台进行应用程序开发设计、调试工作；\n2、根据项目任务计划独立按时完成软件高质量编码和测试工作；\n3、规范文档的编写、维护，以及其他与项目相关工作；\n\n工作要求：\n1、本科以上学历，计算机相关专业，有扎实的Java语言基础；\n2、三年以上Android项目开发经验，5年手机开发经验；\n3、熟悉Android框架及各种特性，熟悉面向对象编程；\n4、熟悉网络编程、安卓UI框架及相关开发工具；\n5、熟悉Android的线程机制，能够熟练使用各种安悉Android系统的线程类，及service、广播等；\n6、熟悉SVN或Git等相关的代码管理工具；\n7、熟练掌握UDP/TCP/IP、http等网络协议，精通协议设计；\n8、精通移动客户端程序设计方法以及安全的应用层协议设计；\n9、熟悉常用的设计模式，有大型终端软件架构能力，有上线产品者优先。"}];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PartimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PartimeTableViewCell"];
    NSDictionary *dict = self.dataArray[indexPath.row];
    cell.name.text = dict[@"name"];
    cell.treatment.text = dict[@"treatment"];
    cell.date.text = dict[@"date"];
    cell.address.text = dict[@"address"];
    cell.contact_name.text = dict[@"contact_name"];
    cell.contact_info.text = dict[@"contact_info"];
    
    cell.desc.text = dict[@"desc"];
    
    return cell;
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
