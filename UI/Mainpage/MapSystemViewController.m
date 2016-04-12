//
//  MapSystemViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MapSystemViewController.h"
#import <MapKit/MapKit.h>

@interface MapSystemViewController () <MKMapViewDelegate>{
    NSMutableArray *_mapBtnArray;
    
    MKMapView *_mapView;
}

@end

@implementation MapSystemViewController

- (void)dealloc
{
    [_mapBtnArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    [self createNavigation];
    
}

#pragma mark - createNavigation

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBarBgImage.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"导  航";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(10, 30, 10, 20);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"img_shop_detail2.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    UIButton *goMapBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goMapBtn.frame = CGRectMake(270, 20, 50, 44);
    [goMapBtn setBackgroundImage:[UIImage imageNamed:@"SeeSystemMapbarbgnormal.png"] forState:UIControlStateNormal];
    [goMapBtn addTarget:self action:@selector(goSystemMap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goMapBtn];
    
    NSArray *mapImage = @[@"NaviBusNormal@2x.png",@"NaviDriveNormal@2x.png",@"NaviWalkingnormal@2x.png",@"NaviBusSelected@2x.png",@"NaviDriveSelected@2x.png",@"NaviWalkingSelected@2x.png"];
    _mapBtnArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 3; i++) {
        UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        mapBtn.frame = CGRectMake(30 + 85 * i, 79, 85, 40);
        if (i == 0) {
            mapBtn.selected = YES;
        }
        [mapBtn setBackgroundImage:[UIImage imageNamed:mapImage[i]] forState:UIControlStateNormal];
        [mapBtn setBackgroundImage:[UIImage imageNamed:mapImage[i + 3]] forState:UIControlStateSelected];
        [mapBtn addTarget:self action:@selector(selectStyle:) forControlEvents:UIControlEventTouchUpInside];
        mapBtn.tag = i + 100;
        [self.view addSubview:mapBtn];
        [_mapBtnArray addObject:mapBtn];
    }
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)selectStyle:(UIButton *)button {
    for (UIButton *btn in _mapBtnArray) {
        btn.selected = NO;
    }
    button.selected = YES;
}

- (void)goSystemMap {
    NSLog(@"访问设备地图");
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64)];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    _mapView.userLocation.title = @"I Want aniPhone...";
    _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    [self.view addSubview:_mapView];
    [_mapView release];
    
    [self.view sendSubviewToBack:_mapView];
}



@end
