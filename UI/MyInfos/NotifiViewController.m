//
//  NotifiViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "NotifiViewController.h"

@interface NotifiViewController ()

@end

@implementation NotifiViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(221, 221, 224, 1);
    
    //jiefriend
    [self createNavigation];
    
}
- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    label.text = @"街友须知";
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
    
    UIImageView *friend = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 290)];
    friend.image = [UIImage imageNamed:@"jiefriend"];
    [self.view addSubview:friend];
    [friend release];
}
- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
    //    self.tabBarController.tabBar.hidden = NO;
}


@end
