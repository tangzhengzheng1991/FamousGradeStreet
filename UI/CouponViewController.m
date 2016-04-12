//
//  CouponViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "CouponViewController.h"
#import "BrandCouponTableView.h"
#import "SaleCouponTableView.h"
#import "EndCouponTableView.h"
#import "DetailViewController.h"
#import "DetailSaleController.h"
#import "DetailEndController.h"
#import "MBProgressHUD.h"
#import "YouCouponViewController.h"

@interface CouponViewController () <UIScrollViewDelegate,MBProgressHUDDelegate>{
    UIImageView *_selecteImage;
    UIScrollView *_scrollView;
    UIButton *_btn1;
    UIButton *_btn2;
    UIButton *_btn3;
    MBProgressHUD *_HUD;
    
    BrandCouponTableView *_brandCouponTable;
    SaleCouponTableView *_saleCouponTable;
    EndCouponTableView *_endCouponTable;
    
    BOOL isPush;
    UIView *_rightView;
    UIImageView *_selectImage1;
    UIImageView *_selectImage2;
    
}

@end

@implementation CouponViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [_HUD release];
    [_selecteImage release];
    [_scrollView release];
    [_brandCouponTable release];
    [_saleCouponTable release];
    [_endCouponTable release];
    [_rightView release];
    [_selectImage1 release];
    [_selectImage2 release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    
    [self createUIButton];
    [self createScrollView];
    [self createNavigation];
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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"名品劵";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    menuBtn.frame = CGRectMake(280, 25, 50, 30);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"rightMenuIcon.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(goToMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];
    
    
    _rightView =[[UIView alloc] initWithFrame:CGRectMake(320, 120, 120, self.view.bounds.size.height - 120)];
    _rightView.backgroundColor = RGBA(33, 33, 33, .9);
    [self.view addSubview:_rightView];
    
    _selectImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 60)];
    _selectImage2.image = [UIImage imageNamed:@"taskButtom.png"];
    [_rightView addSubview:_selectImage2];
    
    _selectImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 60)];
    _selectImage1.image = [UIImage imageNamed:@"ticketPageMenuBackBg.png"];
    [_rightView addSubview:_selectImage1];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(30, 10, 100, 40);
    [btn1 setTitle:@"我的优惠劵" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 100;
    [_rightView addSubview:btn1];
    
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 30, 30)];
    img1.image = [UIImage imageNamed:@"iconTicketdown.png"];
    [_rightView addSubview:img1];
    [img1 release];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(30, 70, 100, 40);
    [btn2 setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 200;
    [_rightView addSubview:btn2];
    
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(13, 77, 26, 26)];
    img2.image = [UIImage imageNamed:@"menuTwoDimensionalcode.png"];
    [_rightView addSubview:img2];
    [img2 release];
    
}

- (void)goToMenu {
    isPush =! isPush;
    
    if (isPush) {
        [UIView animateWithDuration:.4 animations:^{
            _rightView.frame = CGRectMake(200, 120, 120, self.view.bounds.size.height - 120);
        }];
    }else {
        [UIView animateWithDuration:.4 animations:^{
            _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
        }];
    }
}

//俩按钮点击事件
- (void)selectClick:(UIButton *)button {
    [UIView animateWithDuration:.4 animations:^{
        _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
    }];
    
    switch (button.tag) {
        case 100:
            [UIView animateWithDuration:.4 animations:^{
                _selectImage2.frame = CGRectMake(0, 0, 120, 60);
                _selectImage1.frame = CGRectMake(0, 0, 10, 60);
            }];
            YouCouponViewController *youCoupon = [[YouCouponViewController alloc] init];
            [self.navigationController pushViewController:youCoupon animated:YES];
            self.tabBarController.tabBar.hidden = YES;
            [youCoupon release];
            break;
        case 200:
#warning 扫描二维码…………
            
            [UIView animateWithDuration:.4 animations:^{
                _selectImage2.frame = CGRectMake(0, 60, 120, 60);
                _selectImage1.frame = CGRectMake(0, 60, 10, 60);
            }];
            break;
            
        default:
            break;
    }
}

