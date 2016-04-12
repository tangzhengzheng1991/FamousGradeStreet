//
//  MyInfoViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MyselfManagerViewController.h"
#import "RegisterViewController.h"
#import "DrawView.h"
#import "NewGiftViewController.h"
#import "YouCouponViewController.h"
#import "MyUpBabyViewController.h"
#import "TaskCenterViewController.h"
#import "BabyViewController.h"
#import "ShopViewController.h"
#import "NeBrandViewController.h"
#import "MarketViewController.h"


@interface MyInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_titleS;
    
    UITextField *_numberTF;
    UITextField *_codeTF;
    
}

@end

@implementation MyInfoViewController

- (void)dealloc
{
    [_titleS release];
    [super dealloc];
}

- (void)viewDidLoad
{
#warning  目前为登陆状态!!!
    _isRegister = YES;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height+20) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:.5];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
    _tableView.tableHeaderView = [self ceateTableHead];
    // 通过滑动表退出键盘
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(320-50, 30, 50, 30);
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"SettingMyPage.png"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingBtn];
    
    _titleS = [[NSArray alloc] initWithObjects:@"使用名品导购账号登录",@"我的优惠券",@"我发布的宝贝",@"任务中心",@"新手包",@"收藏宝贝",@"关注店铺 ",@"关注品牌 ",@"关注商场", nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - 创建表头

- (UIView *)ceateTableHead
{
    UIView *viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    
    UIImageView *imageBG = [[UIImageView alloc] initWithFrame:viewHead.bounds];
    imageBG.image = [UIImage imageNamed:@"aboutMplifeBg"];
    [viewHead addSubview:imageBG];
    [imageBG release];
    
    // 登陆后就只剩下头像了
    
    if (_isRegister) {
        
        UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        headerBtn.frame = CGRectMake(120, 30, 85, 85);
        [headerBtn setBackgroundImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"userHeaderDefault"]];
        headerBtn.layer.cornerRadius = 85/2;
        headerBtn.clipsToBounds = YES;
        [headerBtn addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [viewHead addSubview:headerBtn];
        
        UILabel *hello = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 30)];
        hello.text = @"Casually";
        hello.textAlignment = NSTextAlignmentCenter;
        hello.textColor = [UIColor whiteColor];
        hello.font = [UIFont systemFontOfSize:20];
        [viewHead addSubview:hello];
        [hello release];
        
    }else {
    
    DrawView *number = [[DrawView alloc] initWithFrame:CGRectMake(15, 70, 165, 30)];
    number.backgroundColor = [UIColor clearColor];
    [viewHead addSubview:number];
    [number release];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 40, 30)];
    numberLabel.text = @"手机号";
    numberLabel.adjustsFontSizeToFitWidth = YES;
    numberLabel.textColor = [UIColor whiteColor];
    [viewHead addSubview:numberLabel];
    [numberLabel release];
    
    _numberTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(numberLabel.frame)+5, 70, 120, 30)];
    _numberTF.placeholder = @"输入手机号";
    _numberTF.font = [UIFont systemFontOfSize:12];
    _numberTF.keyboardType = UIKeyboardTypeNumberPad;
    [viewHead addSubview:_numberTF];
    [_numberTF release];
    
    
    DrawView *Code = [[DrawView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(number.frame)+10, 70, 115, 30)];
    Code.backgroundColor = [UIColor clearColor];
    [viewHead addSubview:Code];
    [Code release];
    
    UILabel *codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(number.frame)+15, 70, 40, 30)];
    codeLabel.text = @"验证码";
    codeLabel.adjustsFontSizeToFitWidth = YES;
    codeLabel.textColor = [UIColor whiteColor];
    [viewHead addSubview:codeLabel];
    [codeLabel release];
    
    _codeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(codeLabel.frame), 70, 70, 30)];
    _codeTF.placeholder = @"输入验证码";
    _codeTF.keyboardType = UIKeyboardTypeNumberPad;
    _codeTF.font = [UIFont systemFontOfSize:13];
