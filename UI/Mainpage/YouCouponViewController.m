//
//  YouCouponViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-21.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "YouCouponViewController.h"

@interface YouCouponViewController () {
    UIImageView *_selectImage;
    UILabel *_picLabel;
}

@end

@implementation YouCouponViewController

- (void)dealloc {
    [_selectImage release];
    [_picLabel release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    [self createNavigation];
}

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(105, 20, 120, 40)];
    label.text = @"我的优惠劵";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    UIImageView *imageCoupon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 69, 310, self.view.bounds.size.height - 79)];
    imageCoupon.image = [UIImage imageNamed:@"myCouponBg.png"];
    [self.view addSubview:imageCoupon];
    [imageCoupon release];
    
    UIButton *cashBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cashBtn.frame = CGRectMake(20, 80, 70, 40);
    [cashBtn setTitle:@"现金劵" forState:UIControlStateNormal];
    [cashBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cashBtn.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [cashBtn addTarget:self action:@selector(couponButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    cashBtn.tag = 1000;
    [self.view addSubview:cashBtn];
    
    UIImageView *redLine = [[UIImageView alloc] initWithFrame:CGRectMake(95, 80, 10, 40)];
    redLine.image = [UIImage imageNamed:@"SeemapCellprom2.png"];
    [self.view addSubview:redLine];
    [redLine release];
    
    _selectImage = [[UIImageView alloc] initWithFrame:CGRectMake(16, 75, 75, 50)];
    _selectImage.image = [UIImage imageNamed:@"SwitchShopOrcowrybtn_Selected.png"];
    [self.view addSubview:_selectImage];
    
    UIButton *couponBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    couponBtn.frame = CGRectMake(110, 80, 70, 40);
    [couponBtn setTitle:@"优惠劵" forState:UIControlStateNormal];
    [couponBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    couponBtn.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [couponBtn addTarget:self action:@selector(couponButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    couponBtn.tag = 2000;
    [self.view addSubview:couponBtn];
    
    
    UIImageView *picImage = [[UIImageView alloc] initWithFrame:CGRectMake(110, 140, 120, 110)];
    picImage.image = [UIImage imageNamed:@"NoInformationBg.png"];
    [self.view addSubview:picImage];
    [picImage release];
    
    _picLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 270, 280, 30)];
    _picLabel.text = @"你还没领取现金劵喔！";
    _picLabel.font = [UIFont boldSystemFontOfSize:19];
    [self.view addSubview:_picLabel];
    [_picLabel release];
}

- (void)couponButtonClick:(UIButton *)button {
    switch (button.tag) {
        case 1000:
            _picLabel.text = @"你还没领取现金劵喔！";
            [UIView animateWithDuration:.4 animations:^{
                _selectImage.frame = CGRectMake(16, 75, 75, 50);
            }];
            break;
        case 2000:
            _picLabel.text = @"你还没领取优惠劵喔！";
            [UIView animateWithDuration:.4 animations:^{
                _selectImage.frame = CGRectMake(106, 75, 75, 50);
            }];
            break;
        default:
            break;
    }
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
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
