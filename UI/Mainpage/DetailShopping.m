//
//  DetailShopping.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "DetailShopping.h"

@interface DetailShopping ()

@end

@implementation DetailShopping

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    self.recomImgArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    
    [HTTPRequestEnding getShoppingDataComplete:^(NSMutableArray *recomImgArray, NSMutableArray *hotCircleArray, NSMutableArray *marketRecomArray) {
        self.recomImgArray = recomImgArray;
        
        RecomImg *recomImg = [self.recomImgArray objectAtIndex:_tagNum];
        
        UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
        NSURL *url = [NSURL URLWithString:[recomImg.www_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [web loadRequest:request];
        web.scalesPageToFit = YES;
        [self.view addSubview:web];
        
        UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
        [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
        [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:goBackBtn];
    }];
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
