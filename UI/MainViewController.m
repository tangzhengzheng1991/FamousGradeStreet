//
//  MainViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MainViewController.h"
#import "SaleViewController.h"
#import "BrandViewController.h"
#import "CouponSViewController.h"
#import "ShoppingViewController.h"
#import "SurpriseViewController.h"
#import "NearbyViewController.h"

#import "CouponViewController.h"
#import "CycleScrollView.h"
#import "MainDetailController.h"

FOUNDATION_EXPORT CGRect SETViewFrame(CGRect rect4 ,CGRect rect5) {
    int height=(int) [UIScreen mainScreen].bounds.size.height;
    
    if(height==480){
        //3.5寸
        return rect4;
    }else if (height==568){
        //4.0寸
        return rect5;
    }
    return rect4;
}

FOUNDATION_EXPORT NSString * SETImage(NSString * image){
    int height=(int) [UIScreen mainScreen].bounds.size.height;
    
    if(height==480){
        return image;
    }else if (height==568){
        return [NSString stringWithFormat:@"%@_iphone5",image];
    }
    return [NSString stringWithFormat:@"%@",image];
}

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width


@interface MainViewController ()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSTimer *_timer;
    
    CouponViewController *_coupon;
}

@property (nonatomic, retain) NSMutableArray *headScrollArray;
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, retain) CycleScrollView *mainScorllView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [_scrollView release];
    [_pageControl release];
    [_timer release];
    self.headScrollArray = nil;
    [_coupon release];
    self.mainScorllView = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    [self reloadScrollView];
    
    [self createButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createUIButton

- (void)createButton {
    //特卖
    UIButton *saleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saleBtn.frame = SETViewFrame(CGRectMake(15, 110, 160, 80), CGRectMake(15, 110, 160, 90));
    [saleBtn setBackgroundImage:[UIImage imageNamed:SETImage(@"saleListBtn_normal")] forState:UIControlStateNormal];
    saleBtn.tag = 100;
    [saleBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saleBtn];
    //品牌
    UIButton *brandBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    brandBtn.frame = SETViewFrame(CGRectMake(15, 195, 160, 60), CGRectMake(15, 220, 160, 70));
    [brandBtn setBackgroundImage:[UIImage imageNamed:SETImage(@"brandListbtn_normal")] forState:UIControlStateNormal];
    brandBtn.tag = 101;
    [brandBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:brandBtn];
    //劵
    UIButton *couponBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    couponBtn.frame = SETViewFrame(CGRectMake(15, 260, 160, 80), CGRectMake(15, 310, 160, 90));
    [couponBtn setBackgroundImage:[UIImage imageNamed:SETImage(@"ticketListbtn_normal")] forState:UIControlStateNormal];
    couponBtn.tag = 102;
    [couponBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:couponBtn];
    //商场
    UIButton *shoppingBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shoppingBtn.frame = SETViewFrame(CGRectMake(185, 110, 120, 145), CGRectMake(185, 110, 120, 180));
    [shoppingBtn setBackgroundImage:[UIImage imageNamed:SETImage(@"shopListBtn_normal")] forState:UIControlStateNormal];
    shoppingBtn.tag = 103;
    [shoppingBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shoppingBtn];
    //天天惊喜
    UIButton *surpriseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    surpriseBtn.frame = SETViewFrame(CGRectMake(185, 260, 120, 80), CGRectMake(185, 310, 120, 90));
    [surpriseBtn setBackgroundImage:[UIImage imageNamed:SETImage(@"activityListBtn_normal")] forState:UIControlStateNormal];
    surpriseBtn.tag = 104;
    [surpriseBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:surpriseBtn];
    //附近
    UIButton *nearbyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nearbyBtn.frame = SETViewFrame(CGRectMake(15, 350, 290, 70), CGRectMake(15, 420, 290, 90));
    [nearbyBtn setBackgroundImage:[UIImage imageNamed:SETImage(@"nearSearchBtn_normal")] forState:UIControlStateNormal];
    nearbyBtn.tag = 105;
    [nearbyBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nearbyBtn];
    
    UIImageView *imageGif = [[UIImageView alloc] initWithFrame:SETViewFrame(CGRectMake(264, 393, 28, 20), CGRectMake(274, 477, 29, 20))];
    imageGif.image = [UIImage imageNamed:@"iphone_shake.gif"];
    [self.view addSubview:imageGif];
    [imageGif release];
}

- (void)buttonClick:(UIButton *)button {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    switch (button.tag) {
        case 100:
            NSLog(@"特卖");
            animation.type = @"rippleEffect";//波纹
            SaleViewController *sale = [[SaleViewController alloc] init];
            self.tabBarController.tabBar.hidden = YES;
            [self.view addSubview:sale.view];
            [self addChildViewController:sale];
            [sale release];
            break;
        case 101:
            NSLog(@"品牌");
            animation.type = @"rippleEffect";//波纹
            BrandViewController *brand = [[BrandViewController alloc] init];
            self.tabBarController.tabBar.hidden = YES;
            [self.view addSubview:brand.view];
            [self addChildViewController:brand];
            [brand release];
            break;
        case 102:
            NSLog(@"劵");
            animation.type = @"rippleEffect";//波纹
            _coupon = [[CouponViewController alloc] init];
            _coupon.isShow = YES;
            self.tabBarController.tabBar.hidden = YES;
            [self.view addSubview:_coupon.view];
            [self addChildViewController:_coupon];
            
            UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
            [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
            [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            [_coupon.view addSubview:goBackBtn];
            
            [_coupon release];
            break;
        case 103:
            NSLog(@"商场");
            animation.type = @"rippleEffect";//波纹
            ShoppingViewController *shopping = [[ShoppingViewController alloc] init];
            self.tabBarController.tabBar.hidden = YES;
            [self.view addSubview:shopping.view];
            [self addChildViewController:shopping];
            [shopping release];
            break;
        case 104:
            NSLog(@"天天惊喜");
            SurpriseViewController *surprise = [[SurpriseViewController alloc] init];
            self.tabBarController.tabBar.hidden = YES;
            [self.navigationController pushViewController:surprise animated:YES];
            [surprise release];
            break;
        case 105:
            NSLog(@"附近");
            animation.type = @"pageUnCurl";//反翻页
            animation.subtype = kCATransitionFromLeft;
            
            NearbyViewController *nearby = [[NearbyViewController alloc] init];
            [self.view addSubview:nearby.view];
            [self addChildViewController:nearby];
            [nearby release];
            self.tabBarController.tabBar.hidden = YES;
            break;
        default:
            break;
    }
    [self.view.layer addAnimation:animation forKey:@"animation"];
}

- (void)goBack {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .4;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionPush;
    [self.view.layer addAnimation:animation forKey:@"animation"];
    
    self.tabBarController.tabBar.hidden = NO;
    _coupon.view.hidden = YES;
}


#pragma mark - createScrollView && UIScrollViewDelagate

- (void)reloadScrollView {
    [HTTPRequestEnding getHeadScrollComplete:^(NSMutableArray *headScrollArray) {
        self.headScrollArray = headScrollArray;
        
        [self createScrollView];
    }];
}

- (void)createScrollView {
    NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithCapacity:0];

    for (int i = 0; i < self.headScrollArray.count; i++) {
        HeadScroll *headScroll = [self.headScrollArray objectAtIndex:i];
        
        UIImageView* imgView = [[UIImageView alloc]initWithFrame:CGRectMake(320 * i, 0, 320, 100)];
        [imgView setImageWithURL:[NSURL URLWithString:headScroll.head_url]];
        [viewsArray addObject:imgView];
    }
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 100) animationDuration:2];
    
    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex) {
        return viewsArray[pageIndex];
    };
    
    self.mainScorllView.totalPagesCount = ^NSInteger(void) {
        return viewsArray.count;
    };
    
    self.mainScorllView.TapActionBlock = ^(NSInteger pageIndex) {
//        NSLog(@"点击了第%d个",pageIndex);
        
        MainDetailController *mainDetail = [[MainDetailController alloc] init];
        mainDetail.selectNum = pageIndex;
        [self.navigationController pushViewController:mainDetail animated:YES];
        self.tabBarController.tabBar.hidden = YES;
        [mainDetail release];
    };
    
    [self.view addSubview:self.mainScorllView];
    
    /*
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake(320 * self.headScrollArray.count, 100);
    for (int i = 0; i < self.headScrollArray.count; i++) {
        HeadScroll *scroll = [self.headScrollArray objectAtIndex:i];
        UIImageView* imgView = [[UIImageView alloc]initWithFrame:CGRectMake(320 * i, 0, 320, 100)];
        [imgView setImageWithURL:[NSURL URLWithString:scroll.head_url]];
        [_scrollView addSubview:imgView];
    }
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [_pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
    _pageControl.frame = CGRectMake(110, 80, 100, 20);
    _pageControl.numberOfPages = 5;
    [self.view addSubview:_pageControl];
    
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.7 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    }
     */
}

/*
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControl.currentPage=_scrollView.contentOffset.x / 320;
}

- (void)changePage {
    [_scrollView setContentOffset:CGPointMake(320 * _pageControl.currentPage, 0) animated:YES];
}

- (void)runTimePage {
    static int page = -1;
    
    page ++;
    
    page = page > 4 ? 0 : page;
    
    _pageControl.currentPage = page;
    [_scrollView setContentOffset:CGPointMake(320 * _pageControl.currentPage, 0) animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //开启定时器
    [_timer setFireDate:[NSDate distantPast]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];
}
*/


@end
