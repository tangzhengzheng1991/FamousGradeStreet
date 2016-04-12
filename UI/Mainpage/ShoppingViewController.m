//
//  ShoppingViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "ShoppingViewController.h"
#import "UIButton+WebCache.h"
#import "ShoppingCell.h"
#import "DetailShopping.h"
#import "MarketsViewController.h"
#import "MarketInfoViewController.h"

@interface ShoppingViewController () <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate> {
    UITableView *_tableView;
    UISearchBar *_searchBar;
    
    UIView *_rightView;
    UIView *_lightrightView;
    UIImageView *_selectImage1;
    UIImageView *_selectImage2;
    UIImageView *_longImage;
    NSArray *_meterArray;
    UIButton *_kBtn;
    
    BOOL isPush;

}

@property (nonatomic, retain) NSMutableArray *recomImgArray;
@property (nonatomic, retain) NSMutableArray *hotCircleArray;
@property (nonatomic, retain) NSMutableArray *marketRecomArray;
@property (nonatomic, assign) int tagNum;

@end

@implementation ShoppingViewController

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
    self.hotCircleArray = nil;
    self.marketRecomArray = nil;
    [_tableView release];
    [_searchBar release];
    [_rightView release];
    [_lightrightView release];
    [_selectImage1 release];
    [_selectImage2 release];
    [_longImage release];
    [_meterArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [HTTPRequestEnding getShoppingDataComplete:^(NSMutableArray *recomImgArray, NSMutableArray *hotCircleArray, NSMutableArray *marketRecomArray) {
        self.recomImgArray = recomImgArray;
        self.hotCircleArray = hotCircleArray;
        self.marketRecomArray = marketRecomArray;
        
        [self createTableViewHeadView];
        [self createUITableView];
        [self createNavigation];
        [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
        [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
//        NSLog(@"recomImgArray-->>%d,hotCircleArray-->>%d,marketRecomArray-->>%d",self.recomImgArray.count,self.hotCircleArray.count,self.marketRecomArray.count);
    }];
}

- (void)headerRereshing {
    [_tableView headerEndRefreshing];
}

- (void)footerRereshing {
//    SHOWALERT(@"亲，已经没有新特卖咯！");
    [_tableView footerEndRefreshing];
    
    double delayInSeconds = 0.4;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self createTableViewFootView];
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    menuBtn.frame = CGRectMake(280, 25, 50, 30);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"rightMenuIcon.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(goToRightMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];
    
    
    _rightView =[[UIView alloc] initWithFrame:CGRectMake(320, 120, 120, self.view.bounds.size.height - 120)];
    _rightView.backgroundColor = RGBA(33, 33, 33, .9);
    [self.view addSubview:_rightView];
    
    _selectImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 60)];
    _selectImage2.image = [UIImage imageNamed:@"taskButtom.png"];
    [_rightView addSubview:_selectImage2];
    
    _selectImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 60)];
    _selectImage1.image = [UIImage imageNamed:@"ticketPageMenuBackBg.png"];
    [_rightView addSubview:_selectImage1];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 10, 100, 40);
    [btn1 setTitle:@"选择区域" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [btn1 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 100;
    [_rightView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 70, 100, 40);
    [btn2 setTitle:@"选择距离" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [btn2 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 200;
    [_rightView addSubview:btn2];
    
    _lightrightView = [[UIView alloc] initWithFrame:CGRectMake(320, 120, 140, self.view.bounds.size.height - 120)];
    _lightrightView.backgroundColor = RGBA(74, 74, 74, .6);
    [self.view addSubview:_lightrightView];

    
    _longImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 20, _lightrightView.bounds.size.height - 50)];
    _longImage.image = [UIImage imageNamed:@"distanceShowImage.png"];
    [_lightrightView addSubview:_longImage];
    
    _meterArray =[[NSArray alloc] initWithObjects:@"500m",@"1000m",@"2000m",@"5000m",@"10000m",@"20000m", nil];
    for (int k = 0; k < 6; k++) {
        _kBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _kBtn.frame = CGRectMake(45, k * (40 + 35) + 15, 80, 40);
        [_kBtn setTitle:[_meterArray objectAtIndex:k] forState:UIControlStateNormal];
        [_kBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _kBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [_kBtn addTarget:self action:@selector(kBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _kBtn.tag = k + 500;
        [_lightrightView addSubview:_kBtn];
    }

    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(50, 20, 220, 40)];
    _searchBar.placeholder = @"请输入商场名称";
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.view addSubview:_searchBar];
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

- (void)goToRightMenu {
    isPush =! isPush;
    
    if (isPush) {
        [UIView animateWithDuration:.4 animations:^{
            _lightrightView.frame = CGRectMake(60, 120, 140, self.view.bounds.size.height - 120);
        }];
        
        [UIView animateWithDuration:.4 animations:^{
            _rightView.frame = CGRectMake(200, 120, 120, self.view.bounds.size.height - 120);
        }];
    }else {
        [UIView animateWithDuration:.4 animations:^{
            _lightrightView.frame = CGRectMake(320, 120, 140, self.view.bounds.size.height - 120);
        }];
        
        [UIView animateWithDuration:.4 animations:^{
            _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
        }];
    }
}

//选择搜索米数按钮
- (void)kBtnClick:(UIButton *)button {    
    [UIView animateWithDuration:.4 animations:^{
        _lightrightView.frame = CGRectMake(320, 120, 140, self.view.bounds.size.height - 120);
        _rightView.frame = CGRectMake(320, 120, 120, self.view.bounds.size.height - 120);
    }];
}


- (void)selectClick:(UIButton *)button {
    switch (button.tag) {
        case 100:
            [UIView animateWithDuration:.4 animations:^{
                _selectImage2.frame = CGRectMake(0, 0, 120, 60);
                _selectImage1.frame = CGRectMake(0, 0, 10, 60);
            }];
            break;
        case 200:
            [UIView animateWithDuration:.4 animations:^{
                _selectImage2.frame = CGRectMake(0, 60, 120, 60);
                _selectImage1.frame = CGRectMake(0, 60, 10, 60);
            }];
            break;
            
        default:
            break;
    }
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = YES;
    for(id cancel in [searchBar subviews])
    {
        if([cancel isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)cancel;
            [button setTitle:@"取消"  forState:UIControlStateNormal];
        }
    }
    NSLog(@"shuould begin");
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"cancle clicked");
    _searchBar.text = @"";
    [_searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"did end");
    searchBar.showsCancelButton = NO;
}

//键盘搜索按钮按下时调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"shuould begin Search");
//    SearchViewController *search = [[SearchViewController alloc] init];
//    [self.navigationController pushViewController:search animated:YES];
//    [search release];
}


#pragma mark - createTableViewHeadView

- (UIView *)createTableViewHeadView {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 260)];
    headView.backgroundColor = RGBA(219, 219, 219, 1);
    _tableView.tableHeaderView = headView;
    
    for (int i = 0; i < 3; i++) {
        RecomImg *recomImg = [self.recomImgArray objectAtIndex:i];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake((10 + 94) * i + 10, 10, 94, 100);
        [btn setBackgroundImageWithURL:[NSURL URLWithString:recomImg.img_url]];
        [headView addSubview:btn];
        btn.tag = i;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
    }
    
    UIView *samllView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, 320, 130)];
    samllView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:samllView];
    
    for (int j = 0; j < 9; j++) {
        Hotcircle *hotCircle = [self.hotCircleArray objectAtIndex:j];
        int p = j / 3;
        int q = j % 3;
        UIButton *samllBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        samllBtn.frame = CGRectMake(q * (94 + 10) + 10, p * (30 + 10) + 10, 94, 30);
        samllBtn.backgroundColor = RGBA(236, 236, 236, 1);
        [samllBtn setTitle:hotCircle.circle_name forState:UIControlStateNormal];
        [samllBtn setTintColor:[UIColor blackColor]];
        [samllBtn addTarget:self action:@selector(addressBtnCilck:) forControlEvents:UIControlEventTouchUpInside];
        samllBtn.tag = j + 100;
        [samllView addSubview:samllBtn];
    }
    return [headView autorelease];
}

