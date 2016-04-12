//
//  SuggestionViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "SuggestionViewController.h"

@interface SuggestionViewController ()<UITextViewDelegate>
{
    UILabel *_curLabel;
}

@property (nonatomic, retain)UITextView *textView;
@end

@implementation SuggestionViewController

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
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 65, 300, 120)];
    _textView.text = @"这里输入的你反馈";
    _textView.textColor = [UIColor lightGrayColor];
    _textView.layer.cornerRadius = 5;
    _textView.clipsToBounds = YES;
    _textView.font = [UIFont systemFontOfSize:17];
    _textView.scrollEnabled = NO;
    _textView.delegate = self;
    _textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textView];
    [_textView release];
    
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(10, 200, 300, 30);
    [commitBtn setTitle:@"递 交" forState:UIControlStateNormal];
    [commitBtn setBackgroundImage:[UIImage imageNamed:@"quickLoginMplifeBtnbg@2x"] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];
    
    UILabel *labeltotal = [[UILabel alloc] initWithFrame:CGRectMake(262, 95, 40, 15)];
    labeltotal.text = @"/180";
    labeltotal.textColor = [UIColor lightGrayColor];
    [_textView addSubview:labeltotal];
    [labeltotal release];
    
    _curLabel = [[UILabel alloc] initWithFrame:CGRectMake(222, 95, 40, 15)];
    _curLabel.text = @"0";
    _curLabel.textAlignment = NSTextAlignmentRight;
    _curLabel.textColor = [UIColor lightGrayColor];
    [_textView addSubview:_curLabel];
    [_curLabel release];
    
//    [self addObserver:self forKeyPath:@"textView" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionNew context:nil];
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
    return YES;
}


- (void)textViewDidChange:(UITextView *)textView
{
    _curLabel.text = [NSString stringWithFormat:@"%lu",_textView.text.length];
}

- (void)commitBtnClick
{
    NSLog(@"tijiao");
    if ([_textView.text isEqualToString:@"这里输入的你反馈"] || [_textView.text isEqualToString:@""]) {
        SHOWALERT(@"内容不能为空");
    }else {
        [HTTPRequestEnding suggestWithText:_textView.text completion:^(BOOL succeed) {
            if (succeed) {
                SHOWALERT(@"谢谢反馈!!!");
            }else{
                SHOWALERT(@"反馈失败");
            }
        }];
    }
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    [change objectForKey:@"new"];
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_textView.text.length==0) {
        _textView.text = @"这里输入的你反馈";
        _textView.textColor = [UIColor lightGrayColor];
    }
    
    [_textView resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
