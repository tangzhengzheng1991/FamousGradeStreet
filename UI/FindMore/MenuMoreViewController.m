//
//  MenuMoreViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-23.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MenuMoreViewController.h"
#import "FindMoreCell.h"
#import "NextOneViewController.h"


@interface MenuMoreViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray * _indexArray;
    NSMutableArray * _showArray;
    UIScrollView * _scollView;
    float colHeight[2];
    int currentIndex;
    NSArray *_storeIds;
}


@end

@implementation MenuMoreViewController

- (void)dealloc
{
    self.searchName = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationController.navigationBar.backgroundColor=[UIColor yellowColor];
    
    _scollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    _scollView.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _scollView.delegate=self;
    
    [self.view addSubview:_scollView];
    [_scollView release];
    
    //创建表
    for (int i=0; i<2; i++)
    {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectMake(7+157*i, 10, 150,_scollView.frame.size.height-10) style:UITableViewStylePlain];
        
        tableView.scrollEnabled=NO;
        tableView.tag=i+1;
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor=[UIColor clearColor];
        [_scollView addSubview:tableView];
                
    }
    
    _indexArray =[[NSMutableArray alloc]init];
    //_indexArray数组的第0个位置是一个数组
    _indexArray[0] = [NSMutableArray array];
    _indexArray[1] = [NSMutableArray array];
    //需要展示的数据model的集合 全部的数据
    _showArray=[[NSMutableArray alloc]init];
    
    if (!_searchName || _TableIndex != 300) {
        // 是每次都创建一次,
        _storeIds = [[NSArray alloc] initWithObjects:@"19",@"22",@"23",@"25",@"27", nil];
    }
    
}

- (void)setTableIndex:(int)TableIndex
{
    _TableIndex = TableIndex;
    
    NSLog(@"index-->%d",_TableIndex);
    
    [self svpullToRefresh];
   
}

- (void)setSearchName:(NSString *)searchName
{
    _searchName = searchName;
    NSLog(@"___searchanme-->%@",_searchName);
    
    if ([_searchName isEqualToString:@""] || [_searchName isKindOfClass:[NSNull class]] || _searchName==nil) {
        
        [self animationPointOut];
        
        return;
    }else{
        [self svpullToRefresh];
    }
    
}

- (void)animationPointOut
{
    UIImageView *picImage = [[UIImageView alloc] initWithFrame:CGRectMake(110, 140, 120, 110)];
    picImage.image = [UIImage imageNamed:@"NoInformationBg.png"];
    [self.view addSubview:picImage];
    [picImage release];
    
    UILabel *picLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, 320, 30)];
    picLab.text = @"真遗憾，没有更多宝贝喔!";
    picLab.textAlignment = NSTextAlignmentCenter;
    picLab.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:picLab];
    [picLab release];
}

- (void)svpullToRefresh
{
    [_scollView addPullToRefreshWithActionHandler:^{
        currentIndex = 0;
        [self requestData];
    }];
    
    [_scollView addInfiniteScrollingWithActionHandler:^{
        currentIndex ++;
        [self requestData];
    }];
    
    [_scollView triggerPullToRefresh];
}


-(void)requestData
{
    if (_searchName) {
        [HTTPRequestEnding searchShopRequestWithShopName:_searchName page:currentIndex+1 completion:^(NSMutableArray *retureArray, int goodsNum) {
            if (goodsNum<=0) {
                [self animationPointOut];
                [_scollView.pullToRefreshView stopAnimating];
            }else{
                [self resourceWithArray:retureArray];}
        }];
    }else{
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
    }}
}

- (void)resourceWithArray:(NSArray *)array
{
    if (currentIndex == 0) {
        [_showArray removeAllObjects];
    }
    [_showArray addObjectsFromArray:array];
    
    [self reloadTableView];
    
    if (currentIndex == 0) {
        [_scollView.pullToRefreshView stopAnimating];
    }else{
        [_scollView.infiniteScrollingView stopAnimating];
    }
}


