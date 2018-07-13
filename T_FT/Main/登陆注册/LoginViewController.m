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
#import "TFVerification.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *list;

//判断是手机号登录/注册  还是账号密码登录
@property (nonatomic) BOOL isPhoneNumberLogin;

@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UIButton *eye;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIView *VlineNearForgetPwd;
@property (weak, nonatomic) IBOutlet UIButton *loginOrRegisterBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLab.text = self.loginOrRegisterBtn.titleLabel.text;
    self.list = [[NSMutableArray alloc] initWithCapacity:0];
    self.navigationController.navigationBar.hidden = YES;
//    //申请访问通讯录权限
//    [self requestAuthorizationForAddressBook];
//
//    //获得 通讯录内容
//    [self getmyAddressbook];
    
    
    
    self.loginBtn.layer.cornerRadius = self.loginBtn.height/2.2;
    
   //textfield输入的时候 右侧显示删除按钮
    self.userText.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.pwdText.clearButtonMode=UITextFieldViewModeWhileEditing;
    //关闭键盘上方联想功能
    self.userText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.pwdText.autocorrectionType = UITextAutocorrectionTypeNo;
    //点击背景 取消键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClick:)];
    [self.view addGestureRecognizer:tap];
    
    
    [self verificationCodeLogin:self.loginOrRegisterBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfieldChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

- (void)textfieldChanged:(NSNotification *)notification{
    UITextField *textField=[notification object];
    
    if([self.titleLab.text isEqualToString:@"短信验证码登录/注册"] && [textField isEqual:self.pwdText]){
        
        if(textField.text.length == 3){
            textField.text = [NSString stringWithFormat:@"%@ ",textField.text];
        }
        else if(textField.text.length > 4 && textField.text.length < 8){
   
                NSString *first = [textField.text componentsSeparatedByString:@" "][0];
                NSString *second = [textField.text componentsSeparatedByString:@" "][1];
          
           
            
            textField.text = [NSString stringWithFormat:@"%@ %@",first,second];
        }else if (textField.text.length == 8){
            NSString *first = [textField.text componentsSeparatedByString:@" "][0];
            NSString *second = [textField.text componentsSeparatedByString:@" "][1];
          textField.text = [NSString stringWithFormat:@"%@ %@ ",first,second];
        }else if (textField.text.length > 9 && textField.text.length <=12){
            
            NSString *first = [textField.text componentsSeparatedByString:@" "][0];
            NSString *second = [textField.text componentsSeparatedByString:@" "][1];
            NSString *third = [textField.text componentsSeparatedByString:@" "][2];
            
            
            textField.text = [NSString stringWithFormat:@"%@ %@ %@",first,second,third];
        }else if (textField.text.length > 13){
            textField.text = [NSString stringWithFormat:@"%@",[textField.text substringToIndex:13]];
        }
        
    }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    
    if([self.titleLab.text isEqualToString:@"账号密码登录"]){
       TFVerificationLog *log = [TFVerification verfication:self.userText.text passwd:self.pwdText.text];
        
        if(log.code == TFLoginLogCodeForCorrect){
            //用户名和密码 验证通过
            
        }else{
            //用户名和密码 验证失败
        }
        
        
    }else if ([self.titleLab.text isEqualToString:@"短信验证码登录/注册"]){
        
        //验证手机号是否正确
        if( [TFVerification checkTelNumber:self.pwdText.text]){
            //手机号格式 正确
        }else{
             //手机号格式 错误
        }
    }
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
//    if(self.navigationController){
//
//        [self.navigationController popViewControllerAnimated:YES];
//    }else{
//        [self dismissViewControllerAnimated:YES completion:^{
//
//        }];
//    }
}

//新用户注册
- (IBAction)newUserRegister:(id)sender {
    
    FingerprintViewController *finger = [[FingerprintViewController alloc]initWithDismissViewControllerAnimated:NO before:^{
        NSLog(@"指纹识别成功 do something 然后消失");
    }];
    [self.navigationController pushViewController:finger animated:NO];
    
}


- (IBAction)forgetPwd:(UIButton *)sender {
    
    if([sender.titleLabel.text isEqualToString:@"忘记密码"]){
        
    }else if ([sender.titleLabel.text isEqualToString:@"获取验证码"]){
        //验证手机号正确性
        
        //发送验证码
    }
}

- (IBAction)verificationCodeLogin:(UIButton *)sender {
    NSString *title =sender.titleLabel.text;
    
    //如果用户点击了【短信验证码登录/注册】
    if([title isEqualToString:@"短信验证码登录/注册"]){
        self.userText.text = @"中国(+86)";
        self.userText.userInteractionEnabled = NO;
        
        self.pwdText.placeholder = @"请输入手机号";
        self.pwdText.keyboardType = UIKeyboardTypeNumberPad;
    
        [self.forgetBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        self.eye.hidden = YES;
      
        self.VlineNearForgetPwd.hidden = YES;
        
        [sender setTitle:@"账号密码登录" forState:UIControlStateNormal];
        
         //如果用户点击了【账号密码登录】
    }else if ([title isEqualToString:@"账号密码登录"]){
        self.userText.text = @"";
        self.userText.placeholder = @"用户名/手机号";
        self.userText.userInteractionEnabled = YES;
        
         self.pwdText.placeholder = @"请输入密码";
         self.pwdText.keyboardType = UIKeyboardTypeDefault;
        
        [self.forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        
        self.eye.hidden = NO;
         self.VlineNearForgetPwd.hidden = NO;
         [sender setTitle:@"短信验证码登录/注册" forState:UIControlStateNormal];
    }
    
    self.pwdText.text = @"";
    self.titleLab.text = self.loginOrRegisterBtn.titleLabel.text;
    
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
