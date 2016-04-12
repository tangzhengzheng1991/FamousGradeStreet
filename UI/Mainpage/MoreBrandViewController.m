//
//  MoreBrandViewController.m
//  FamousGradeStreet
//
//  Created by JiangLin on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MoreBrandViewController.h"
#import "BrandDoubleCell.h"
#import "MoreBrandDetailController.h"

@interface MoreBrandViewController () <UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSArray *_storeIds;
    NSInteger _page;
}

@end

@implementation MoreBrandViewController

- (void)dealloc
{
    [_tableView release];
    self.morebrandArray = nil;
    [_storeIds release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(219, 219, 219, 1);
    [self createNavigation];
    [self createTableView];
    
    self.morebrandArray = [NSMutableArray array];
    
    _storeIds = [[NSArray alloc] initWithObjects:@"19",@"21",@"22",@"23",@"24",@"25",@"27",@"28",@"29",@"30", nil];
}

#pragma mark - createNavigation
- (void)createNavigation {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    imageView.image = [UIImage imageNamed:@"NavigationBar_createdBg.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 40)];
    label.text = @"品牌列表";
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadRequestData {
    [HTTPRequestEnding getBrandDoubleWithStoreId:_storeIds[_brandIndex] page:_page + 1 complete:^(NSMutableArray *brandDoubleArray) {
        
        if (_page == 0) {
            [self.morebrandArray removeAllObjects];
        }
        
        [self.morebrandArray addObjectsFromArray:brandDoubleArray];

        [_tableView reloadData];
        
        if (_page == 0) {
            [_tableView headerEndRefreshing];
        }else {
            [_tableView footerEndRefreshing];
        }
    }];
}

#pragma mark - createTableView

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 90;
    [self.view addSubview:_tableView];
    
    
    
    [_tableView addHeaderWithCallback:^{
        _page = 0;
        [self loadRequestData];
    }];
    
    [_tableView addFooterWithCallback:^{
        _page++;
        [self loadRequestData];
    }];
    
    [_tableView headerBeginRefreshing];
    NSLog(@"index:%d",_brandIndex);

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.morebrandArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    BrandDoubleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BrandDoubleCell" owner:nil options:nil] objectAtIndex:0];
    }
    BrandDouble *brandDouble = [self.morebrandArray objectAtIndex:indexPath.row];
    
    [cell.brandImage setImageWithURL:[NSURL URLWithString:brandDouble.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
    
    if ([brandDouble.brand_name_zh isEqualToString:@""]) {
        cell.brandTitle.text = brandDouble.brand_name_en;
    }else {
        cell.brandTitle.text = brandDouble.brand_name_zh;
    }
   
    cell.brandDescribe.text = brandDouble.brand_profile;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MoreBrandDetailController *moreBrandDetail = [[MoreBrandDetailController alloc] init];
    moreBrandDetail.brandDouble = [_morebrandArray objectAtIndex:indexPath.row];
    moreBrandDetail.indexPathRow = indexPath.row;
    [self.navigationController pushViewController:moreBrandDetail animated:YES];
    [moreBrandDetail release];
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
