//
//  PartimeTableViewCell.h
//  T_FT
//
//  Created by James on 2018/7/26.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartimeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *treatment;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *contact_info;
@property (weak, nonatomic) IBOutlet UILabel *contact_name;
@end
