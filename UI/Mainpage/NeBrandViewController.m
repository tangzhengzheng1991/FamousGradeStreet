//
//  NeBrandViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-21.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "NeBrandViewController.h"

@interface NeBrandViewController ()

@end

@implementation NeBrandViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(230, 229, 224, 1);
    [self createNavigation];
}

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(105, 20, 120, 40)];
    label.text = @"附近品牌";
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
    
    UIImageView *picImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 120, 120, 110)];
    picImage.image = [UIImage imageNamed:@"NoInformationBg.png"];
    [self.view addSubview:picImage];
    [picImage release];
    
    UILabel *picLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 240, 280, 30)];
    picLabel.text = @"真可惜，附近没有好的品牌喔！";
    picLabel.font = [UIFont boldSystemFontOfSize:19];
    [self.view addSubview:picLabel];
    [picLabel release];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
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
