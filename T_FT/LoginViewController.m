//
//  LoginViewController.m
//  T_FT
//
//  Created by James on 2018/6/4.
//  Copyright © 2018年 James. All rights reserved.
//

#import "LoginViewController.h"

//通讯录
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBookDefines.h>
#import <AddressBook/ABRecord.h>
//#import "AddressBook.h"


@interface LoginViewController ()
@property (nonatomic,strong) NSMutableArray *list;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.list = [[NSMutableArray alloc] initWithCapacity:0];
    
    //申请访问通讯录权限
    [self requestAuthorizationForAddressBook];
    
    //获得 通讯录内容
       [self getmyAddressbook];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestAuthorizationForAddressBook {
    
    if ([[UIDevice currentDevice].systemVersion floatValue]>=9.0){
        
        CNAuthorizationStatus authorizationStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (authorizationStatus == CNAuthorizationStatusNotDetermined) {
            CNContactStore *contactStore = [[CNContactStore alloc] init];
            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (granted) {
                    [self getmyAddressbook];
                } else {
                    NSLog(@"授权失败, error=%@", error);
                }
            }];
        }
        
    }else
    {
//        [HTools showTextOnlyHud:@"请升级系统" delay:1.0];
    }
    
    
}

- (void)getmyAddressbook {
    CNAuthorizationStatus authorizationStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (authorizationStatus == CNAuthorizationStatusAuthorized) {
        NSLog(@"没有授权...");
    }
    
    
    // 获取指定的字段,并不是要获取所有字段，需要指定具体的字段
    NSArray *keysToFetch = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keysToFetch];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    
    [contactStore enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        NSLog(@"-------------------------------------------------------");
        
        NSString *givenName = contact.givenName;
        NSString *familyName = contact.familyName;
        NSLog(@"givenName=%@, familyName=%@", givenName, familyName);
        
//        NSString *nameStr = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
        
        NSArray *phoneNumbers = contact.phoneNumbers;
        
        for (CNLabeledValue *labelValue in phoneNumbers) {
            // 2.1.获取电话号码的KEY
//            NSString *phoneLabel = labelValue.label;
            
            // 2.2.获取电话号码
            CNPhoneNumber *phoneNumer = labelValue.value;
            NSString *phoneValue = phoneNumer.stringValue;
            
            NSLog(@" %@", phoneValue);
            
            [self.list addObject:@{@"givenName":givenName,
                                   @"familyName":familyName,
                                   @"phoneNumber":phoneValue
                                   }];
            
            
        }
        
//        [_myDict setObject:phoneNumber.stringValue forKey:nameStr];
        
        
        //    *stop = YES; // 停止循环，相当于break；
        
    }];
    
    
    NSLog(@"通讯录内容 ==== %@",self.list);
    
}

@end