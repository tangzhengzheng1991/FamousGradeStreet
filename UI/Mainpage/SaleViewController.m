//
//  SaleViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "SaleViewController.h"
#import "AllSaleTableViewController.h"
#import "EndSaleTableViewController.h"
#import "AllDetailViewController.h"
#import "EndDetailViewController.h"


@interface SaleViewController () <UIScrollViewDelegate>{
    UIImageView *_selecteImage;
    UIButton *_allBtn;
    UIButton *_endBtn;
    UIScrollView *_scrollView;
    
    BOOL isSelect;
    
    AllSaleTableViewController *_allSaleTableController;
    EndSaleTableViewController *_endSaleTableController;
}

@end

@implementation SaleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [_selecteImage release];
    [_scrollView release];
    [_allSaleTableController release];
    [_endSaleTableController release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
    [self createNavigation];
    [self createButton];
    [self createScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createButton
- (void)createButton {
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 35)];
    btnView.backgroundColor = RGBA(221, 221, 224, 1);
    [self.view addSubview:btnView];
    [btnView release];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 33, 320, 2)];
    imageView.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [btnView addSubview:imageView];
    [imageView release];
    
    _selecteImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 33, 160, 2)];
    _selecteImage.image = [UIImage imageNamed:@"progress.png"];
    [btnView addSubview:_selecteImage];
    
    
    _allBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _allBtn.frame = CGRectMake(0, 0, 160, 33);
    [_allBtn setTitle:@"全部" forState:UIControlStateNormal];
    [_allBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_allBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _allBtn.tag = 100;
    [btnView addSubview:_allBtn];
    
    _endBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _endBtn.frame = CGRectMake(160, 0, 160, 33);
    [_endBtn setTitle:@"已结束" forState:UIControlStateNormal];
    [_endBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_endBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _endBtn.tag = 200;
    [btnView addSubview:_endBtn];
}

- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        case 100:
            [_allBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_endBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [UIView animateWithDuration:.4 animations:^{
                _selecteImage.frame = CGRectMake(0, 33, 160, 2);
                _scrollView.contentOffset = CGPointMake(0, 0);
            }];
            break;
        case 200:
            [_allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_endBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [UIView animateWithDuration:.4 animations:^{
                _selecteImage.frame = CGRectMake(160, 33, 160, 2);
                _scrollView.contentOffset = CGPointMake(320, 0);
            }];
            break;
            
        default:
            break;
    }
}

#pragma mark - createScrollView 
- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 99, 320, self.view.bounds.size.height - 99)];
    _scrollView.contentSize = CGSizeMake(320 * 2, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    _allSaleTableController = [[AllSaleTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _allSaleTableController.view.frame = CGRectMake(0, 0, 320, _scrollView.bounds.size.height);
    [_scrollView addSubview:_allSaleTableController.view];
    
    _allSaleTableController.completeNum = ^(int num){
        AllDetailViewController *allDetail = [[AllDetailViewController alloc] init];
        allDetail.indexPathRow = num;
        [self.navigationController pushViewController:allDetail animated:YES];
        [allDetail release];
    };
    
    _endSaleTableController = [[EndSaleTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _endSaleTableController.view.frame = CGRectMake(320, 0, 320, _scrollView.bounds.size.height);
    [_scrollView addSubview:_endSaleTableController.view];
    
    _endSaleTableController.completeNum = ^(int num){
        EndDetailViewController *endDetail = [[EndDetailViewController alloc] init];
        endDetail.indexPathRow = num;
        [self.navigationController pushViewController:endDetail animated:YES];
        [endDetail release];
    };
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    isSelect =! isSelect;
    if (isSelect) {
        [_allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_endBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:.4 animations:^{
            _selecteImage.frame = CGRectMake(160, 33, 160, 2);
            _scrollView.contentOffset = CGPointMake(320, 0);
        }];
    }else {
        [_allBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_endBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:.4 animations:^{
            _selecteImage.frame = CGRectMake(0, 33, 160, 2);
            _scrollView.contentOffset = CGPointMake(0, 0);
        }];
    }
}

#pragma mark - createNavigation
- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"MP特卖";
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
}

- (void)goBack {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .4;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionPush;
    [self.view.layer addAnimation:animation forKey:@"animation"];

    self.tabBarController.tabBar.hidden = NO;
    self.view.hidden = YES;
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
