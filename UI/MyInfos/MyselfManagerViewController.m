//
//  MyselfManagerViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MyselfManagerViewController.h"
#import "SDImageCache.h"
#import "SuggestionViewController.h"
#import "SharedWeiboViewController.h"

@interface MyselfManagerViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    NSArray *_strings;
    NSArray *_sexImages;
    NSMutableArray *_sexBtns;
    UIImageView *_imageBG;
    
}

@end
// tag 300 301  100+
@implementation MyselfManagerViewController

- (void)dealloc {
    [_sexBtns release];
    [_sexImages release];
    [_strings release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 单元格内容
    _strings = [[NSArray alloc] initWithObjects:@"性别",@"清除缓存",@"查看更新",@"意见反馈",@"分享设置",@"给个评价",@"推荐给身边好友",@"关于名品导购", nil];
    // 性别图案名
    _sexImages = [[NSArray alloc] initWithObjects:@"sexGirlnormal",@"sexBoy_normal",@"sexGirlDown",@"sexBoyDown",nil];
    
    // 性别按钮
    _sexBtns = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];
    [_tableView release];
    
    // 添加表头
    _tableView.tableHeaderView = [self ceateTableHead];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 30, 50, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - 创建表头

- (UIView *)ceateTableHead
{
    UIView *viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 170)];
    
    // 背景
    _imageBG = [[UIImageView alloc] initWithFrame:viewHead.bounds];
    
    int sexTag = [[NSUserDefaults standardUserDefaults] integerForKey:@"sexTag"];
    if (sexTag && sexTag == 301 ) { //301 为男性 300 为女性
        _tableView.backgroundColor = RGBA(229, 250, 255, 1);
        _imageBG.image = [UIImage imageNamed:@"LoginBgBoyBg"];
        
    }else{
        _tableView.backgroundColor = RGBA(255, 240, 220, 1);
        _imageBG.image = [UIImage imageNamed:@"LoginBgGirlBg"];
    }
    
    [viewHead addSubview:_imageBG];
    [_imageBG release];
    
    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerBtn.frame = CGRectMake(120, 35, 85, 85);
    [headerBtn setBackgroundImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"userHeaderDefault"]];
    headerBtn.layer.cornerRadius = 85/2;
    headerBtn.clipsToBounds = YES;
    [headerBtn addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewHead addSubview:headerBtn];
    
    UILabel *hello = [[UILabel alloc] initWithFrame:CGRectMake(0, 125, self.view.bounds.size.width, 30)];
    if (self.myInfoVC.isRegister) {
        hello.text = @"Casually";
    }else{
        hello.text = @"亲爱的名品用户,您好";
    }
    
    hello.textAlignment = NSTextAlignmentCenter;
    hello.textColor = [UIColor whiteColor];
    hello.font = [UIFont systemFontOfSize:22];
    [viewHead addSubview:hello];
    [hello release];
    
    
    return [viewHead autorelease];
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.myInfoVC.isRegister) {
        return _strings.count+1;
    }else{
        return _strings.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row >= _strings.count) {
        
        UIButton *exitLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        exitLogin.frame = CGRectMake(10, 15, 300, 30);
        [exitLogin setTitle:@"退 出" forState:UIControlStateNormal];
        [exitLogin setBackgroundImage:[UIImage imageNamed:@"subboyPageLogin_normal"] forState:UIControlStateNormal];
        [exitLogin setBackgroundImage:[UIImage imageNamed:@"subboyPageLogin_down"] forState:UIControlStateHighlighted];
        [exitLogin addTarget:self action:@selector(exitLoginClick) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:exitLogin];
        
    }else{
    cell.textLabel.text = [_strings objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row==0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        for (int i = 0; i<2; i++) {
            UIButton *sexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            sexBtn.frame = CGRectMake(215+i*50, 7, 20, 30);// 0 1
            [sexBtn setImage:[UIImage imageNamed:_sexImages[i]] forState:UIControlStateNormal];// 2 3
            [sexBtn setImage:[UIImage imageNamed:_sexImages[i+2]] forState:UIControlStateSelected];
            int sexTag = [[NSUserDefaults standardUserDefaults] integerForKey:@"sexTag"];
            
            
            if (sexTag) {
                if (i == sexTag-300) {
                    sexBtn.selected = YES;
                }
            }else{
                if (i==0) {
                    sexBtn.selected = YES;
                }
            }
            
            sexBtn.tag = 300 + i;
            [sexBtn addTarget:self action:@selector(sexDecideClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:sexBtn];
            [_sexBtns addObject:sexBtn];
            
            UILabel *sexLab = [[UILabel alloc] initWithFrame:CGRectMake(238+i*50, 10, 20, 25)];
            if (i == 0) {
                sexLab.text = @"女";
            }else{
                sexLab.text = @"男";
            }
            sexLab.font = [UIFont boldSystemFontOfSize:17];
            sexLab.textColor = [UIColor blackColor];
            [cell addSubview:sexLab];
        }
    }
    if (indexPath.row == 2) {
        UILabel *baseLab = [[UILabel alloc] initWithFrame:CGRectMake(212, 12, 80, 20)];
        baseLab.text = @"当前版本:3.3.0";
        baseLab.font = [UIFont systemFontOfSize:12];
        baseLab.textColor = [UIColor blackColor];
        [cell addSubview:baseLab];
    }}
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 1:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"是否清理缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认",nil];
            alert.tag = 100 + 1;
            [alert show];
            [alert release];
            
        }
            break;
        case 2:
        {
            SHOWALERT(@"已经是最新版本");
        }
            break;
        case 3:
        {
            SuggestionViewController *suggest = [[SuggestionViewController alloc] init];
            [self.navigationController pushViewController:suggest animated:YES];
            [suggest release];
        }
            break;
        case 4:
        case 6:
        case 7:
        {
            SharedWeiboViewController *shared = [[SharedWeiboViewController alloc] init];
            shared.sharedIndex = indexPath.row;
            [self.navigationController pushViewController:shared animated:YES];
            [shared release];
        }
            break;
        case 5:
        {
            
            SHOWALERT(@"这就去商店评价...");
        }
            break;
            
        default:
            break;
    }
    
    
}

