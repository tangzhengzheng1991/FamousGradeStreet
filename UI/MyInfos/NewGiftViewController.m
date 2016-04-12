//
//  NewGiftViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "NewGiftViewController.h"

@interface NewGiftViewController ()<UIScrollViewDelegate>
{
    UITextField *_numberTF;
    UITextField *_giftTF;
}

@end

@implementation NewGiftViewController

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
    
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    
    [self customNavBar];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 70, 310, VHEIGHT-75)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(310, 530);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:scrollView];
    
    UIView *viewSC = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 310, 530)];
    viewSC.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:viewSC];
    
    //180*240
    
    UIImageView *imageGift = [[UIImageView alloc] initWithFrame:CGRectMake(35, 20, 240, 180)];
    imageGift.image = [UIImage imageNamed:@"headerImageNewUser"];
    [scrollView addSubview:imageGift];
    [imageGift release];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 210, 240, 60)];
    label1.font = [UIFont boldSystemFontOfSize:20];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.numberOfLines = 0;
    label1.textColor = [UIColor blackColor];
    label1.text = @"使用您的新手包验证码绑定手机,获得新手奖励!";
    [scrollView addSubview:label1];
    [label1 release];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(35, 280, 240, 50)];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.numberOfLines = 0;
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = RGBA(117, 117, 117, 1);
    label2.text = @"每客户端仅可绑定一次 新手包获取方式请参见名品导购推广活动";
    [scrollView addSubview:label2];
    [label2 release];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 50, 30)];
    label3.font = [UIFont systemFontOfSize:15];
    label3.text = @"手机号";
    [scrollView addSubview:label3];
    [label3 release];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 390, 50, 30)];
    label4.font = [UIFont systemFontOfSize:15];
    label4.text = @"新手包";
    [scrollView addSubview:label4];
    [label4 release];
    
    _numberTF = [[UITextField alloc] initWithFrame:CGRectMake(65, 350, 230, 30)];
    _numberTF.borderStyle = UITextBorderStyleLine;
    [scrollView addSubview:_numberTF];
    [_numberTF release];
    
    _giftTF = [[UITextField alloc] initWithFrame:CGRectMake(65, 390, 230, 30)];
    _giftTF.borderStyle = UITextBorderStyleLine;
    [scrollView addSubview:_giftTF];
    [_giftTF release];
    
    UIButton *bangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bangBtn.frame = CGRectMake(10, 460, 290, 30);
    [bangBtn setBackgroundImage:[UIImage imageNamed:@"quickLoginMplifeBtnbg@2x"] forState:UIControlStateNormal];
    [bangBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bangBtn setTitle:@"绑定新手包"forState:UIControlStateNormal];
    [bangBtn addTarget:self action:@selector(bangBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:bangBtn];
                         
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customNavBar
{
    UIImageView *imageNav = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageNav.image = [UIImage imageNamed:@"NavigationBarOtherBgImage@2x"];
    [self.view addSubview:imageNav];
    [imageNav release];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"新手礼包";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(280, 20, 35, 35);
    [button setBackgroundImage:[UIImage imageNamed:@"postticketPlusbtnbg"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    button.transform = CGAffineTransformMakeRotation(M_PI_4);
    [self.view addSubview:button];
    
}

- (void)bangBtnClick
{
    NSLog(@"绑定");
}

- (void)exitBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
