//
//  OtherViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)dealloc
{
    [super dealloc];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 30, 50, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = _curTitle;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
