//
//  SinaViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-28.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "SinaViewController.h"

@interface SinaViewController () <UIWebViewDelegate>

@end

@implementation SinaViewController

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
    
    
    [self createNavigation];
    
}

#pragma mark - createNavigation

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBarBgImage.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 120, 40)];
    label.text = @"授权";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(5, 24, 50, 35);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"btnSelectCircle.png"] forState:UIControlStateNormal];
    [goBackBtn setTitle:@"取消" forState:UIControlStateNormal];
    [goBackBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
//    [self sendRequest];
}
- (void)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)sendRequest{
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64)];
    NSArray *webArray = [NSArray arrayWithObjects:SINA,TENCENT,nil];
    
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[webArray objectAtIndex:_shareIndex]]]];
    [webView loadRequest:request];
    
    [request release];
    webView.scalesPageToFit = YES;
    
    webView.delegate = self;
    
    [self.view addSubview:webView];
    [webView release];
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
