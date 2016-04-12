//
//  DrawMoneyViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "DrawMoneyViewController.h"

@interface DrawMoneyViewController ()

@end

@implementation DrawMoneyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(221, 221, 224, 1);
    [self createNavigation];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, VHEIGHT-64)];
    scrollView.contentSize = CGSizeMake(320, 600);
    [self.view addSubview:scrollView];
    [scrollView release];
}

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    label.text = @"提取现金";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(0, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
}
- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
    //    self.tabBarController.tabBar.hidden = NO;
}

@end