//    codeTF.adjustsFontSizeToFitWidth = YES;
    [viewHead addSubview:_codeTF];
    [_codeTF release];
    
    
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    codeBtn.frame = CGRectMake(15, 110, 90, 30);
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [codeBtn setBackgroundImage:[UIImage imageNamed:@"subPageSendCode_normal"] forState:UIControlStateNormal];
    [codeBtn setBackgroundImage:[UIImage imageNamed:@"subPageSendCode_down"] forState:UIControlStateHighlighted];
    [codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewHead addSubview:codeBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(CGRectGetMaxX(codeBtn.frame)+10, 110, 190, 30);
    loginBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"subPageLogin_normal"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"subPageLogin_down"] forState:UIControlStateSelected];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewHead addSubview:loginBtn];
    
    }
    
    return [viewHead autorelease];
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        if (_isRegister) {
            cell.textLabel.text = @"欢迎登录名品街";
            cell.accessoryType = UITableViewCellAccessoryNone;
        }else {
            cell.textLabel.text = @"使用名品导购账号登录";
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                cell.textLabel.text = @"我的优惠券";
                cell.imageView.image = [UIImage imageNamed:@"pageCouponIcon"];}
                break;
            case 1:{
                cell.textLabel.text = @"我发布的宝贝";
                cell.imageView.image = [UIImage imageNamed:@"PagePublishCowryIcon"];}
                break;
            case 2:{
                cell.textLabel.text = @"任务中心";
                cell.imageView.image = [UIImage imageNamed:@"PageTaskIcon"];}
                break;
            case 3:{
                cell.textLabel.text = @"新手包";
                cell.imageView.image = [UIImage imageNamed:@"PageGiftIcon"];}
                break;
                
            default:
                break;}
    }else {
        switch (indexPath.row) {
            case 0:{
                cell.textLabel.text = @"收藏宝贝";
                cell.imageView.image = [UIImage imageNamed:@"PageFavCowryIcon"];}
                break;
            case 1:{
                cell.imageView.image = [UIImage imageNamed:@"PageFavShopIcon"];
                cell.textLabel.text = @"关注店铺 ";}
                break;
            case 2:{
                cell.imageView.image = [UIImage imageNamed:@"PageFacbrandIcon"];
                cell.textLabel.text = @"关注品牌 ";}
                break;
            case 3:{
                cell.imageView.image = [UIImage imageNamed:@"PageFacmarketIcon"];
                cell.textLabel.text = @"关注商场";}
                break;
                
            default:
                break;}
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {// 新手礼包 不管登录已否
        if (indexPath.row == 3) {
            NewGiftViewController *newGift = [[NewGiftViewController alloc] init];
            [self presentViewController:newGift animated:YES completion:nil];
            [newGift release];
        }else {
            if (!_isRegister) {// 没登录
                [self gotoPhoneCodeWith:YES];
            }else {// 已登录
                switch (indexPath.row) {
                    case 0:{
                        YouCouponViewController *youcoupon = [[YouCouponViewController alloc] init];
//                        youcoupon.tabBarController.tabBar.hidden = YES;
                        [self.navigationController pushViewController:youcoupon animated:YES];
                        [youcoupon release];
                    }
                        break;
                    case 1:{
                        //cell.textLabel.text = @"我发布的宝贝";
                        MyUpBabyViewController *myBaby = [[MyUpBabyViewController alloc] init];
//                        myBaby.tabBarController.tabBar.hidden = YES;
                        [self.navigationController pushViewController:myBaby animated:YES];
                        [myBaby release];
                        
                    }
                        break;
                    case 2:{
                        //cell.textLabel.text = @"任务中心";
                        TaskCenterViewController *task = [[TaskCenterViewController alloc] init];
//                        task.tabBarController.tabBar.hidden = YES;
                        [self.navigationController pushViewController:task animated:YES];
                        [task release];
                    }
                        break;
                        
                    default:
                        break;
                }

            }
        }
    }else if (!_isRegister) {// 没登录
        if (indexPath.section == 0) {
            [self gotoPhoneCodeWith:NO];
        }else{
            [self gotoPhoneCodeWith:YES];
        }
    }else {// 已登录
        if (indexPath.section == 0) {
            return;// 不可点击了
        }else {
            switch (indexPath.row) {
                case 0:{
                    //cell.textLabel.text = @"收藏宝贝";
                    BabyViewController *baby = [[BabyViewController alloc] init];
                    self.tabBarController.tabBar.hidden = YES;
                    [self.navigationController pushViewController:baby animated:YES];
                    [baby release];
                }
                    break;
                case 1:{
                    //cell.textLabel.text = @"关注店铺 ";
                    ShopViewController *baby = [[ShopViewController alloc] init];
                    self.tabBarController.tabBar.hidden = YES;
                    [self.navigationController pushViewController:baby animated:YES];
                    [baby release];
                }
                    break;
                case 2:{
                    //cell.textLabel.text = @"关注品牌 ";
                    NeBrandViewController *baby = [[NeBrandViewController alloc] init];
                    self.tabBarController.tabBar.hidden = YES;
                    [self.navigationController pushViewController:baby animated:YES];
                    [baby release];
                }
                    break;
                case 3:{
                    //cell.textLabel.text = @"关注商场";
                    MarketViewController *baby = [[MarketViewController alloc] init];
                    self.tabBarController.tabBar.hidden = YES;
                    [self.navigationController pushViewController:baby animated:YES];
                    [baby release];
                }
                    break;
                    
                default:
                    break;
            }
            
        }
    }
    
}

