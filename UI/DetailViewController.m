//
//  DetailViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-21.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewsViewController.h"

@interface DetailViewController () {
    UIView *_garyView;
}

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    self.couponArray = nil;
    [_garyView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    
    [HTTPRequestEnding getCouponComplete:^(NSMutableArray *couponArray) {
        self.couponArray = couponArray;
        
        BrandCoupon *brandCoupon = [self.couponArray objectAtIndex:_indexPathRow];
        
        UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://buy.mplife.com/home/ticket/wap-show/tid/%@",brandCoupon.ticket_id]];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [web loadRequest:request];
        web.scalesPageToFit = YES;
        [self.view addSubview:web];   
        
        UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
        [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
        [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:goBackBtn];
        
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        shareBtn.frame = CGRectMake(280, 25, 50, 30);
        [shareBtn setBackgroundImage:[UIImage imageNamed:@"ShareMyPage.png"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(goToShare) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:shareBtn];
        
        
        _garyView = [[UIView alloc] init];
        if (self.view.bounds.size.height == iPhone5) {
            _garyView.frame = CGRectMake(0, 568, 320, 300);
        }
        if (self.view.bounds.size.height == iPhone4) {
            _garyView.frame = CGRectMake(0, 480, 320, 300);
        }
        
        _garyView.backgroundColor = RGBA(105, 105, 105, 1);
        _garyView.alpha = .9;
        [self.view addSubview:_garyView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(105, 20, 120, 30)];
        label.text = @"分享到社交平台";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:17];
        [_garyView addSubview:label];
        
        
        NSArray *picArray = @[@"common_share_icon_message@2x.png",@"fenxiangsina.png",@"tengxun_weibo_icon_down.png",@"common_share_icon_weixin@2x.png",@"common_share_icon_weixin_friends@2x.png"];
        NSArray *titleArray = @[@"短信",@"新浪微博",@"腾讯微博",@"微信好友",@"微信朋友圈"];
        for (int i = 0; i < 5; i++) {
            int p = i / 3;
            int q = i % 3;
            UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            shareBtn.frame = CGRectMake(q * (53 + 40) + 40, p * (53 + 40) + 70, 53, 53);
            [shareBtn setBackgroundImage:[UIImage imageNamed:[picArray objectAtIndex:i]] forState:UIControlStateNormal];
            [shareBtn addTarget:self action:@selector(selectShareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            shareBtn.tag = i + 100;
            [_garyView addSubview:shareBtn];
            
            UILabel *labelBtn = [[UILabel alloc] initWithFrame:CGRectMake(q * (20 + 73) + 32, p * (53 + 40) + 70 + 53, 70, 20)];
            labelBtn.text = [titleArray objectAtIndex:i];
            labelBtn.textColor = [UIColor whiteColor];
            labelBtn.font = [UIFont boldSystemFontOfSize:13];
            labelBtn.textAlignment = NSTextAlignmentCenter;
            [_garyView addSubview:labelBtn];
        }
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelBtn.frame = CGRectMake(50, 250, 220, 45);
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:21];
        [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        cancelBtn.layer.cornerRadius = 5;
        cancelBtn.layer.masksToBounds = YES;
        cancelBtn.backgroundColor = RGBA(40, 40, 40, 1);
        [_garyView addSubview:cancelBtn];

    }];
}

- (void)selectShareBtnClick:(UIButton *)button {
    [self cancel];
    switch (button.tag) {
        case 100:{
//            NSLog(@"短信");
            SHOWALERT(@"此设备无此功能")
        }
            break;
            
        case 101:
        case 102:{
            WebViewsViewController *webViews = [[WebViewsViewController alloc] init];
            [self.navigationController pushViewController:webViews animated:YES];
            [webViews release];
            
        }
            break;
            
        case 103:{
//            NSLog(@"微信好友");
            SHOWALERT(@"此设备未安装微信")
        }
            break;
            
        case 104:{
//            NSLog(@"微信朋友圈");
            SHOWALERT(@"此设备未安装微信")
        }
            break;
            
        default:
            break;
    }
}

- (void)goBack {
    if (_isShow) {
        self.tabBarController.tabBar.hidden = YES;
    }else {
        self.tabBarController.tabBar.hidden = NO;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goToShare {
    //分享
    [UIView animateWithDuration:.4 animations:^{
        if (self.view.bounds.size.height == iPhone5) {
            _garyView.frame = CGRectMake(0, 268, 320, 300);
        }
        if (self.view.bounds.size.height == iPhone4) {
            _garyView.frame = CGRectMake(0, 180, 320, 300);
        }
    }];
}

- (void)cancel {
    [UIView animateWithDuration:.4 animations:^{
        if (self.view.bounds.size.height == iPhone5) {
            _garyView.frame = CGRectMake(0, 568, 320, 300);
        }
        if (self.view.bounds.size.height == iPhone4) {
            _garyView.frame = CGRectMake(0, 480, 320, 300);
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
