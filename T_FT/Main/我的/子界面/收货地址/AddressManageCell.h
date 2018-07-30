//
//  AdressManageCell.h
//  T_FT
//
//  Created by James on 2018/7/16.
//  Copyright © 2018年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddressManageCellDelegate;

@interface AddressManageCell : UITableViewCell

@property (nonatomic,weak) id<AddressManageCellDelegate>delegate;

@property (nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;


@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@property (weak, nonatomic) IBOutlet UIButton *eidtBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@end


@protocol AddressManageCellDelegate <NSObject>

- (void)defaultAction:(AddressManageCell *)cell index:(NSInteger)index;

- (void)editAction:(AddressManageCell *)cell index:(NSInteger)index;

- (void)cancelAction:(AddressManageCell *)cell index:(NSInteger)index;

@end