#pragma mark - ButtonClickEvent

- (void)sexDecideClick:(UIButton *)sexBtn
{
    // tag ==300 301
    if (!_myInfoVC.isRegister) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"是否登录名品账号?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认",nil];
        [alert show];
        [alert release];
    }else {
        for (UIButton *button in _sexBtns) {
            button.selected = NO;
        }
        sexBtn.selected = YES;
        if (sexBtn.tag == 301 ) { //301 为男性 300 为女性
            _tableView.backgroundColor = RGBA(229, 250, 255, 1);
            _imageBG.image = [UIImage imageNamed:@"LoginBgBoyBg"];
            
        }else{
            _tableView.backgroundColor = RGBA(255, 240, 220, 1);
            _imageBG.image = [UIImage imageNamed:@"LoginBgGirlBg"];
        }
        
        [[NSUserDefaults standardUserDefaults] setInteger:sexBtn.tag forKey:@"sexTag"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (buttonIndex == 1) {
        
        if (alertView.tag == 101 ) {
            
            MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
            [self.navigationController.view addSubview:hud];
            hud.mode = MBProgressHUDModeDeterminate;
            hud.labelText = @"清理中...";
            
            [hud showAnimated:YES whileExecutingBlock:^{
                
                [[SDImageCache sharedImageCache] clearDisk];
                //清理文件
                NSString *directoryPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
                // 先删文件夹
                [[NSFileManager defaultManager] removeItemAtPath:directoryPath error:nil];
                // 再创建个空的
                [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
                
                float progress = 0.0f;
                while (progress < 1.0f)
                {
                    progress += 0.01f;
                    hud.progress = progress;
                    usleep(30000);
                }
                __block UIImageView *imageView;
                dispatch_sync(dispatch_get_main_queue(), ^{
                    UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
                    imageView = [[UIImageView alloc] initWithImage:image];
                });
                hud.customView = [imageView autorelease];
                hud.mode = MBProgressHUDModeCustomView;
                hud.labelText = @"清理完!";
                sleep(1);
            } completionBlock:^{
                [hud removeFromSuperview];
                [hud release];
            }];
            
            
            
            
        }else{
            [self backBtnClick];
        }
    }
    
}

- (void)exitLoginClick
{
    NSLog(@"退出登录");
}

- (void)backBtnClick
{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    // 翻页
    animation.type = @"pageCurl";
    animation.subtype = kCATransitionFromLeft;
    [self.myInfoVC.view.layer addAnimation:animation forKey:@"animation"];
    [self.view removeFromSuperview];
    int64_t delayInSeconds = 1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.myInfoVC.tabBarController.tabBar setHidden:NO];
    });
    
}

- (void)headerBtnClick:(UIButton *)headerBtn
{
    NSLog(@"headerBtn");
}

@end
