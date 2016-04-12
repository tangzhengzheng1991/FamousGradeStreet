//
//  FindViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "FindViewController.h"
#import "MenuSingleTableView.h"
#import "MBProgressHUD.h"
#import "MenuMoreViewController.h"

@interface FindViewController () <UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIScrollViewDelegate,MBProgressHUDDelegate>
{

    UIView *_redStrip;// 按钮下面的标示
    UIScrollView *_bigScrollView;// 单个的
    NSMutableArray *_btnArray; // 上面按钮的
    BOOL _isShowOther;
    
    UIScrollView * _moreScollView;// 多个的
    
    // 分别记录下ScrollView的偏移量 当前所在的页数
    int _singleIndexOffset;
    int _moreIndexOffset;
    
    int _pageIndex;// 记录下ScrollView的偏移量 当前所在的页数
}

@end

@implementation FindViewController

- (void)dealloc
{
    [_btnArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    [self createNavigation];
    
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 30)];
    whiteView.tag = 50;
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    [whiteView release];
    
    NSArray *titles = @[@"首页",@"配饰",@"女装",@"童装",@"鞋包",@"美颜"];
    _btnArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*320/6, 0, 320/6, 30);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = i+100;
        if (i==0) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:button];
        [_btnArray addObject:button];
    }
    
    _redStrip = [[UIView alloc] initWithFrame:CGRectMake(3, 27, 320/6-6, 3)];
    _redStrip.backgroundColor = [UIColor redColor];
    [whiteView addSubview:_redStrip];
    [_redStrip release];
    
    
    [self menuSigleTable];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - MENUSINGLETABLE
#pragma mark Single

- (void)menuSigleTable
{
    _bigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 94, 320, self.view.bounds.size.height-94)];
    _bigScrollView.contentSize = CGSizeMake(320*6, self.view.bounds.size.height-94);
    _bigScrollView.showsHorizontalScrollIndicator = NO;
    _bigScrollView.showsVerticalScrollIndicator = NO;
    _bigScrollView.pagingEnabled = YES;
    _bigScrollView.bounces = NO;
    _bigScrollView.delegate = self;
    [self.view addSubview:_bigScrollView];
    [_bigScrollView release];
    
    for (int i = 0; i<6; i++) {
        MenuSingleTableView *singleTable = [[MenuSingleTableView alloc] initWithStyle:UITableViewStylePlain];
        singleTable.tableView.tag = 200+i;
        singleTable.TableIndex = 300+i;
        if (i==0) {
            singleTable.isMain = YES;
        }
        singleTable.tableView.backgroundColor = [UIColor clearColor];
        singleTable.view.frame = CGRectMake(i*320, 0, 320, _bigScrollView.bounds.size.height);
        singleTable.view.backgroundColor = RGBA(219, 219, 219, 1);
        singleTable.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [_bigScrollView addSubview:singleTable.view];
        [self addChildViewController:singleTable];
        [singleTable release];
        
        
    }
    
}

#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    for (UIButton *btnn in _btnArray) {
        [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    UIView *wtv = (UIView *)[self.view viewWithTag:50];
    UIButton *btn = (UIButton *)[wtv viewWithTag:page+100];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5];
    CGRect rect = _redStrip.frame;
    rect.origin.x = page*320/6+3;
    _redStrip.frame = rect;
    [UIView commitAnimations];
    _pageIndex = page;
    
}
#pragma mark - MENUMORETABLE
#pragma mark More

- (void)menuMoreTable
{
    
    _moreScollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 94, 320, self.view.bounds.size.height-94)];
    _moreScollView.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _moreScollView.delegate = self;
    _moreScollView.pagingEnabled = YES;
    _moreScollView.bounces = NO;
    _moreScollView.contentSize = CGSizeMake(320*6, 0);
    
    [self.view addSubview:_moreScollView];
    [_moreScollView release];
    
    for (int i=0; i<6; i++) {
        MenuMoreViewController *moreTableV = [[MenuMoreViewController alloc] init];
        moreTableV.view.frame = CGRectMake(i*_moreScollView.frame.size.width, 0, 320, _moreScollView.frame.size.height);
        moreTableV.TableIndex = 300+i;
        [_moreScollView addSubview:moreTableV.view];
        [self addChildViewController:moreTableV];
        [moreTableV release];
        
    }
}

#pragma mark - createNavigation -

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"名品导购";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    [label release];
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cameraBtn.frame = CGRectMake(270, 25, 50, 30);
    [cameraBtn setBackgroundImage:[UIImage imageNamed:@"addCowryCameraIcon.png"] forState:UIControlStateNormal];
    [cameraBtn addTarget:self action:@selector(goToCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cameraBtn];
    
    UIButton *styleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    styleBtn.frame = CGRectMake(0, 25, 50, 30);
    [styleBtn setBackgroundImage:[UIImage imageNamed:@"ImageMenumoreIcon.png"] forState:UIControlStateNormal];
    [styleBtn addTarget:self action:@selector(changeStyle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:styleBtn];
    
}

- (void)goToCamera {
    NSLog(@"访问本机相机");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选", nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}

#pragma mark - UIActionSheetDelegate -

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    int type = 0;
    NSLog(@"buttonIndex:%d",buttonIndex);
    switch (buttonIndex) {
        case 0:
            type = UIImagePickerControllerSourceTypeCamera;
            
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                SHOWALERT(@"当前设备没有摄像头")
                return;
            }
            break;
            
        case 1:
            type = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
            
        case 2:
            return;
            break;
            
        default:
            break;
    }
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = type;
    pickerController.allowsEditing = YES;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
    [pickerController release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"info-->>%@",info);
}

#pragma mark - CreateButton -

- (void)createButton {
    
}

#pragma mark - ButtonClickEvent -

- (void)changeStyle:(UIButton *)styleBtn
{
    _isShowOther =! _isShowOther;
    NSUInteger singeT = [[self.view subviews] indexOfObject:_bigScrollView];
    NSUInteger moreT = [[self.view subviews] indexOfObject:_moreScollView];
    [self.view exchangeSubviewAtIndex:moreT withSubviewAtIndex:singeT];
    
    [UIView animateWithDuration:1 animations:^{
        [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
    } completion:^(BOOL finished) {
        if (_isShowOther) {
            [styleBtn setBackgroundImage:[UIImage imageNamed:@"ImageMenuSingleIcon.png"] forState:UIControlStateNormal];
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [self menuMoreTable];
                NSLog(@"---more-->");
            });
            [_moreScollView setContentOffset:CGPointMake(_pageIndex*320, 0) animated:YES];
        }else {
            [styleBtn setBackgroundImage:[UIImage imageNamed:@"ImageMenumoreIcon.png"] forState:UIControlStateNormal];
            [_bigScrollView setContentOffset:CGPointMake(_pageIndex*320, 0) animated:YES];
        }
    }];
    
    NSLog(@"moretttt--->%d",_pageIndex);
    
}

- (void)titleBtnClick:(UIButton *)btn
{
    for (UIButton *btnn in _btnArray) {
        [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5];
    CGRect rect = _redStrip.frame;
    rect.origin.x = (btn.tag-100)*btn.frame.size.width+3;
    _redStrip.frame = rect;
    [UIView commitAnimations];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [_bigScrollView setContentOffset:CGPointMake((btn.tag-100)*320, 0) animated:YES];
    [_moreScollView setContentOffset:CGPointMake((btn.tag-100)*320, 0) animated:YES];
    _pageIndex = btn.tag-100;
}


@end
