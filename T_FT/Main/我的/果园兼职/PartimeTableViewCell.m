//
//  PartimeTableViewCell.m
//  T_FT
//
//  Created by James on 2018/7/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import "PartimeTableViewCell.h"

@implementation PartimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.desc.text = @"工作职责：\n1、根据公司要求独立完成基于Android系统平台进行应用程序开发设计、调试工作；\n2、根据项目任务计划独立按时完成软件高质量编码和测试工作；\n3、规范文档的编写、维护，以及其他与项目相关工作；\n\n工作要求：\n1、本科以上学历，计算机相关专业，有扎实的Java语言基础；\n2、三年以上Android项目开发经验，5年手机开发经验；\n3、熟悉Android框架及各种特性，熟悉面向对象编程；\n4、熟悉网络编程、安卓UI框架及相关开发工具；\n5、熟悉Android的线程机制，能够熟练使用各种安悉Android系统的线程类，及service、广播等；\n6、熟悉SVN或Git等相关的代码管理工具；\n7、熟练掌握UDP/TCP/IP、http等网络协议，精通协议设计；\n8、精通移动客户端程序设计方法以及安全的应用层协议设计；\n9、熟悉常用的设计模式，有大型终端软件架构能力，有上线产品者优先。";
    
    self.desc.textColor = RGBA(127, 135, 146, 1);
    [self.desc changeLineSpaceWithSpace:6];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
