//
//  MenuSingleTableView.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MenuSingleTableView.h"
#import "NextOneViewController.h"
#import "FindSingleCell.h"

@interface MenuSingleTableView ()
{
    NSArray *_storeIds;
    int currentIndex;
}

@end

@implementation MenuSingleTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[FindSingleCell class] forCellReuseIdentifier:@"cell"];
    
    if (_TableIndex != 300) {
        // 是每次都创建一次,
        _storeIds = [[NSArray alloc] initWithObjects:@"19",@"22",@"23",@"25",@"27", nil];
    }
    
    self.singleArray = [NSMutableArray array];
}

- (void)setTableIndex:(int)TableIndex
{
    _TableIndex = TableIndex;
    
    NSLog(@"index-->%d",_TableIndex);
    
    [self svpullToRefresh];
    
}
- (void)svpullToRefresh
{
    [self.tableView addPullToRefreshWithActionHandler:^{
        currentIndex = 0;
        [self requestData];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        currentIndex ++;
        [self requestData];
    }];
    
    [self.tableView triggerPullToRefresh];
}
-(void)requestData
{
    // tableIndex 300~305
    if (_TableIndex == 300) {
        [HTTPRequestEnding findMainRequestWithPage:currentIndex+1 completion:^(NSArray *array) {
            
            [self resourceWithArray:array];
            
        }];
    }
    else  {
        
        [HTTPRequestEnding findOtherRequestWhithStoreid:[_storeIds[_TableIndex-301] intValue] Whithpage:currentIndex+1 completion:^(NSArray *array) {
            
            [self resourceWithArray:array];
        }];
    }
}

- (void)resourceWithArray:(NSArray *)array
{
    if (currentIndex == 0) {
        [_singleArray removeAllObjects];
    }
    [_singleArray addObjectsFromArray:array];
    
    [self.tableView reloadData];
    
    if (currentIndex == 0) {
        [self.tableView.pullToRefreshView stopAnimating];
    }else{
        [self.tableView.infiniteScrollingView stopAnimating];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.singleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    FindSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    GoodStore *good = [self.singleArray objectAtIndex:indexPath.row];
    cell.good = good;
    
//    cell.picBtn.tag = indexPath.row;
//    [cell.picBtn addTarget:self action:@selector(picBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.picBtn.userInteractionEnabled = NO;

    cell.backgroundColor = RGBA(219, 219, 219, 1);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    GoodStore *good = [self.singleArray objectAtIndex:indexPath.row];
    NextOneViewController *nextOne = [[NextOneViewController alloc] init];
    if (_isMain) {
        nextOne.isMain = YES;
    }
    nextOne.good = good;
    
    
    [self.navigationController pushViewController:nextOne animated:YES];
    [nextOne release];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodStore *good = [self.singleArray objectAtIndex:indexPath.row];
    float height = ([good.height floatValue]/[good.width floatValue])*310.0;
    return height+110;
}


@end
