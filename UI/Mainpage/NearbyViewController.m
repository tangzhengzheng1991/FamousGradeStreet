//
//  NearbyViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "NearbyViewController.h"

#import "BabyViewController.h"
#import "YouCouponViewController.h"
#import "NeBrandViewController.h"
#import "MarketViewController.h"
#import "ShopViewController.h"

@interface NearbyViewController () <UITableViewDelegate,UITableViewDataSource>{
    UIButton *_button;
    UIView *_rightView;
    UIView *_lightrightView;
    UIImageView *_selectImage1;
    UIImageView *_selectImage2;
    UITableView *_tableView;
    UILabel *_samllLabel;
    NSArray *_placeArray;
    UIImageView *_longImage;
    BOOL isPush;
    UIButton *_kBtn;
    NSArray *_meterArray;
}

@end

@implementation NearbyViewController

- (void)dealloc {
    [_rightView release];
    [_lightrightView release];
    [_selectImage1 release];
    [_selectImage2 release];
    [_tableView release];
    [_samllLabel release];
    [_placeArray release];
    [_longImage release];
    [_meterArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"img_nearly_bg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    menuBtn.frame = CGRectMake(280, 25, 50, 30);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"rightMenuIcon.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(goToRightMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];
    
    
//    NSArray *imageArray = @[@"btn_nearly_goods_h.png",@"btn_nearly_coupon_h.png",@"btn_nearly_brand_h.png",@"btn_nearly_market_h.png",@"btn_nearly_shop_h.png"];
    NSArray *clearImageArray = @[@"btn_nearly_goods_n.png",@"btn_nearly_coupon_n.png",@"btn_nearly_brand_n.png",@"btn_nearly_market_n.png",@"btn_nearly_shop_n.png"];
    NSArray *titleArray = @[@"宝贝",@"优惠劵",@"品牌",@"商场",@"店铺"];
    for (int i = 0; i < 5; i++) {
        int p = i / 2;
        int q = i % 2;
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = CGRectMake(q * (50 + 80) + 30, p * (50 + 60) + 210, 50, 50);
        [_button setBackgroundImage:[UIImage imageNamed:[clearImageArray objectAtIndex:i]] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button.tag = i + 100;
        [self.view addSubview:_button];
        
        UILabel *labelBtn = [[UILabel alloc] initWithFrame:CGRectMake(q * (50 + 80) + 85, p * (50 + 60) + 220, 70, 35)];
        labelBtn.text = [titleArray objectAtIndex:i];
        labelBtn.textColor = [UIColor whiteColor];
        labelBtn.font = [UIFont boldSystemFontOfSize:22];
        [self.view addSubview:labelBtn];
        [labelBtn release];
    }
    //显示时间
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",
                       nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    int week = [comps weekday];
    int year=[comps year];
    int month = [comps month];
    int day = [comps day];
    
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 35, 100, 100)];
    dayLabel.text = [NSString stringWithFormat:@"%d",day];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.textColor = [UIColor whiteColor];
    dayLabel.font = [UIFont boldSystemFontOfSize:85];
    [self.view addSubview:dayLabel];
    [dayLabel release];
    
    UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 50, 80, 30)];
    weekLabel.text = [NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week - 1]];
    weekLabel.textColor = [UIColor whiteColor];
    weekLabel.font = [UIFont boldSystemFontOfSize:21];
    [self.view addSubview:weekLabel];
    [weekLabel release];
    
    UILabel *yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 85, 130, 40)];
    yearLabel.text = [NSString stringWithFormat:@"%d年%d月",year,month];
    yearLabel.textColor = [UIColor whiteColor];
    yearLabel.font = [UIFont boldSystemFontOfSize:21];
    [self.view addSubview:yearLabel];
    [yearLabel release];
    
    
    UIImageView *samllImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 150, 25, 30)];
    samllImage.image = [UIImage imageNamed:@"nearly_distance_icon.png"];
    [self.view addSubview:samllImage];
    [samllImage release];
    
    _samllLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 150, 250, 30)];
    _samllLabel.text = @"搜到周边500m内";
    _samllLabel.textColor = [UIColor whiteColor];
    _samllLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:_samllLabel];
    [_samllLabel release];
    

    
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
    btn1.frame = CGRectMake(10, 10, 100, 40);
    [btn1 setTitle:@"选择区域" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [btn1 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 100;
    [_rightView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 70, 100, 40);
    [btn2 setTitle:@"选择距离" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [btn2 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 200;
    [_rightView addSubview:btn2];
    
    _lightrightView = [[UIView alloc] initWithFrame:CGRectMake(320, 120, 140, self.view.bounds.size.height - 120)];
    _lightrightView.backgroundColor = RGBA(74, 74, 74, .5);
    [self.view addSubview:_lightrightView];
    
    
    _longImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 20, _lightrightView.bounds.size.height - 50)];
    _longImage.image = [UIImage imageNamed:@"distanceShowImage.png"];
    [_lightrightView addSubview:_longImage];
    _longImage.hidden = YES;
    
    _meterArray =[[NSArray alloc] initWithObjects:@"500m",@"1000m",@"2000m",@"5000m",@"10000m",@"20000m", nil];
    for (int k = 0; k < 6; k++) {
        _kBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _kBtn.frame = CGRectMake(45, k * (40 + 35) + 15, 80, 40);
        [_kBtn setTitle:[_meterArray objectAtIndex:k] forState:UIControlStateNormal];
        [_kBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _kBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [_kBtn addTarget:self action:@selector(kBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _kBtn.tag = k + 500;
        [_lightrightView addSubview:_kBtn];
    }
    
    //TableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 140, self.view.bounds.size.height - 120) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = RGBA(74, 74, 74, .5);
    [_lightrightView addSubview:_tableView];
}

- (void)goBack {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .4;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"pageCurl";//翻页
    animation.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:animation forKey:@"animation"];

    self.tabBarController.tabBar.hidden = NO;
    self.view.hidden = YES;
}

//宝贝,优惠劵,品牌,商场,店铺等按钮
- (void)buttonClick:(UIButton *)button {
    self.tabBarController.tabBar.hidden = YES;
    switch (button.tag) {
        case 100: {
            BabyViewController *baby = [[BabyViewController alloc] init];
            [self.navigationController pushViewController:baby animated:YES];
            [baby release];
        }
            break;
        case 101: {
            YouCouponViewController *youCoupon = [[YouCouponViewController alloc] init];
            [self.navigationController pushViewController:youCoupon animated:YES];
            [youCoupon release];
        }
            break;
        case 102: {
            NeBrandViewController *neBrand = [[NeBrandViewController alloc] init];
            [self.navigationController pushViewController:neBrand animated:YES];
            [neBrand release];
        }
            break;
        case 103: {
            MarketViewController *market = [[MarketViewController alloc] init];
            [self.navigationController pushViewController:market animated:YES];
            [market release];
        }
            break;
        case 104: {
            ShopViewController *shop = [[ShopViewController alloc] init];
            [self.navigationController pushViewController:shop animated:YES];
            [shop release];
        }
            break;
            
        default:
            break;
    }
}

- (void)goToRightMenu {
    isPush =! isPush;
    
    if (isPush) {
        [UIView animateWithDuration:.4 animations:^{
            _lightrightView.frame = CGRectMake(60, 120, 140, self.view.bounds.size.height - 120);
            _rightView.frame = CGRectMake(200, 120, 120, self.view.bounds.size.height - 120);
        }];
    }else {
        [UIView animateWithDuration:.4 animations:^{
            _lightrightView.frame = CGRectMake(320, 120, 140, self.view.bounds.size.height - 120);
            _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
        }];
    }
}

//选择搜索米数按钮
- (void)kBtnClick:(UIButton *)button {
    _samllLabel.text = [NSString stringWithFormat:@"搜索周边%@内",[_meterArray objectAtIndex:button.tag - 500]];
    
    [UIView animateWithDuration:.4 animations:^{
        _lightrightView.frame = CGRectMake(320, 120, 140, self.view.bounds.size.height - 120);
        _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
    }];
}

- (void)selectClick:(UIButton *)button {
    switch (button.tag) {
        case 100:
            
            [UIView transitionWithView:_lightrightView duration:.4 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                _selectImage2.frame = CGRectMake(0, 0, 120, 60);
                _selectImage1.frame = CGRectMake(0, 0, 10, 60);
                _tableView.hidden = NO;
                _longImage.hidden = YES;
                _kBtn.hidden = YES;
            } completion:nil];
            break;
        case 200:
            [UIView transitionWithView:_lightrightView duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                _tableView.hidden = YES;
                _selectImage2.frame = CGRectMake(0, 60, 120, 60);
                _selectImage1.frame = CGRectMake(0, 60, 10, 60);
                _longImage.hidden = NO;
                _kBtn.hidden = NO;
            } completion:nil];
            break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    _placeArray = [[NSArray alloc] initWithObjects:@"浦东新区",@"闵行区",@"徐汇区",@"杨浦区",@"长宁区",@"普陀区",@"宝山区",@"黄浦区",@"闸北区",@"虹口区",@"静安区",@"松江区",@"青浦区",@"嘉定区",@"奉贤区",@"金山区",@"崇明县", nil];
    
    cell.backgroundColor = RGBA(74, 74, 74, .5);
    cell.textLabel.text = [_placeArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _samllLabel.text = [NSString stringWithFormat:@"搜到%@",[_placeArray objectAtIndex:indexPath.row]];
    
    [UIView animateWithDuration:.4 animations:^{
        _lightrightView.frame = CGRectMake(320, 120, 140, self.view.bounds.size.height - 120);
        _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
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
