//
//  StoreMoreBabyViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "StoreMoreBabyViewController.h"
#import "MenuMoreViewController.h"

@interface StoreMoreBabyViewController ()

@end

@implementation StoreMoreBabyViewController

- (void)dealloc
{
    self.searchName = nil;
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MenuMoreViewController *menuMore = [[MenuMoreViewController alloc] init];
    menuMore.view.frame = CGRectMake(0, 64, 320, VHEIGHT-64);
    menuMore.searchName = _searchName;
    [self.view addSubview:menuMore.view];
    [self addChildViewController:menuMore];
    [menuMore release];
    
    
    
    [self createNavigation];
    
}
- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    label.text = @"更多宝贝";
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