#pragma mark - createUIButton

- (void)createUIButton {
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 35)];
    btnView.backgroundColor = RGBA(221, 221, 224, 1);
    [self.view addSubview:btnView];
    [btnView release];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 33, 320, 2)];
    imageView.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [btnView addSubview:imageView];
    [imageView release];
    
    _selecteImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 33, 107, 2)];
    _selecteImage.image = [UIImage imageNamed:@"progress.png"];
    [btnView addSubview:_selecteImage];
    
    
    _btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn1.frame = CGRectMake(0, 0, 107, 35);
    [_btn1 setTitle:@"商场/品牌劵" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn1.tag = 100;
    [btnView addSubview:_btn1];
    
    _btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn2.frame = CGRectMake(107, 0, 107, 35);
    [_btn2 setTitle:@"特卖劵" forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn2.tag = 200;
    [btnView addSubview:_btn2];
    
    _btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn3.frame = CGRectMake(214, 0, 107, 35);
    [_btn3 setTitle:@"已结束" forState:UIControlStateNormal];
    [_btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _btn3.tag = 300;
    [btnView addSubview:_btn3];
}

- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        case 100:
            [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [UIView animateWithDuration:.4 animations:^{
                _selecteImage.frame = CGRectMake(0, 33, 107, 2);
                _scrollView.contentOffset = CGPointMake(0, 0);
            }];
            break;
            
        case 200:
            [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [UIView animateWithDuration:.4 animations:^{
                _selecteImage.frame = CGRectMake(107, 33, 107, 2);
                _scrollView.contentOffset = CGPointMake(320, 0);
            }];
            break;
            
        case 300:
            [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [UIView animateWithDuration:.4 animations:^{
                _selecteImage.frame = CGRectMake(214, 33, 107, 2);
                _scrollView.contentOffset = CGPointMake(640, 0);
            }];
            break;
            
        default:
            break;
    }
}

#pragma mark - createScrollView

- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 99, 320, self.view.bounds.size.height - 99)];
    _scrollView.contentSize = CGSizeMake(320 * 3, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    _brandCouponTable = [[BrandCouponTableView alloc] initWithStyle:UITableViewStylePlain];
    _brandCouponTable.view.frame = CGRectMake(0, 0, 320, _scrollView.bounds.size.height);
    [_scrollView addSubview:_brandCouponTable.view];
    
    
    _brandCouponTable.completeNum = ^(int num) {
        DetailViewController *detail = [[DetailViewController alloc] init];
        detail.indexPathRow = num;
        detail.isShow = _isShow;
        [self.navigationController pushViewController:detail animated:YES];
        self.tabBarController.tabBar.hidden = YES;
        [detail release];
    };
    
    _saleCouponTable = [[SaleCouponTableView alloc] initWithStyle:UITableViewStylePlain];
    _saleCouponTable.view.frame = CGRectMake(320, 0, 320, _scrollView.bounds.size.height);
    [_scrollView addSubview:_saleCouponTable.view];
    
    _saleCouponTable.completeNum = ^(int num) {
        DetailSaleController *detailSale = [[DetailSaleController alloc] init];
        detailSale.indexPathRow = num;
        [self.navigationController pushViewController:detailSale animated:YES];
        self.tabBarController.tabBar.hidden = YES;
        [detailSale release];
    };
    
    _endCouponTable = [[EndCouponTableView alloc] initWithStyle:UITableViewStylePlain];
    _endCouponTable.view.frame = CGRectMake(640, 0, 320, _scrollView.bounds.size.height);
    [_scrollView addSubview:_endCouponTable.view];
    
    _endCouponTable.completeNum = ^(int num) {
        DetailEndController *detailEnd = [[DetailEndController alloc] init];
        detailEnd.indexPathRow = num;
        [self.navigationController pushViewController:detailEnd animated:YES];
        self.tabBarController.tabBar.hidden = YES;
        [detailEnd release];
    };
}

#warning 待处理scrollView的滑动……
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
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
