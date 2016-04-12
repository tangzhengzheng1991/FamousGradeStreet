//
//  MarketsViewController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MarketsViewController.h"
#import "ShoppingCell.h"
#import "MarketInfoViewController.h"

@interface MarketsViewController () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
    int _page;
    UITableView *_tableView;
    UISearchBar *_searchBar;
}

@property (nonatomic, retain) NSMutableArray *marketsArray;

@end

@implementation MarketsViewController

- (void)dealloc
{
    [_tableView release];
    [_searchBar release];
    self.marketsArray = nil;
    self.hotCircle = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    [self createNavigation];
    [self createTableView];
    self.marketsArray = [NSMutableArray array];
    
    [_tableView addHeaderWithCallback:^{
        _page = 0;
        [self loadRequestData];
    }];
    [_tableView addFooterWithCallback:^{
        _page++;
        [self loadRequestData];
    }];
    [_tableView headerBeginRefreshing];
}

- (void)loadRequestData {
    [HTTPRequestEnding getMarketsWithCircleId:self.hotCircle.circle_id page:_page + 1 complete:^(NSMutableArray *marketsArray) {
        
        if (_page == 0) {
            [self.marketsArray removeAllObjects];
        }
        [self.marketsArray addObjectsFromArray:marketsArray];
        [_tableView reloadData];

        if (_page == 0) {
            [_tableView headerEndRefreshing];
        }else {
            [_tableView footerEndRefreshing];
        }
    }];
}

#pragma mark - createNavigation

- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"商场";
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
    
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, 320, 50)];
    _searchBar.placeholder = @"请输入商场名称";
    _searchBar.delegate = self;
//    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.view addSubview:_searchBar];

}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
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


#pragma mark - createTableView

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 114, 320, self.view.bounds.size.height - 114) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 90;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.marketsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShoppingCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    MarketRecom *market = [self.marketsArray objectAtIndex:indexPath.row];

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
    marketInfo.marketRecom = [self.marketsArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:marketInfo animated:YES];
    [marketInfo release];
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
