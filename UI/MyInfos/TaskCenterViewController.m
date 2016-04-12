//
//  TaskCenterViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "TaskCenterViewController.h"
#import "NotifiViewController.h"
#import "HistoryViewController.h"
#import "DrawMoneyViewController.h"

@interface TaskCenterViewController ()

@end

@implementation TaskCenterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = YES;
    
    [self creatNavBar];
    [self downBar];
    
}

- (void)creatNavBar
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBarOtherBgImage@2x"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    label.text = @"任务中心";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(10, 30, 23, 23);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
//    goBackBtn.transform = CGAffineTransformMakeRotation(M_PI);
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    // direction_icon_down@2x  direction_icon_normal@2x
    UIButton *direBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    direBtn.frame = CGRectMake(280, 25, 35, 35);
    [direBtn setBackgroundImage:[UIImage imageNamed:@"direction_icon_normal@2x"] forState:UIControlStateNormal];
    [direBtn setBackgroundImage:[UIImage imageNamed:@"direction_icon_down@2x"] forState:UIControlStateHighlighted];
    [direBtn addTarget:self action:@selector(direBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:direBtn];
    
}

// img_goodsDetail_buttom  btnDetail.png  btnGetMoney.png
- (void)downBar
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, VHEIGHT-64, 320, 64)];
    imageView.image = [UIImage imageNamed:@"img_goodsDetail_buttom.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    for (int i = 0; i<2; i++) {
        UIButton *moneyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        moneyBtn.frame = CGRectMake(0, 0, 40, 40);
        moneyBtn.center = CGPointMake(235+i*50, VHEIGHT-30);
        if (i==0) {
            [moneyBtn setBackgroundImage:[UIImage imageNamed:@"btnDetail.png"] forState:UIControlStateNormal];
        }else{
            [moneyBtn setBackgroundImage:[UIImage imageNamed:@"btnGetMoney.png"] forState:UIControlStateNormal];
        }
        moneyBtn.tag = i+1;
        [moneyBtn addTarget:self action:@selector(moneyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:moneyBtn];
    }
    UILabel *myLab = [[UILabel alloc] initWithFrame:CGRectMake(10, VHEIGHT-45, 90, 30)];
    myLab.text = @"我的奖金:";
    myLab.font = [UIFont boldSystemFontOfSize:20];
    myLab.textAlignment = NSTextAlignmentRight;
    myLab.textColor = [UIColor whiteColor];
    [self.view addSubview:myLab];
    [myLab release];
    
    UILabel *yuanLab = [[UILabel alloc] initWithFrame:CGRectMake(147, VHEIGHT-45, 30, 30)];
    yuanLab.text = @"元";
    yuanLab.font = [UIFont boldSystemFontOfSize:20];
    yuanLab.textAlignment = NSTextAlignmentLeft;
    yuanLab.textColor = [UIColor whiteColor];
    [self.view addSubview:yuanLab];
    [yuanLab release];
    
    UILabel *moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(102, VHEIGHT-45, 45, 30)];
    moneyLab.text = @"0";
    moneyLab.font = [UIFont boldSystemFontOfSize:20];
    moneyLab.textAlignment = NSTextAlignmentCenter;
    moneyLab.textColor = [UIColor whiteColor];
    [self.view addSubview:moneyLab];
    [moneyLab release];
}

- (void)moneyBtnClick:(UIButton *)btn // tag 1 2
{
    NSLog(@"btn.tag-->%ld",btn.tag);
//    NSNotification
    if (btn.tag == 1) {
        HistoryViewController *history = [[HistoryViewController alloc] init];
        [self.navigationController pushViewController:history animated:YES];
        [history release];
    }else{
        DrawMoneyViewController *money = [[DrawMoneyViewController alloc] init];
        [self.navigationController pushViewController:money animated:YES];
        [money release];
    }
    
    
}


- (void)direBtnClick
{
    NSLog(@"direBtnClick");
    NotifiViewController *notifi = [[NotifiViewController alloc] init];
    [self.navigationController pushViewController:notifi animated:YES];
    [notifi release];
    
    
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
