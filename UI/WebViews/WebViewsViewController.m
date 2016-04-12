//
//  WebViewsViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "WebViewsViewController.h"
#import "TencentViewController.h"
#import "SinaViewController.h"

@interface WebViewsViewController () <UITextViewDelegate,UIWebViewDelegate>{
    UILabel *_curLabel;
    UIButton *_sinaTencent;
}

@property (nonatomic, retain)UITextView *textView;
@property (nonatomic, retain)UIWebView *sinaWeb;

@end

@implementation WebViewsViewController

- (void)dealloc
{
    [_curLabel release];
    self.sinaWeb = nil;
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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 120, 40)];
    label.text = @"分享到微博";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:label];
    [label release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(10, 30, 10, 20);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"img_shop_detail2.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    UIImageView *textViewImage = [[UIImageView alloc] initWithFrame:CGRectMake(9, 68, 302, 180)];
    textViewImage.image =[UIImage imageNamed:@"xinlangfanxiang_bg_iphone.png"];
    [self.view addSubview:textViewImage];
    [textViewImage release];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 68, 300, 100)];
//    _textView.text = [NSString stringWithFormat:@"#名品导购移动版惊喜发现#%@。用名品，好东西逃不掉！安装名品导购客户端：http://promo.mplife.com/",];
    _textView.text = @"#名品导购移动版惊喜发现#.用名品，好东西逃不掉！安装名品导购客户端：http://promo.mplife.com/";
//    _textView.textColor = [UIColor lightGrayColor];
    _textView.layer.cornerRadius = 5;
    _textView.clipsToBounds = YES;
    _textView.font = [UIFont systemFontOfSize:12];
    _textView.delegate = self;
    _textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textView];
    [_textView release];
    
    UILabel *labeltotal = [[UILabel alloc] initWithFrame:CGRectMake(277, 154, 40, 15)];
    labeltotal.text = @"/230";
    labeltotal.textColor = [UIColor lightGrayColor];
    labeltotal.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labeltotal];
    [labeltotal release];
    
    _curLabel = [[UILabel alloc] initWithFrame:CGRectMake(237, 154, 40, 15)];
    _curLabel.text = [NSString stringWithFormat:@"%d",_textView.text.length];
    _curLabel.textAlignment = NSTextAlignmentRight;
    _curLabel.textColor = [UIColor lightGrayColor];
    _curLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_curLabel];
    
    
    //相关特卖图
    UIImageView *correlationImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 175, 80, 65)];
    correlationImage.image = [UIImage imageNamed:@"img_brand_default.png"];
    [self.view addSubview:correlationImage];
    [correlationImage release];
    
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(150, 190, 140, 35);
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"SubSettingSenderveriCode.png"] forState:UIControlStateNormal];
    [shareBtn setTitle:@"分  享" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:shareBtn];
    
    UILabel *canShare = [[UILabel alloc] initWithFrame:CGRectMake(20, 254, 110, 30)];
    canShare.text = @"可以分享的微博:";
    canShare.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:canShare];
    [canShare release];
    
    NSArray *picBtn = @[@"sina_press.png",@"tengxun_weibo_icon_normal.png"];
    for (int i = 0; i < 2; i++) {
        _sinaTencent = [UIButton buttonWithType:UIButtonTypeCustom];
        _sinaTencent.frame = CGRectMake(i * (50 + 25) + 30, 285, 50, 50);
        [_sinaTencent setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[picBtn objectAtIndex:i]]] forState:UIControlStateNormal];
        _sinaTencent.layer.cornerRadius = 10;
        _sinaTencent.layer.masksToBounds = YES;
        [_sinaTencent addTarget:self action:@selector(selectShareStyle:) forControlEvents:UIControlEventTouchUpInside];
        _sinaTencent.tag = i + 10;
        [self.view addSubview:_sinaTencent];
    }
}

