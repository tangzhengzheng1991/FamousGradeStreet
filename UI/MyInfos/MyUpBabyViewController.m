//
//  MyUpBabyViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MyUpBabyViewController.h"

@interface MyUpBabyViewController ()

@end

@implementation MyUpBabyViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = YES;
    
    
    [self creatNavBar];
    [self animationPointOut];
    
}

- (void)creatNavBar
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    label.text = @"我发布的宝贝";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
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
    picLab.text = @"真可惜,还没发布宝贝喔!";
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
