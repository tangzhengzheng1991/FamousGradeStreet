//
//  HistoryViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tabBarController.tabBar.hidden = YES;
    
    [self creatNavBar];
    [self animationPointOut];
}

- (void)creatNavBar
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBarOtherBgImage@2x"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    label.text = @"获奖历史";
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
}

- (void)animationPointOut
{
    UIImageView *picImage = [[UIImageView alloc] initWithFrame:CGRectMake(110, 140, 120, 110)];
    picImage.image = [UIImage imageNamed:@"NoInformationBg.png"];
    [self.view addSubview:picImage];
    [picImage release];
    
    UILabel *picLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, 320, 30)];
    picLab.text = @"很遗憾,没有找到你想要的东东!";
    picLab.textAlignment = NSTextAlignmentCenter;
    picLab.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:picLab];
    [picLab release];
}



- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
