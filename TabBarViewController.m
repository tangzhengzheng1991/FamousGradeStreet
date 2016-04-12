//
//  TabBarViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "TabBarViewController.h"
#import "MainViewController.h"
#import "FindViewController.h"
#import "CouponViewController.h"
#import "MyInfoViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTabBarController];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTabBarController {
    NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    UIViewController *viewController = [[MainViewController alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigation.navigationBarHidden = YES;
    navigation.tabBarItem.title = @"首页";
    navigation.tabBarItem.image = [UIImage imageNamed:@"iconHomenormal.png"];
    navigation.tabBarItem.selectedImage = [UIImage imageNamed:@"iconHomeDown.png"];
    [viewControllers addObject:navigation];
    [viewController release];
    [navigation release];
    
    
    viewController = [[FindViewController alloc] init];
    navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    [viewControllers addObject:navigation];
    navigation.navigationBarHidden = YES;
    navigation.tabBarItem.title = @"发现";
    navigation.tabBarItem.image = [UIImage imageNamed:@"iconhappennormal.png"];
    navigation.tabBarItem.selectedImage = [UIImage imageNamed:@"iconhappendown.png"];
    [viewController release];
    [navigation release];
    
    
    viewController = [[CouponViewController alloc] init];
    navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    [viewControllers addObject:navigation];
    navigation.navigationBarHidden = YES;
    navigation.tabBarItem.title = @"劵";
    navigation.tabBarItem.image = [UIImage imageNamed:@"iconTicketNormal.png"];
    navigation.tabBarItem.selectedImage = [UIImage imageNamed:@"iconTicketdown.png"];
    [viewController release];
    [navigation release];
    
    
    viewController = [[MyInfoViewController alloc] init];
    navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    [viewControllers addObject:navigation];
    navigation.navigationBarHidden = YES;
    navigation.tabBarItem.title = @"我的";
    navigation.tabBarItem.image = [UIImage imageNamed:@"IconMyPageNormal.png"];
    navigation.tabBarItem.selectedImage = [UIImage imageNamed:@"IconMyPageDown.png"];
    [viewController release];
    [navigation release];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = viewControllers;
    tabBarController.tabBar.barTintColor = RGBA(79, 80, 84, 1);
    tabBarController.tabBar.alpha = 1;
    tabBarController.tabBar.selectedImageTintColor = [UIColor whiteColor];
    [self.view addSubview:tabBarController.view];
    [self addChildViewController:tabBarController];
    [viewControllers release];
    [tabBarController release];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