- (void)selectShareStyle:(UIButton *)button {    
    switch (button.tag) {
        case 10: {
            NSLog(@"新浪");
            
            self.sinaWeb = [[UIWebView alloc] initWithFrame:CGRectMake(10, 30, 300, self.view.bounds.size.height - 40)];
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=4035616092&response_type=code&redirect_uri=http://www.baidu.com"]];
            [self.sinaWeb loadRequest:request];
            self.sinaWeb.scalesPageToFit = YES;
            self.sinaWeb.delegate = self;
            [self.view addSubview:self.sinaWeb];
            [self.sinaWeb release];
            
            UIButton *cancleSina = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            cancleSina.frame = CGRectMake(5, 25, 30, 30);
            [cancleSina setBackgroundImage:[UIImage imageNamed:@"red-x-icon.png"] forState:UIControlStateNormal];
            [cancleSina addTarget:self action:@selector(cancleSina) forControlEvents:UIControlEventTouchUpInside];
            cancleSina.showsTouchWhenHighlighted = YES;
            cancleSina.tag = 100;
            [self.view addSubview:cancleSina];
        }
            break;
        case 11: {
            NSLog(@"腾讯");
            TencentViewController *tencent = [[TencentViewController alloc] init];
            tencent.shareIndex = button.tag - 10;
            [self presentViewController:tencent animated:YES completion:nil];
            [tencent release];
        }
            break;
            
        default:
            break;
    }
}

- (void)share {
    SHOWALERT(@"先绑定微博在分享哦...")
}

- (void)cancleSina {
    UIButton *cancleSina = (UIButton *)[self.view viewWithTag:100];
    [cancleSina removeFromSuperview];
    self.sinaWeb.hidden = YES;
    SHOWALERT(@"登录失败")
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *URLString = [[request URL] absoluteString];
    
    if ([URLString rangeOfString:@"?code="].location != NSNotFound) {
        NSArray* strings = [URLString componentsSeparatedByString:@"="];
        NSString* code = [strings lastObject];
        
        ASIFormDataRequest* postRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
        
        [postRequest addPostValue:@"4035616092" forKey:@"client_id"];
        [postRequest addPostValue:@"47d6c2fe045f097af3dc798d54614def" forKey:@"client_secret"];
        [postRequest addPostValue:@"authorization_code" forKey:@"grant_type"];
        [postRequest addPostValue:code forKey:@"code"];
        [postRequest addPostValue:@"http://www.baidu.com" forKey:@"redirect_uri"];
        
        postRequest.delegate = self;
        
        [postRequest startAsynchronous];
        
        return NO;
    }
    return YES;
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"%@", json);
    NSString* access_token = [json objectForKey:@"access_token"];
    NSNumber* expires_in = [json objectForKey:@"expires_in"];
    NSDate* expiresDate = [NSDate dateWithTimeIntervalSinceNow:[expires_in intValue]];
    
    //把access_token和access_token的失效日期保存本地
    
    NSUserDefaults* userDefults = [NSUserDefaults standardUserDefaults];
    
    [userDefults setObject:access_token forKey:@"access_token"];
    [userDefults setObject:expiresDate forKey:@"expiresDate"];
    
    [userDefults synchronize];
}
/*
 {
 "access_token" = "2.00ZNgb6DIGCH6E57d2fcaf49weajHC";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 3126787321;
 }
 */


#pragma mark - UITextViewDelegate

//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
////    textView.text = @"";
//    textView.textColor = [UIColor blackColor];
//    return YES;
//}

- (void)textViewDidChange:(UITextView *)textView {
    _curLabel.text = [NSString stringWithFormat:@"%d",_textView.text.length];
    
    //该判断用于联想输出，同上句代码同事执行会导致程序奔溃
//    if (textView.text.length > 230) {
//        textView.text = [textView.text substringToIndex:230];
//    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [_textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (textView.text.length > 230) {
        return NO;
    }
    
    //判断是否为删除字符串，如果为删除就执行
    char c = [text UTF8String][0];
    if (c == '\000') {
        _curLabel.text = [NSString stringWithFormat:@"%d",230 - (textView.text.length + 1)];
        return YES;
    }
    
    if (textView.text.length == 230) {
        if (![text isEqualToString:@"\b"]) return NO;
    }
    
    _curLabel.text = [NSString stringWithFormat:@"%d",230 - textView.text.length - text.length];
    
    return YES;
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
