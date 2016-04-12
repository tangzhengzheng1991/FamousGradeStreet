//
//  BrandViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "BrandViewController.h"
#import "SearchViewController.h"
#import "MBProgressHUD.h"
#import "MoreBrandViewController.h"
#import "MoreBrandDetailController.h"

@interface BrandViewController () <UISearchBarDelegate,MBProgressHUDDelegate> {
    int i,j,k;
    UIButton *_button;
    UISearchBar *_searchBar;
    
    MBProgressHUD *_HUD;
}

@property (nonatomic, retain) NSMutableArray *recomsamllArray;
@property (nonatomic, retain) NSMutableArray *recombigArray;
@property (nonatomic, retain) NSMutableArray *brandListArray;

@property (nonatomic, retain) NSMutableArray *allBrandArray;

@end

@implementation BrandViewController

- (void)dealloc {
    self.recomsamllArray = nil;
    self.recombigArray = nil;
    self.brandListArray = nil;
    self.allBrandArray = nil;
    [_searchBar release];
    [_HUD release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    [self createNavigation];
    [self createMBProgressHUD];
}

#pragma mark - createScrollView

- (void)createScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64)];
    scrollView.contentSize = CGSizeMake(320, self.view.bounds.size.height * 1.15);
    [self.view addSubview:scrollView];
    
    
    Recomsamll *samll1 = [self.recomsamllArray objectAtIndex:i];
    Recomsamll *samll2 = [self.recomsamllArray objectAtIndex:k];
    
    UIButton *samllBtn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    samllBtn1.frame = CGRectMake(10, 10, 145, 100);
    [samllBtn1 setBackgroundImageWithURL:[NSURL URLWithString:samll1.img_url]];
    [samllBtn1 addTarget:self action:@selector(samllButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    samllBtn1.tag = 1;
    [scrollView addSubview:samllBtn1];
    
    UIButton *samllBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    samllBtn2.frame = CGRectMake(10, 115, 145, 100);
    [samllBtn2 setBackgroundImageWithURL:[NSURL URLWithString:samll2.img_url]];
    [samllBtn2 addTarget:self action:@selector(samllButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    samllBtn2.tag = 2;
    [scrollView addSubview:samllBtn2];
    
    
    Recombig *big = [self.recombigArray objectAtIndex:j];
    
    UIButton *bigBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bigBtn.frame = CGRectMake(165, 10, 145, 205);
    [bigBtn setBackgroundImageWithURL:[NSURL URLWithString:big.img_url]];
    [bigBtn addTarget:self action:@selector(samllButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    bigBtn.tag = 3;
    [scrollView addSubview:bigBtn];
    
    NSArray *imageArray = @[@"BrandCatory-0.png",@"BrandCatory-1.png",@"BrandCatory-2.png",@"BrandCatory-3.png",@"BrandCatory-4.png",@"BrandCatory-5.png",@"BrandCatory-6.png",@"BrandCatory-7.png",@"BrandCatory-8.png",@"BrandCatory-9.png",];
    for (int a = 0; a < 10; a++) {
        int p = a / 2;
        int q = a % 2;
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = CGRectMake(q * (145 + 10) + 10, p * (60 + 5) + 5 + 220, 145, 60);
        _button.tag = a + 1;
        [_button setBackgroundImage:[UIImage imageNamed:[imageArray objectAtIndex:_button.tag - 1]] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(btnsClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:_button];
        
        
        Result *result = [self.brandListArray objectAtIndex:a];
        Brand *brand1 = [result.brand objectAtIndex:0];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 48, 20)];
        if ([brand1.brand_name_zh isEqualToString:@""]) {
            label1.text = brand1.brand_name_en;
        }else {
            label1.text = brand1.brand_name_zh;
        }
        label1.font = [UIFont systemFontOfSize:13];
        label1.textColor = [UIColor lightGrayColor];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.adjustsFontSizeToFitWidth = YES;
        [_button addSubview:label1];
        [label1 release];
        
        
        Brand *brand2 = [result.brand objectAtIndex:1];
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(48, 40, 49, 20)];
        if ([brand2.brand_name_en isEqualToString:@""]) {
            label2.text = brand2.brand_name_zh;
        }else {
            label2.text = brand2.brand_name_en;
        }
        label2.font = [UIFont systemFontOfSize:13];
        label2.textColor = [UIColor lightGrayColor];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.adjustsFontSizeToFitWidth = YES;
        [_button addSubview:label2];
        [label2 release];
        
        Brand *brand3 = [result.brand objectAtIndex:2];
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(97, 40, 48, 20)];
        if ([brand3.brand_name_zh isEqualToString:@""]) {
            label3.text = brand3.brand_name_en;
        }else {
            label3.text = brand3.brand_name_zh;
        }
        label3.font = [UIFont systemFontOfSize:13];
        label3.textColor = [UIColor lightGrayColor];
        label3.textAlignment = NSTextAlignmentCenter;
        label3.adjustsFontSizeToFitWidth = YES;
        [_button addSubview:label3];
        [label3 release];
    }
}

- (void)samllButtonClick:(UIButton *)button {
    MoreBrandDetailController *moreBrandDetail = [[MoreBrandDetailController alloc] init];
    moreBrandDetail.isJump = YES;
    if (button.tag==1) {
        moreBrandDetail.samll = [self.recomsamllArray objectAtIndex:i];
    }else if (button.tag == 2) {
        moreBrandDetail.samll = [self.recomsamllArray objectAtIndex:k];
    }else {
        moreBrandDetail.samll = [self.recombigArray objectAtIndex:j];
    }
//    moreBrandDetail.btnIndex = button.tag;
    [self.navigationController pushViewController:moreBrandDetail animated:YES];
    [moreBrandDetail release];
}

- (void)btnsClick:(UIButton *)button {
    MoreBrandViewController *moreBrand = [[MoreBrandViewController alloc] init];
    moreBrand.brandIndex = button.tag - 1;
    [self.navigationController pushViewController:moreBrand animated:YES];
    [moreBrand release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createNavigation

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(50, 20, 260, 40)];
    _searchBar.placeholder = @"请输入品牌名称";
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.view addSubview:_searchBar];
}

- (void)goBack {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .4;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionPush;
    [self.view.layer addAnimation:animation forKey:@"animation"];
    
    self.tabBarController.tabBar.hidden = NO;
    self.view.hidden = YES;
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    searchBar.showsCancelButton = YES;
    for(id cancel in [searchBar subviews])
    {
        if([cancel isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)cancel;
            [button setTitle:@"取消"  forState:UIControlStateNormal];
        }
    }
    NSLog(@"shuould begin");
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"cancle clicked");
    _searchBar.text = @"";
    [_searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"did end");
    searchBar.showsCancelButton = NO;
}

//键盘搜索按钮按下时调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"shuould begin Search");
    SearchViewController *search = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
    [search release];
}

#pragma mark - MBProgressHUDDelegate

- (void)showSimple:(id)sender {
    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.delegate = self;
    [_HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (void)createMBProgressHUD {
    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.delegate = self;
    _HUD.labelText = @"loading";
    [_HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
}

- (void)myTask {
    sleep(2);
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    [_HUD removeFromSuperview];
    _HUD = nil;
    
    self.allBrandArray = [NSMutableArray array];
    
    [HTTPRequestEnding getRecomsamllComplete:^(NSMutableArray *recomsamllArray, NSMutableArray *recombigArray) {
        self.recomsamllArray = recomsamllArray;
        self.recombigArray = recombigArray;
        
        i = arc4random()% self.recomsamllArray.count;
        k = arc4random()% self.recomsamllArray.count;
        
        if (i == k) {
            k = arc4random()% self.recomsamllArray.count;
        }
        j = arc4random()% self.recombigArray.count;

        [HTTPRequestEnding getBrandListComplete:^(NSMutableArray *brandListArray) {
            self.brandListArray = brandListArray;
            [self createScrollView];
        }];
    }];
}

- (void)viewDidUnload {
	[super viewDidUnload];
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
