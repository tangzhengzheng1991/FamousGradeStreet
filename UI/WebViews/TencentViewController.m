//
//  TencentViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "TencentViewController.h"

@interface TencentViewController () <UIWebViewDelegate>

@end

@implementation TencentViewController

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
    
    [self sendRequest];
}
- (void)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)sendRequest{
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64)];
    NSString* urlString = @"http://open.t.qq.com/cgi-bin/oauth2/authorize?appfrom=ios&response_type=token&redirect_uri=http://m.mplife.com/discount/&htmlVersion=1&client_id=801418833";
    
    //https://open.t.qq.com/cgi-bin/oauth2/authorize?client_id=801552974&response_type=code&redirect_uri=http://www.baidu.com
    NSURL* url = [NSURL URLWithString:urlString];
    NSLog(@"%@", url);
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    [self.view addSubview:webView];
    [webView release];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL* url = [request URL];
    NSString* urlString = [url absoluteString];
    if ([urlString rangeOfString:@"?code="].location != NSNotFound)
    {
        
        NSArray* strings = [urlString componentsSeparatedByString:@"="];
        NSString* code = [strings lastObject];
        ASIFormDataRequest* postRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://open.t.qq.com/oauth2/access_token"]];
        
        [postRequest addPostValue:@"801552974" forKey:@"client_id"];
        [postRequest addPostValue:@"d8c137db9f12d280f48b170dbdb39a0f" forKey:@"client_secret"];
        [postRequest addPostValue:@"authorization_code" forKey:@"grant_type"];
        [postRequest addPostValue:code forKey:@"code"];
        [postRequest addPostValue:@"http://baidu.com" forKey:@"redirect_uri"];
        
        postRequest.delegate = self;
        
        [postRequest startAsynchronous];
        //不允许加载回调页
        return NO;
    }
    return YES;
}
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
    NSString *uid = [json objectForKey:@"uid"];
    
    NSUserDefaults *userde=[NSUserDefaults standardUserDefaults];
    
    [userde setObject:uid forKey:@"uid"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"json:%@", json);
    
    NSString* access_token = [json objectForKey:@"access_token"];
    NSNumber* expires_in = [json objectForKey:@"expires_in"];
    
    //得到失效的时间
    NSDate* expiresDate = [NSDate dateWithTimeIntervalSinceNow:[expires_in intValue]];
    
    //把access_token和access_token的失效日期保存本地
    
    NSUserDefaults* userDefults = [NSUserDefaults standardUserDefaults];
    
    [userDefults setObject:access_token forKey:@"access_token"];
    [userDefults setObject:expiresDate forKey:@"expiresDate"];
    
    [userDefults synchronize];
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
