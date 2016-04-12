//
//  SharedWeiboViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "SharedWeiboViewController.h"

@interface SharedWeiboViewController ()

@end

@implementation SharedWeiboViewController

// tengxun_weibo_icon_down  tengxun_weibo_icon_normal
// fenxiangsina
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 245)];
    imageBG.image = [UIImage imageNamed:@"aboutMplifeBg"];
    [self.view addSubview:imageBG];
    [imageBG release];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 30, 50, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    if (_sharedIndex==4) {
        // 微博
        [self weiboShared];
    }else if (_sharedIndex==6){
        //二维码
        [self QRCode];
        
    }else{
        //关于
        [self aboutMingPin];
    }
    
    
    

}

- (void)weiboShared
{
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 300, 100)];
    whiteView.layer.cornerRadius = 5;
    whiteView.clipsToBounds = YES;
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    [whiteView release];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 49, 285, 1)];
    lineView.backgroundColor = RGBA(199, 199, 199, 1);
    [whiteView addSubview:lineView];
    [lineView release];
    
    for (int i=0; i<2; i++) {
        UIImageView *imageIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 7+i*49, 35, 35)];
        NSString *iconName = nil;
        if (i==0) {
            iconName = @"fenxiangsina";
        }else{
            iconName = @"tengxun_weibo_icon_down";
        }
        imageIcon.image = [UIImage imageNamed:iconName];
        [whiteView addSubview:imageIcon];
        [imageIcon release];
        
        UILabel *weiboLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 10+i*49, 80, 30)];
        NSString *weiboName = nil;
        if (i==0) {
            weiboName = @"新浪微博";
        }else{
            weiboName = @"腾讯微博";
        }
        weiboLabel.text = weiboName;
        [whiteView addSubview:weiboLabel];
        [weiboLabel release];
        
        UISwitch *swtWeibo = [[UISwitch alloc] init];
        swtWeibo.center = CGPointMake(260, 25+i*50);
        swtWeibo.tag = i+1;
        [swtWeibo addTarget:self action:@selector(weiboClick:) forControlEvents:UIControlEventValueChanged];
        [whiteView addSubview:swtWeibo];
        [swtWeibo release];
    }
}



- (void)weiboClick:(UISwitch *)swtWeibo
{
    NSLog(@"swtWeibo-->%ld",swtWeibo.tag);// 1-->新浪 2-->腾讯
}

#pragma mark - 二维码

- (void)QRCode
{
    UILabel *tripLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 320, 20)];
    tripLab.text = @"亲,朋友扫描此二维码即可拥有名品街APP喽!";
    tripLab.textAlignment = NSTextAlignmentCenter;
    tripLab.textColor = [UIColor whiteColor];
    tripLab.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:tripLab];
    [tripLab release];
    
    UIImageView *imageQR = [[UIImageView alloc] initWithFrame:CGRectMake(65, 120, 190, 190)];
    imageQR.image = [UIImage imageNamed:@"recomd_friends_new_image_"];
    [self.view addSubview:imageQR];
    [imageQR release];
}

#pragma mark - 关于

- (void)aboutMingPin
{
    UIImageView *imageweibo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 65, 300, 140)];
    imageweibo.image = [UIImage imageNamed:@"aboutwe"];
    [self.view addSubview:imageweibo];
    [imageweibo release];
    
    UIImageView *imageConduit = [[UIImageView alloc] initWithFrame:CGRectMake(0, 215, 320, VHEIGHT-213)];
    imageConduit.image = [UIImage imageNamed:@"conduit"];
    [self.view addSubview:imageConduit];
    [imageConduit release];
}




- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

@end
