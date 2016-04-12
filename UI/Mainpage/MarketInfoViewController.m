//
//  MarketInfoViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MarketInfoViewController.h"
#import "DeepDetailViewController.h"

@interface MarketInfoViewController () <UIActionSheetDelegate>{
    UIView *_clearView;
    UIButton *_heartBtn;
    UILabel *_heartLabel;
    
}

@property (nonatomic, retain) MarketInfo *marketInfo;
@property (nonatomic, retain) NSMutableArray *marketShopInfoArray;

@end

@implementation MarketInfoViewController

- (void)dealloc
{
    self.marketRecom = nil;
    self.marketInfo = nil;
    self.marketShopInfoArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [HTTPRequestEnding getMarketInfoWithMarketId:self.marketRecom.market_id complete:^(MarketInfo *marketInfo, NSMutableArray *marketShopInfoArray) {
        self.marketInfo = marketInfo;
        self.marketShopInfoArray = marketShopInfoArray;
        NSLog(@"marketInfo:%@",self.marketInfo.market_name);
        NSLog(@"marketShopInfoArray:%d",self.marketShopInfoArray.count);
        
        
        [self createDownShopName];
        [self createNavigation];
    }];
    
}

#pragma mark - createNavigation

- (void)createNavigation {
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - createDownShopName

- (void)createDownShopName {
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    [backImage setImageWithURL:[NSURL URLWithString:self.marketInfo.head_img] placeholderImage:[UIImage imageNamed:@"img_brand_default.png"]];
    [self.view addSubview:backImage];
    [backImage release];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    scrollView.contentSize = CGSizeMake(320, ceilf(self.marketShopInfoArray.count/4) * (60 + 40) + 130 + 530);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    [scrollView release];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, ceilf(self.marketShopInfoArray.count/4) *(60 + 40) + 130 + 530)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:whiteView];
    [whiteView release];

    
    NSLog(@"count:%d",self.marketShopInfoArray.count);
    NSLog(@"Num:%f",ceilf(self.marketShopInfoArray.count/4) *(60 + 40) + 130 + 530);
    
    UIImageView *upImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    upImage.image = [UIImage imageNamed:@"marketDetailHeaderBg.png"];
    [scrollView addSubview:upImage];
    [upImage release];
 
    UIImageView *backHead = [[UIImageView alloc] initWithFrame:CGRectMake(132, 96, 62, 66)];
    backHead.image = [UIImage imageNamed:@"marketIcondefaultImage.png"];
    [scrollView addSubview:backHead];
    [backHead release];
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(133, 98, 60, 60)];
    [headerImage setImageWithURL:[NSURL URLWithString:self.marketRecom.logo_img] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
    headerImage.layer.cornerRadius = 10;
    headerImage.layer.masksToBounds = YES;
    [scrollView addSubview:headerImage];
    [headerImage release];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 170, 120, 30)];
    titleLabel.text = self.marketRecom.market_name;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:titleLabel];
    [titleLabel release];
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 160, 30)];
    addressLabel.text = [NSString stringWithFormat:@"地点:%@",self.marketRecom.market_address];
    addressLabel.textColor = [UIColor grayColor];
    addressLabel.font = [UIFont systemFontOfSize:13];
    addressLabel.adjustsFontSizeToFitWidth = YES;
    [scrollView addSubview:addressLabel];
    [addressLabel release];
    
    UILabel *trafficLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, 280, 60)];
    trafficLabel.text = [NSString stringWithFormat:@"交通:%@",self.marketInfo.trafficInfo];
    trafficLabel.textColor = [UIColor darkGrayColor];
    trafficLabel.font = [UIFont systemFontOfSize:12];
    trafficLabel.adjustsFontSizeToFitWidth = YES;
    trafficLabel.numberOfLines = 0;
    [scrollView addSubview:trafficLabel];
    [trafficLabel release];
    
    UIImageView *phoneImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 300, 20, 20)];
    phoneImage.image = [UIImage imageNamed:@"MarketDetailPhoneIcon.png"];
    [scrollView addSubview:phoneImage];
    [phoneImage release];
    
    UIButton *phoneNum = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    phoneNum.frame = CGRectMake(29, 303, 90, 20);
    [phoneNum setTitle:self.marketInfo.tel forState:UIControlStateNormal];
    [phoneNum setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [phoneNum addTarget:self action:@selector(phoneNumberClick) forControlEvents:UIControlEventTouchUpInside];
    phoneNum.titleLabel.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:phoneNum];
    
    _heartBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _heartBtn.frame = CGRectMake(140, 300, 20, 20);
    [_heartBtn setBackgroundImage:[UIImage imageNamed:@"marketFavNumIcon.png"] forState:UIControlStateNormal];
    [_heartBtn addTarget:self action:@selector(heartBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:_heartBtn];
    
    _heartLabel = [[UILabel alloc] initWithFrame:CGRectMake(163, 300, 30, 20)];
    _heartLabel.textColor = [UIColor lightGrayColor];
    _heartLabel.text = self.marketInfo.favorite_number;
    [scrollView addSubview:_heartLabel];
    [_heartLabel release];
    
    UIImageView *upLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 330, 320, 2)];
    upLineImage.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [scrollView addSubview:upLineImage];
    [upLineImage release];
    
    UILabel *bigLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 335, 300, 160)];
    bigLabel.numberOfLines = 0;
    bigLabel.font = [UIFont systemFontOfSize:13];
    bigLabel.textColor = [UIColor grayColor];
    bigLabel.text = self.marketInfo.intro;
    bigLabel.adjustsFontSizeToFitWidth = YES;
    [scrollView addSubview:bigLabel];
    [bigLabel release];
    
    UIImageView *downLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 500, 320, 2)];
    downLineImage.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [scrollView addSubview:downLineImage];
    [downLineImage release];
    
    UILabel *shopNamesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 500, 60, 30)];
    shopNamesLabel.text = @"品牌门店";
    shopNamesLabel.font = [UIFont systemFontOfSize:15];
    [scrollView addSubview:shopNamesLabel];
    [shopNamesLabel release];
    
    for (int i = 0; i < self.marketShopInfoArray.count; i++) {
        MarketShopInfo *marketShopInfo = [self.marketShopInfoArray objectAtIndex:i];
        int p = i / 4;
        int q = i % 4;
        
        UIImageView *btnBackImage = [[UIImageView alloc] initWithFrame:CGRectMake(q * (60.05 + 16) + 16, p * (60.06 + 40) + 530, 61, 61)];
        btnBackImage.image = [UIImage imageNamed:@"marketIcondefaultImage.png"];
        [scrollView addSubview:btnBackImage];
        [btnBackImage release];
        
        UIButton *shopBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        shopBtn.frame = CGRectMake(q * (60 + 16) + 16, p * (60 + 40) + 530, 60, 60);
        [shopBtn setBackgroundImageWithURL:[NSURL URLWithString:marketShopInfo.brand_icon] placeholderImage:[UIImage imageNamed:@"marketIcondefault1Image.png"]];
        shopBtn.layer.cornerRadius = 15;
        shopBtn.layer.masksToBounds = YES;
        [shopBtn addTarget:self action:@selector(shopNameButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        shopBtn.tag = i + 10;
        [scrollView addSubview:shopBtn];
        
        UILabel *shopName = [[UILabel alloc] initWithFrame:CGRectMake(q * (60 + 16) + 16, p * (30 + 70) + 590, 60, 30)];
        if ([marketShopInfo.brand_name_zh isEqualToString:@""]) {
            shopName.text = marketShopInfo.brand_name_en;
        }else {
            shopName.text = marketShopInfo.brand_name_zh;
        }
        shopName.font = [UIFont systemFontOfSize:15];
        shopName.textAlignment = NSTextAlignmentCenter;
        shopName.adjustsFontSizeToFitWidth = YES;
        [scrollView addSubview:shopName];
        [shopName release];
    }
}

- (void)phoneNumberClick {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"我要再想想" destructiveButtonTitle:nil otherButtonTitles:self.marketInfo.tel, nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}
#pragma mark - 点赞按钮
- (void)heartBtnClick {
    
}

#pragma mark - UIActionSheetDelegate -

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:{
            NSLog(@"访问设备的通讯功能");
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.marketInfo.tel]]];
            [webView loadRequest:request];
            [self.view addSubview:webView];
            [webView release];
        }
            break;
        case 1:
            NSLog(@"我要再想想");
            break;
            
        default:
            break;
    }
}

- (void)shopNameButtonClick:(UIButton *)button {
    DeepDetailViewController *deepDetail = [[DeepDetailViewController alloc] init];
    deepDetail.marketShopInfo = [self.marketShopInfoArray objectAtIndex:button.tag - 10];
    deepDetail.marketInfo = self.marketInfo;
    [self.navigationController pushViewController:deepDetail animated:YES];
    [deepDetail release];
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