-(void)reloadTableView
{
    //下拉刷新 column
    if (currentIndex == 0)
    {
        //重置列高、索引数组  刷新后重置数据
        //colHeight[0] colHeight[]数组索引为0的值
        colHeight[0]=0.0;
        colHeight[1]=0.0;
        _indexArray[0] = [NSMutableArray array];
        _indexArray[1] = [NSMutableArray array];
    }
    
    //当前已加载的总条数
    int startIndex = 0;
    for (NSMutableArray *arr in _indexArray) {
        startIndex += arr.count;
    }
    //20
    // 继续添加数据 计算出每个表的高度  准确来说是计算表的内容大小
    for (int i= startIndex; i<_showArray.count; i++)
    {
        //i=20
        GoodStore * good = _showArray[i];
        float height = [good.height floatValue];
        float width = [good.width floatValue];
        
        //等比缩放 宽高同时除以150
        height= height*150/width;
        width=150.0;
        
        good.height=[NSString stringWithFormat:@"%f",height];
        good.width=[NSString stringWithFormat:@"%f",width];
        
        //三位运算符 确定该次放哪边 0放左边 1右边
        int index = colHeight[0]<=colHeight[1] ? 0 : 1;
        
        //先取出该列已有高度
        float currentHeight = colHeight[index];
        
        //第index列的索引数组里 增加索引
        [_indexArray[index] addObject:[NSNumber numberWithInt:i]];
        
        //增加完后 给currentHeight赋值
        currentHeight += ([good.height floatValue]+60);
        //更新该列的高度
        colHeight[index]=currentHeight;
    }
    
    float maxHeight = 0.0f;
    for (int i = 0; i < 2 ; i++)
    {
        UITableView *tview = (UITableView *)[_scollView viewWithTag:i+1];
        [tview reloadData];
        // 获取表的内容大小 再赋给_ScrollView
        if (maxHeight <tview.contentSize.height) {
            maxHeight = tview.contentSize.height;
        }
        // {150, 3925.926}  {150, 3845.916} 这是默认的么???
        // {150, 1345.7781}  {150, 1276.9341} 是个临时随机分配的么???
//        NSLog(@"table.contentSize---%@",NSStringFromCGSize(tview.contentSize));
    }
    // 这就是把表的ScrollEnable=NO 也能滑动得原因
    _scollView.contentSize=CGSizeMake(320, maxHeight);
    
    // 不知道有啥用 不用也没事
    //    float y = _scollView.contentOffset.y;
    //    if (y > 100) {
    //        [_scollView setContentOffset:CGPointMake(0.0f, y-2) animated:YES];
    //
    //    }
}

#pragma mark tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FindMoreCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil)
    {
        cell=[[[FindMoreCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"]autorelease];
        cell.backgroundColor=[UIColor clearColor];
        
    }
    //根据tableView的tag值 确定一个index
    int index = tableView.tag == 1?0:1;
    //根据index确定哪个数组的数据要给哪个tableView显示
    NSMutableArray *arr = _indexArray[index];
    //该行处放的对象在_showArray中的索引
    NSNumber *number = arr[indexPath.row];
    //_showArray存放全部数据对象的数组
    GoodStore * list = _showArray[[number integerValue]];
    
    cell.good = list;
    
    cell.picBtn.userInteractionEnabled = NO;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    GoodStore * list = _showArray[[number integerValue]];
    return [list.height floatValue]+90.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    GoodStore * list = _showArray[[number integerValue]];
    NSLog(@"list--->%@",list.goodName);
    
    NextOneViewController *nextOne = [[NextOneViewController alloc] init];
    if (_TableIndex == 300) {
        nextOne.isMain = YES;
    }
    nextOne.good = list;
    [self.navigationController pushViewController:nextOne animated:YES];
    [nextOne release];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float y = scrollView.contentOffset.y;
//    NSLog(@"Scroll-->%@",NSStringFromCGPoint(_scollView.contentOffset));
    
    if (y< 0) {
        return;
    }
    for (UIView * view in scrollView.subviews)
    {
        
        if ([view isKindOfClass:[UITableView class]])
        {
            UITableView * tview =(UITableView *)view;
            //判断最多拉到下边的高度
            float maxHeight =tview.contentSize.height-tview.frame.size.height;
            if (y>= (maxHeight))
            {
                continue;// 一个break语句只向外跳一层。
                // continue语句的作用是跳过循环本中剩余的语句而强行执行下一次循环。continue语句只用在for、while、do-while等循环体中,常与if条件语句一起使用,用来加速循环
            }
//            NSLog(@"tableoffset---->%@",NSStringFromCGPoint(tview.contentOffset));
            
            tview.contentOffset= scrollView.contentOffset;
            // 对表的 y 值进行修改 让其始终保持一致
            tview.frame = CGRectMake(tview.frame.origin.x,y+10, tview.frame.size.width, tview.frame.size.height);
        }
    }
    
}


@end