- (void)gotoPhoneCodeWith:(BOOL)isPhone
{
    RegisterViewController *phoneCode = [[RegisterViewController alloc] init];
    phoneCode.hidesBottomBarWhenPushed = YES;
    phoneCode.isPhoneCode = isPhone;
    
    [self.navigationController pushViewController:phoneCode animated:YES];
    [phoneCode release];
}

#pragma mark - ButtonClickEvent

- (void)headerBtnClick:(UIButton *)headerBtn
{
    NSLog(@"headerBtn");
    
    [self settingBtnClick:nil];
}

- (void)settingBtnClick:(UIButton *)settingBtn
{
    NSLog(@"settingBtn");
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    // 吸收
    animation.type = @"suckEffect";
    [self.view.layer addAnimation:animation forKey:@"animation"];
    
    MyselfManagerViewController *myself = [[MyselfManagerViewController alloc] init];
    myself.myInfoVC = self;
    [self.view addSubview:myself.view];
    [self addChildViewController:myself];
    [myself release];
    
    [self.tabBarController.tabBar setHidden:YES];
    
}

- (void)codeBtnClick:(UIButton *)codeBtn
{
    NSLog(@"codeBtn");
    
    if (_numberTF.text.length<11) {
        NSLog(@"请输入正确的手机号");
    }else{
        [HTTPRequestEnding sendCodeOrLoginWithType:0 phoneNumber:_numberTF.text phoneCode:@"" completion:^(BOOL succeed){
            SHOWALERT(@"您的APP无法授权,请到官网下载正版!");
        }];
    }
    
    
}

- (void)loginBtnClick:(UIButton *)loginBtn
{
    NSLog(@"loginBtn");
    if (_numberTF.text.length<11 || _codeTF.text.length<6) {
        NSLog(@"请输入正确的手机号或验证码");
    }else{
        [HTTPRequestEnding sendCodeOrLoginWithType:1 phoneNumber:_numberTF.text phoneCode:_codeTF.text completion:^(BOOL succeed){
            SHOWALERT(@"您的APP无法授权,请到官网下载正版!");
        }];
    }
    
}


@end
