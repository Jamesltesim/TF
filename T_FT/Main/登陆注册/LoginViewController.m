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

#import "TFLocalHTMLViewController.h"
#import "FingerprintViewController.h"

@interface LoginViewController ()
@property (nonatomic,strong) NSMutableArray *list;
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UIButton *eye;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIView *VlineNearForgetPwd;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.list = [[NSMutableArray alloc] initWithCapacity:0];
    
    //申请访问通讯录权限
    [self requestAuthorizationForAddressBook];
    
    //获得 通讯录内容
    [self getmyAddressbook];
    
    
    
    self.loginBtn.layer.cornerRadius = self.loginBtn.height/2.2;
    NSLog(@"%lf",self.loginBtn.height);
    
   //textfield右侧输入的时候显示删除按钮
    self.userText.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.pwdText.clearButtonMode=UITextFieldViewModeWhileEditing;
    //关闭键盘上方联想功能
    self.userText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.pwdText.autocorrectionType = UITextAutocorrectionTypeNo;
    //点击背景 取消键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClick:)];
    [self.view addGestureRecognizer:tap];
    
    
    
}

//新用户注册
- (IBAction)newUserRegister:(id)sender {
    
    FingerprintViewController *finger = [[FingerprintViewController alloc]initWithDismissViewControllerAnimated:NO before:^{
        NSLog(@"指纹识别成功 do something 然后消失");
    }];
    [self.navigationController pushViewController:finger animated:NO];
    
}


- (IBAction)forgetPwd:(id)sender {
    

}

- (IBAction)verificationCodeLogin:(UIButton *)sender {
    NSString *title =sender.titleLabel.text;
    
    if([title isEqualToString:@"短信验证码登录"]){
        self.userText.text = @"中国(+86)";
        self.userText.userInteractionEnabled = NO;
        self.pwdText.placeholder = @"请输入手机号";
        
        self.eye.hidden = YES;
        self.forgetBtn.hidden = YES;
        self.VlineNearForgetPwd.hidden = YES;
        
        [sender setTitle:@"账号密码登录" forState:UIControlStateNormal];
    }else if ([title isEqualToString:@"账号密码登录"]){
        self.userText.text = @"";
        self.userText.placeholder = @"用户名/手机号";
        self.userText.userInteractionEnabled = YES;
        
         self.pwdText.placeholder = @"请输入密码";
        
        self.eye.hidden = NO;
        self.forgetBtn.hidden = NO;
         self.VlineNearForgetPwd.hidden = NO;
         [sender setTitle:@"短信验证码登录" forState:UIControlStateNormal];
    }
    
}
- (IBAction)eyeClick:(UIButton *)sender {
    if(sender.tag++%2){
         [sender setImage:[UIImage imageNamed:@"login_eye_close"] forState:UIControlStateNormal];
       
    }else{
        [sender setImage:[UIImage imageNamed:@"login_eye_open"] forState:UIControlStateNormal];
    }
}

- (void)viewClick:(UITapGestureRecognizer *)tap {
    if(self.userText.isFirstResponder) [self.userText resignFirstResponder];
     if(self.pwdText.isFirstResponder) [self.pwdText resignFirstResponder];
}

- (IBAction)policyAction:(id)sender {
    
    TFLocalHTMLViewController *htmlController = [[TFLocalHTMLViewController alloc]init];
    
    [self.navigationController pushViewController:htmlController animated:YES];
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
        //        NSLog(@"givenName=%@, familyName=%@", givenName, familyName);
        
        //        NSString *nameStr = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
        
        NSArray *phoneNumbers = contact.phoneNumbers;
        
        for (CNLabeledValue *labelValue in phoneNumbers) {
            // 2.1.获取电话号码的KEY
            //            NSString *phoneLabel = labelValue.label;
            
            // 2.2.获取电话号码
            CNPhoneNumber *phoneNumer = labelValue.value;
            NSString *phoneValue = phoneNumer.stringValue;
            
            //            NSLog(@" %@", phoneValue);
            
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
