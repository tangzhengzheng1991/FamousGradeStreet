//
//  RegisterViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    UITextField *_nicknameTF;
    UITextField *_pswTF;
}

@end

@implementation RegisterViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(242, 242, 242, 1);
    
    if (self.isPhoneCode) {
        [self phoneCode];// 手机号登录
    }else {
        [self registerVC];// 用户名登录
    }
    
}

#pragma mark Auto_Register--GOTO

- (void)registerVC
{
    UIImageView *imageBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 230)];
    imageBG.image = [UIImage imageNamed:@"aboutMplifeBg"];
    [self.view addSubview:imageBG];
    [imageBG release];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 30, 50, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *loginLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 290, 60)];
    loginLable.text = @"  账号\n  密码";
    loginLable.numberOfLines = 2;
    loginLable.textColor = [UIColor blackColor];
    loginLable.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loginLable];
    [loginLable release];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(60, 110, 245, 1)];
    lineView.backgroundColor = RGBA(186, 186, 186, 1);
    [self.view addSubview:lineView];
    [lineView release];
    
    _nicknameTF = [[UITextField alloc] initWithFrame:CGRectMake(65, 80, 230, 30)];
    _nicknameTF.placeholder = @"用户名/手机号/邮箱";
    [self.view addSubview:_nicknameTF];
    [_nicknameTF release];
    
    _pswTF = [[UITextField alloc] initWithFrame:CGRectMake(65, 110, 230, 30)];
    _pswTF.placeholder = @"输入您的密码";
    _pswTF.secureTextEntry = YES;
    [self.view addSubview:_pswTF];
    [_pswTF release];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(15, 160, 290, 30);
    [loginBtn setTitle:@"登\t\t录" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"subPageLogin_normal"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"subPageLogin_down"] forState:UIControlStateSelected];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame = CGRectMake(15, 200, 90, 30);
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(0, 240, 320, 30);
    registerBtn.backgroundColor = [UIColor whiteColor];
    [registerBtn setTitle:@"免费注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
}

#pragma mark - RegisterVCBottonClick

- (void)registerBtnClick:(UIButton *)registerBtn
{
   NSLog(@"registerBtn");
}

- (void)forgetBtnClick:(UIButton *)forgetBtn
{
    NSLog(@"forgetBtn");
}

- (void)loginBtnClick:(UIButton *)loginBtn
{
    NSLog(@"loginBtn");
    
    if ([_nicknameTF.text isEqualToString:@""] || [_pswTF.text isEqualToString:@""]) {
        NSLog(@"请输入....");
    }else{
        [HTTPRequestEnding userLoginRequestWithUsername:_nicknameTF.text password:_pswTF.text completion:^(BOOL succeed){
            SHOWALERT(@"您的APP无法授权,请到官网下载正版!");
        }];
    }
    
    
    
}

#pragma mark - PhoneCode--GOTO

- (void)phoneCode
{
    UIImageView *imageBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 230)];
    imageBG.image = [UIImage imageNamed:@"aboutMplifeBg"];
    [self.view addSubview:imageBG];
    [imageBG release];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 30, 50, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *phonenumber = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 290, 30)];
    phonenumber.text = @"  手机号";
    phonenumber.textColor = [UIColor blackColor];
    phonenumber.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phonenumber];
    [phonenumber release];
    
    UITextField *numberTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 80, 230, 30)];
    numberTF.placeholder = @"请输入您的手机号";
    [self.view addSubview:numberTF];
    [numberTF release];
    
    UILabel *phonecode = [[UILabel alloc] initWithFrame:CGRectMake(15, 130, 190, 30)];
    phonecode.text = @"  验证码";
    phonenumber.textColor = [UIColor blackColor];
    phonecode.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phonecode];
    [phonecode release];
    
    UITextField *codeTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 130, 130, 30)];
    codeTF.placeholder = @"输入短信验证码";
    [self.view addSubview:codeTF];
    [codeTF release];
    
    UIButton *sendcodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendcodeBtn.frame = CGRectMake(CGRectGetMaxX(phonecode.frame)+10, 130, 90, 30);
    sendcodeBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
    [sendcodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    sendcodeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [sendcodeBtn addTarget:self action:@selector(sendcodeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendcodeBtn];
    
    UIButton *confiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confiBtn.frame = CGRectMake(15, 180, 290, 30);
    [confiBtn setTitle:@"确认提交" forState:UIControlStateNormal];
    [confiBtn setBackgroundImage:[UIImage imageNamed:@"subPageLogin_normal"] forState:UIControlStateNormal];
    [confiBtn setBackgroundImage:[UIImage imageNamed:@"subPageLogin_down"] forState:UIControlStateSelected];
    [confiBtn addTarget:self action:@selector(confiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confiBtn];
    
    
    UIButton *mingpinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mingpinBtn.frame = CGRectMake(0, 240, 320, 30);
    mingpinBtn.backgroundColor = [UIColor whiteColor];
    [mingpinBtn setTitle:@"使用名品导购网账号登录>>" forState:UIControlStateNormal];
    [mingpinBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [mingpinBtn addTarget:self action:@selector(mingpinBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mingpinBtn];
    
    UILabel *favorable = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 320, 30)];
    favorable.text = @"登录后获取更多优惠信息!";
    favorable.textAlignment = NSTextAlignmentCenter;
    favorable.textColor = [UIColor blackColor];
    [self.view addSubview:favorable];
    [favorable release];
}

#pragma mark - PhoneCodeBottnClick

- (void)mingpinBtnClick:(UIButton *)mingpinBtn
{
    NSLog(@"mingpinBtn");
}

- (void)confiBtnClick:(UIButton *)confiBtn
{
    NSLog(@"confiBtn");
}

- (void)sendcodeBtnClick:(UIButton *)sendcodeBtn
{
    NSLog(@"sendcodeBtn");
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
