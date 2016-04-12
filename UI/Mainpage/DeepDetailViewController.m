//
//  DeepDetailViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "DeepDetailViewController.h"
#import "MoreBabysViewController.h"
#import "MapSystemViewController.h"
#import "StoreMoreBabyViewController.h"

@interface DeepDetailViewController () {
    UIButton *_praiseBtn;
    UILabel *_praiseLabel;
    UIButton *_positionBtn;
    UILabel *_positionLabel;
    NSString *_shopName;
}
@property (nonatomic, assign) BOOL isJump;

@end

@implementation DeepDetailViewController

- (void)dealloc
{
    [_positionLabel release];
    [_praiseLabel release];
    self.brandShopArray = nil;
    self.marketShopInfo = nil;
    self.marketInfo = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createDownUI];
    [self createNavigation];
    
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


#pragma mark - createDownUI

- (void)createDownUI {
    NSString *comeIdIndex = nil;
    
    if (_isJump) {
        comeIdIndex = self.samll.come_from_id;
    }else {
        comeIdIndex = self.brandDouble.brand_id;
    }
    
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    backImage.image = [UIImage imageNamed:@"img_shop_default.jpg"];
    [self.view addSubview:backImage];
    [backImage release];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    scrollView.contentSize = CGSizeMake(320, self.view.bounds.size.height * 2);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    [scrollView release];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, self.view.bounds.size.height * 2)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:whiteView];
    [whiteView release];
    
    
    UIImageView *samllImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 130, 320, 100)];
    samllImage.image = [UIImage imageNamed:@"brand_detail_desc.png"];
    [scrollView addSubview:samllImage];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 155, 95, 35)];
    if (self.brandDouble || self.store) {
        if ([self.brandDouble.brand_name_zh isEqualToString:@""]) {
            label.text = self.brandDouble.brand_name_en;
        }else {
            label.text = self.brandDouble.brand_name_zh;
        }
        
        if ([self.brandDouble.brand_name_zh isEqualToString:@""]) {
            label.text = self.store.brand_name_en;
        }else {
            label.text = self.store.brand_name_zh;
        }
    }else {
        label.text = self.marketShopInfo.brand_name_zh;
    }
    
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:19];
    label.adjustsFontSizeToFitWidth = YES;
    [scrollView addSubview:label];
    [label release];
    
    ShopID *shopId = [self.brandShopArray objectAtIndex:_indexPathRow - 1];
    _shopName = shopId.shop_name;
    UILabel *labelPlace = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 180, 60)];
    if (_indexPathRow) {
        labelPlace.text = [NSString stringWithFormat:@"地点:%@",shopId.shop_address];
    }else {
        labelPlace.text = [NSString stringWithFormat:@"地点:%@%@",self.marketInfo.area,self.marketInfo.market_address];
    }
    
    labelPlace.font = [UIFont systemFontOfSize:13];
    labelPlace.numberOfLines = 0;
    labelPlace.textColor = [UIColor grayColor];
    [scrollView addSubview:labelPlace];
    [labelPlace release];
    
    UIImageView *backHead = [[UIImageView alloc] initWithFrame:CGRectMake(239, 138, 62, 66)];
    backHead.image = [UIImage imageNamed:@"marketIcondefaultImage.png"];
    [scrollView addSubview:backHead];
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(240, 140, 60, 60)];
    if (self.brandDouble || self.store) {
        if (_isJump) {
            [headerImage setImageWithURL:[NSURL URLWithString:self.brandDouble.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
        }else {
            [headerImage setImageWithURL:[NSURL URLWithString:self.store.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
        }
    }else {
        [headerImage setImageWithURL:[NSURL URLWithString:self.marketShopInfo.brand_icon] placeholderImage:[UIImage imageNamed:@"marketIcondefault1Image.png"]];
    }

    headerImage.layer.cornerRadius = 10;
    headerImage.layer.masksToBounds = YES;
    [scrollView addSubview:headerImage];
    [headerImage release];
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _praiseBtn.frame = CGRectMake(190, 210, 20, 20);
    [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavNumIcon.png"] forState:UIControlStateNormal];
    [_praiseBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _praiseBtn.tag = 100;
    [scrollView addSubview:_praiseBtn];
    
    _praiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(215, 210, 30, 25)];
    _praiseLabel.textColor = [UIColor lightGrayColor];
    _praiseLabel.text = self.store.favorite_number;
    _praiseLabel.font = [UIFont systemFontOfSize:15];
    [scrollView addSubview:_praiseLabel];
    
    
    _positionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _positionBtn.frame = CGRectMake(250, 210, 15, 20);
    [_positionBtn setBackgroundImage:[UIImage imageNamed:@"marketDistanceIcon.png"] forState:UIControlStateNormal];
    [_positionBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _positionBtn.tag = 200;
    [scrollView addSubview:_positionBtn];
    
    _positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(275, 210, 30, 25)];
    _positionLabel.textColor = [UIColor lightGrayColor];
    _positionLabel.text = @"0.00";
    _positionLabel.font = [UIFont systemFontOfSize:13];
    [scrollView addSubview:_positionLabel];
    
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, 320, 20)];
    lineImage.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [scrollView addSubview:lineImage];
    [lineImage release];
    
    UIButton *promptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    promptBtn.frame = CGRectMake(0, 280, 320, 35);
    [promptBtn setBackgroundImage:[UIImage imageNamed:@"NavigationBar_createdBg.png"] forState:UIControlStateNormal];
    [promptBtn addTarget:self action:@selector(promptBtn) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:promptBtn];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 288, 10, 20)];
    arrowImage.image = [UIImage imageNamed:@"PageArrowIcon.png"];
    [scrollView addSubview:arrowImage];
    [arrowImage release];
    
    UILabel *moreBaby = [[UILabel alloc] initWithFrame:CGRectMake(15, 280, 60, 35)];
    moreBaby.text = @"更多宝贝";
    moreBaby.textColor = [UIColor whiteColor];
    moreBaby.font = [UIFont boldSystemFontOfSize:15];
    [scrollView addSubview:moreBaby];
    [moreBaby release];

}

- (void)promptBtn {
//    SHOWALERT(@"亲，没有更多宝贝了...")
    StoreMoreBabyViewController *moreBaby = [[StoreMoreBabyViewController alloc] init];
    moreBaby.searchName = _shopName;
    [self.navigationController pushViewController:moreBaby animated:YES];
    [moreBaby release];
    
}

- (void)praiseBtnClick:(UIButton *)button {
    switch (button.tag) {
        case 100:{
            [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavedNumIcon.png"] forState:UIControlStateNormal];
        }
            break;
        case 200:{
            MapSystemViewController *mapSystem = [[MapSystemViewController alloc] init];
            [self.navigationController pushViewController:mapSystem animated:YES];
            [mapSystem release];
        }
            break;
        default:
            break;
    }
}

@end