- (UIView *)createTableViewFootView {
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _tableView.tableFooterView = footView;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 280, 30)];
    textLabel.text = @"亲,为你推荐的商城就这么多了！";
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [footView addSubview:textLabel];
    [textLabel release];
    
    return [footView autorelease];
}

- (void)addressBtnCilck:(UIButton *)button {
    MarketsViewController *markets = [[MarketsViewController alloc] init];
    markets.addressBtnIndex = button.tag - 100;
    markets.hotCircle = [self.hotCircleArray objectAtIndex:button.tag - 100];
    [self.navigationController pushViewController:markets animated:YES];
    [markets release];
}

#pragma mark - UITableView && UITableViewDelagate

- (void)createUITableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 90;
    _tableView.backgroundColor = RGBA(219, 219, 219, 1);
    _tableView.tableHeaderView = [self createTableViewHeadView];
//    _tableView.tableFooterView = [self createTableViewFootView];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.marketRecomArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShoppingCell" owner:nil options:nil] objectAtIndex:0];
    }
    MarketRecom *market = [self.marketRecomArray objectAtIndex:indexPath.row];
    
    [cell.marketImage setImageWithURL:[NSURL URLWithString:market.logo_img]];
    cell.marketImage.layer.cornerRadius = 15;
    cell.marketImage.layer.masksToBounds = YES;
    cell.marketName.text = market.market_name;
    cell.marketAddress.text = market.market_address;
    cell.marketNumber.text = market.shop_num;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MarketInfoViewController *marketInfo = [[MarketInfoViewController alloc] init];
    marketInfo.marketRecom = [self.marketRecomArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:marketInfo animated:YES];
    [marketInfo release];
}

- (void)buttonClick:(UIButton *)button {
    
    DetailShopping *detail = [[DetailShopping alloc] init];
    detail.tagNum = button.tag;
    [self.navigationController pushViewController:detail animated:YES];
    self.tabBarController.tabBar.hidden = YES;
    [detail release];;
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
