//
//  MoreBrandDetailController.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MoreBrandDetailController.h"
#import "BrandDoubleCell.h"
#import "DeepDetailViewController.h"
#import "GotoStoreViewController.h"

@interface MoreBrandDetailController () <UITableViewDataSource,UITableViewDelegate>{
    int _page;
    UITableView *_tableView;
    UIButton *_praiseBtn;
    UILabel *_praiseLabel;
    
    NSString *_comeIdIndex;
}

@property (nonatomic, retain) Store *store;
@property (nonatomic, retain) NSMutableArray *brandShopArray;

@end

@implementation MoreBrandDetailController


- (void)dealloc
{
    self.brandDouble = nil;
    [_tableView release];
    self.store = nil;
    [_praiseLabel release];
    self.brandShopArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.brandShopArray = [NSMutableArray array];
    
    _comeIdIndex = nil;
    
    if (_isJump) {
        _comeIdIndex = self.samll.come_from_id;
    }else {
        _comeIdIndex = self.brandDouble.brand_id;
    }
    [HTTPRequestEnding getBrandThreeWithBrandId:_comeIdIndex page:_page + 1 complete:^(Store *store) {
        self.store = store;
        NSLog(@"self.store:%@",self.samll.come_from_id);
        NSLog(@"self.store:%@",self.brandDouble.brand_id);
        [self createTableView];
        [self createNavigation];
        
        [_tableView addHeaderWithCallback:^{
            _page = 0;
            [self loadRequestData];
        }];
        
        [_tableView addFooterWithCallback:^{
            _page++;
            [self loadRequestData];
        }];
        [_tableView headerBeginRefreshing];
    }];
}

- (void)loadRequestData {
    [HTTPRequestEnding getBrandShopWithBrandId:_comeIdIndex page:_page + 1 complete:^(NSMutableArray *brandShopArray) {
        
        if (_page == 0) {
            [self.brandShopArray removeAllObjects];
        }
        [self.brandShopArray addObjectsFromArray:brandShopArray];
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
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(-10, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - createTableView

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 90;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = [self headTableView];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.brandShopArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        static NSString *cellIdentifier = @"Cell1";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[cellIdentifier  autorelease]];
        }
        if (_isJump) {
            cell.textLabel.text = self.store.brand_profile;
        }else {
            cell.textLabel.text = self.brandDouble.brand_profile;
        }
        
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        
        return cell;
        
    }else {
        static NSString *cellIdentifier = @"Cell";
        
        BrandDoubleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"BrandDoubleCell" owner:nil options:nil] objectAtIndex:0];
        }
        ShopID *shopId = [self.brandShopArray objectAtIndex:indexPath.row - 1];
        
        if (_isJump) {
            [cell.brandImage setImageWithURL:[NSURL URLWithString:self.store.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
        }else {
            [cell.brandImage setImageWithURL:[NSURL URLWithString:self.brandDouble.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
        }
        cell.brandImage.layer.cornerRadius = 10;
        cell.brandImage.layer.masksToBounds = YES;
        
        cell.brandTitle.text = shopId.shop_name;
        cell.brandTitle.adjustsFontSizeToFitWidth = YES;
        
        cell.brandDescribe.text = [NSString stringWithFormat:@"地点:%@",shopId.shop_address];
        cell.brandDescribe.font = [UIFont systemFontOfSize:15];

        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==0) {
        return;
    }else{
        ShopID *shopID = [self.brandShopArray objectAtIndex:indexPath.row-1];
        GotoStoreViewController *store = [[GotoStoreViewController alloc] init];
        store.shopId = [shopID.shop_id intValue];
        [self.navigationController pushViewController:store animated:YES];
        [store release];
        
    
//    DeepDetailViewController *deepDetail = [[DeepDetailViewController alloc] init];
//    deepDetail.brandDouble = self.brandDouble;
//    deepDetail.store = self.store;
//    deepDetail.samll = self.samll;
//    deepDetail.brandShopArray = self.brandShopArray;
//    deepDetail.indexPathRow = indexPath.row;
//    [self.navigationController pushViewController:deepDetail animated:YES];
//        [deepDetail release];
    }
}

#pragma mark - HeadViewTable

- (UIView *)headTableView {
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    [backImage setImageWithURL:[NSURL URLWithString:_store.brand_head] placeholderImage:[UIImage imageNamed:@"img_brand_default.png"]];
    [self.view addSubview:backImage];
    [backImage release];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    headView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = headView;
    
    UIImageView *samllImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 160, 320, 75)];
    samllImage.image = [UIImage imageNamed:@"brand_detail_desc.png"];
    [headView addSubview:samllImage];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 170, 100, 35)];
    
    if (_isJump) {
        if ([self.brandDouble.brand_name_zh isEqualToString:@""]) {
            label.text = self.store.brand_name_en;
        }else {
            label.text = self.store.brand_name_zh;
        }

    }else {
        if ([self.brandDouble.brand_name_zh isEqualToString:@""]) {
            label.text = self.brandDouble.brand_name_en;
        }else {
            label.text = self.brandDouble.brand_name_zh;
        }

    }
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:19];
    [headView addSubview:label];
    [label release];
    
    UIImageView *backHead = [[UIImageView alloc] initWithFrame:CGRectMake(239, 148, 62, 66)];
    backHead.image = [UIImage imageNamed:@"marketIcondefaultImage.png"];
    [headView addSubview:backHead];
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(240, 150, 60, 60)];
    
    if (_isJump) {
        [headerImage setImageWithURL:[NSURL URLWithString:self.store.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
    }else {
        [headerImage setImageWithURL:[NSURL URLWithString:self.brandDouble.brand_icon] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
    }
    
    headerImage.layer.cornerRadius = 10;
    headerImage.layer.masksToBounds = YES;
    [headView addSubview:headerImage];
    [headerImage release];
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _praiseBtn.frame = CGRectMake(20, 210, 25, 25);
    [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavNumIcon.png"] forState:UIControlStateNormal];
    [_praiseBtn addTarget:self action:@selector(praiseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:_praiseBtn];
    
    _praiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 215, 30, 25)];
    _praiseLabel.textColor = [UIColor lightGrayColor];
    _praiseLabel.text = @"0";
    [headView addSubview:_praiseLabel];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 240, 320, 2)];
    lineImage.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [headView addSubview:lineImage];
    [lineImage release];
    
    return [headView autorelease];
}

- (void)praiseBtnClick {
    [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavedNumIcon.png"] forState:UIControlStateNormal];
    
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
