//
//  KeyChain_ReadMe.c
//  T_FT
//
//  Created by James on 2018/7/13.
//  Copyright © 2018年 James. All rights reserved.
//


//第一步导入 头文件
#import <Security/Security.h>

//第二步 一定要在Capabilities中打开Keychain，


//保存 数据
//KeychainWrapper *wrapper = [[KeychainWrapper alloc] initWithSevice:kKeychainService account:self.accountField.text accessGroup:kKeychainAccessGroup];
//[wrapper savePassword:self.passwordField.text];

//读取数据
//NSArray *keychains = [KeychainWrapper passwordItemsForService:kKeychainService accessGroup:kKeychainAccessGroup];
//KeychainWrapper *wrapper = self.keychainWrappers[indexPath.row];
//cell.textLabel.text = wrapper.account;
//cell.detailTextLabel.text = [wrapper readPassword];
