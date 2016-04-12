//
//  NextOneViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-21.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "NextOneViewController.h"
#import "detailCell.h"
#import "GotoStoreViewController.h"
#import "MapOfStoreAddressViewController.h"
#import "MapSystemViewController.h"

@interface NextOneViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *_imageBG;
    
    UIScrollView *_scrollView;
    
    NSMutableArray * _indexArray;
    float colHeight[2];
    
    UIView *_viewHH;
    
    UILabel *timeL;
    UIButton *addrBtn;
}

@property (nonatomic, retain)NSMutableArray *arrayself;

@end

@implementation NextOneViewController

- (void)dealloc
{
    self.good = nil;
    self.dictNext = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"init");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewdidload");
    
    self.view.backgroundColor = RGBA(239, 239, 239, 1);
    
    self.tabBarController.tabBar.hidden = YES;
    _imageBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, ([_good.height floatValue]/[_good.width floatValue])*320.0)];
    [_imageBG setImageWithURL:[NSURL URLWithString:self.good.firstImg]];
    [self.view addSubview:_imageBG];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    [_scrollView addSubview:[self ceateTableHead]];
    
    
    for (int i=0; i<2; i++)
    {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectMake(3+158*i, 403, 155,_scrollView.frame.size.height-403) style:UITableViewStylePlain];
        
        tableView.scrollEnabled=NO;
        tableView.tag=i+1;
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor=RGBA(239, 239, 239, 1);;
        [_scrollView addSubview:tableView];
        
    }

    [self NextOneDataRequest];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 30, 50, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)NextOneDataRequest
{
    if (_isMain) {
        [HTTPRequestEnding findMainDoubleRequestWithGoodid:_good.goodId completion:^(NSDictionary *dict) {
            self.dictNext = dict;
            [self heightDecide];
        }];
    }else {
        [HTTPRequestEnding findOtherDoubleRequestWithGoodid:_good.goodId completion:^(NSDictionary *dict) {
            self.dictNext = dict;
            [self heightDecide];
        }];
    }
}

- (void)heightDecide

//- (void)setDictNext:(NSDictionary *)dictNext
{
//    _dictNext = dictNext;
    
    timeL.text = _dictNext[@"created"];
    [addrBtn setTitle:_dictNext[@"shop_address"] forState:UIControlStateNormal];
    
    _indexArray =[[NSMutableArray alloc]init];
    //_indexArray数组的第0个位置是一个数组
    _indexArray[0] = [NSMutableArray array];
    _indexArray[1] = [NSMutableArray array];
    
    self.arrayself = [NSMutableArray array];
    
    NSArray *arryDict = _dictNext[@"shop_img"];
    for (NSDictionary *dict in arryDict) {
        GoodStore *goodDict = [[GoodStore alloc] initWhithDictionary:dict];
        [self.arrayself addObject:goodDict];
        [goodDict release];
    }
    for (int i = 0; i<self.arrayself.count; i++) {
        GoodStore *goodDict = self.arrayself[i];
        float height = [goodDict.height floatValue];
        float width = [goodDict.width floatValue];
        
        //等比缩放 宽高同时除以150
        height= height*150/width;
        width=150.0;
        
        goodDict.height=[NSString stringWithFormat:@"%f",height];
        goodDict.width=[NSString stringWithFormat:@"%f",width];
        
        
        //三位运算符 确定该次放哪边 0放左边 1右边
        int index = colHeight[0]<=colHeight[1] ? 0 : 1;
        
        //先取出该列已有高度
        float currentHeight = colHeight[index];
        
        //第index列的索引数组里 增加索引
        [_indexArray[index] addObject:[NSNumber numberWithInt:i]];
        
        //增加完后 给currentHeight赋值
        currentHeight += ([goodDict.height floatValue]+60);
        //更新该列的高度
        colHeight[index]=currentHeight;
    }
    float maxHeight = 0.0f;
    for (int i = 0; i < 2 ; i++)
    {
        UITableView *tview = (UITableView *)[_scrollView viewWithTag:i+1];
        [tview reloadData];
        if (maxHeight <tview.contentSize.height) {
            maxHeight = tview.contentSize.height;
        }
    }
    
    _scrollView.contentSize=CGSizeMake(320, maxHeight+400);
    
    _viewHH.frame = CGRectMake(0, 400, 320, _scrollView.contentSize.height-400);
}

#pragma mark - Creat TableHeader

- (UIView *)ceateTableHead
{
    _viewHH = [[UIView alloc] init];//WithFrame:CGRectMake(0, 0, 320, 400)];
    _viewHH.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_viewHH];
    
    // 50 60 60 10 30
    UIView *viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 185, 320, 215)];
    viewHead.backgroundColor = RGBA(239, 239, 239, 1);
//    [viewHH addSubview:viewHead];
//    [viewHead release];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    view1.backgroundColor = [UIColor whiteColor];
    [viewHead addSubview:view1];
    [view1 release];
    
    UIView *viewline2 = [[UIView alloc] initWithFrame:CGRectMake(0, 110, 320, 1)];
    viewline2.backgroundColor = RGBA(228, 228, 228, 1);
    [viewHead addSubview:viewline2];
    [viewline2 release];
    
    UIView *viewline3 = [[UIView alloc] initWithFrame:CGRectMake(0, 170, 320, 1)];
    viewline3.backgroundColor = RGBA(228, 228, 228, 1);
    [viewHead addSubview:viewline3];
    [viewline3 release];
    
    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, -20, 50, 50)];
    headImg.layer.cornerRadius = 25;
    headImg.clipsToBounds = YES;
    [headImg setImageWithURL:[NSURL URLWithString:self.good.avatar] placeholderImage:[UIImage imageNamed:@"userHeaderDefault"]];
    [viewHead addSubview:headImg];
    [headImg release];
    
    // 用户名
    UILabel *userL = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 100, 20)];
    userL.text = self.good.userName;
    userL.textColor = RGBA(223, 96, 83, 1);
    userL.adjustsFontSizeToFitWidth = YES;
    userL.textColor = [UIColor redColor];
    [viewHead addSubview:userL];
    [userL release];
    
    UIImageView *fovaImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"marketFavNumIcon"]];
    fovaImg.frame = CGRectMake(190, 20, 20, 20);
    [viewHead addSubview:fovaImg];
    [fovaImg release];
    
    UILabel *favL = [[UILabel alloc] initWithFrame:CGRectMake(212, 22, 10, 20)];
    favL.text = self.good.favoriteNumber;
    favL.textColor = RGBA(146, 146, 146, 1);
    [viewHead addSubview:favL];
    [favL release];
    
    UIImageView *colImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favIconCowry"]];
    colImg.frame = CGRectMake(260, 20, 20, 20);
    [viewHead addSubview:colImg];
    [colImg release];
    
    UILabel *colL = [[UILabel alloc] initWithFrame:CGRectMake(282, 22, 10, 20)];
    colL.text = self.good.concernedNumber;
    colL.textColor = RGBA(146, 146, 146, 1);
    [viewHead addSubview:colL];
    [colL release];
    
    UILabel *goodNL = [[UILabel alloc] initWithFrame:CGRectMake(10 , 60, 160, 20)];
    goodNL.text = self.good.goodName;
    goodNL.adjustsFontSizeToFitWidth = YES;
    [viewHead addSubview:goodNL];
    [goodNL release];
    
    //时间
    timeL = [[UILabel alloc] initWithFrame:CGRectMake(10 , 80, 90, 20)];
    
    timeL.textColor = RGBA(145, 145, 145, 1);
    timeL.font = [UIFont systemFontOfSize:15];
    [viewHead addSubview:timeL];
    [timeL release];
    
    // 价格
    UILabel *moneyL = [[UILabel alloc] initWithFrame:CGRectMake(180, 65, 70, 30)];
    moneyL.textColor = RGBA(223, 96, 83, 1);
    moneyL.text = [NSString stringWithFormat:@"¥ %d",[self.good.disPrice intValue]];
    moneyL.font = [UIFont boldSystemFontOfSize:20];
    moneyL.textColor = [UIColor redColor];
    [viewHead addSubview:moneyL];
    [moneyL release];
    
    
    UIImageView *firmImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conFirmIconmiddle"]];
    firmImg.frame = CGRectMake(15, 125, 31, 29);
    [viewHead addSubview:firmImg];
    [firmImg release];
    
    UILabel *litL = [[UILabel alloc] initWithFrame:CGRectMake(41, 135, 40, 17)];
    litL.text = @"onfirm";
    litL.textColor = RGBA(145, 145, 145, 1);
    litL.adjustsFontSizeToFitWidth = YES;
    [viewHead addSubview:litL];
    [litL release];
    
    // 商店地址
    addrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addrBtn.frame = CGRectMake(180, 120, 130, 20);
    
    addrBtn.titleLabel.textColor = RGBA(95, 95, 95, 1);
    
    addrBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    这行代码，把按钮的内容（控件）
//    的对齐方式修改为水平左对齐，但是这们会紧紧靠着左边，不好看，
//    所以我们还可以修改属性：
//    addrBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//    这行代码可以让按钮的内容（控件）距离左边10个像素，这样就好看多了
    
//    addrBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    addrBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [addrBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addrBtn addTarget:self action:@selector(gotoMap) forControlEvents:UIControlEventTouchUpInside];
    [viewHead addSubview:addrBtn];
    
    // 地标图
    UIImageView *addrImg = [[UIImageView alloc] initWithFrame:CGRectMake(160, 120, 15, 20)];
    addrImg.image = [UIImage imageNamed:@"marketDistanceIcon"];
    [viewHead addSubview:addrImg];
    [addrImg release];
    
    // 卖场
    UIButton *aveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    aveBtn.frame = CGRectMake(0, 180, 320, 35);
    aveBtn.backgroundColor = RGBA(83, 83, 83, 1);
    aveBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    aveBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
//    aveBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [aveBtn setTitle:self.good.shopName forState:UIControlStateNormal];
    [aveBtn addTarget:self action:@selector(gotoStore) forControlEvents:UIControlEventTouchUpInside];
    
    [viewHead addSubview:aveBtn];
    
    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(290, 7, 11, 20)];
    arrowImg.image = [UIImage imageNamed:@"PageArrowIcon"];
    [aveBtn addSubview:arrowImg];
    [arrowImg release];
    
    return [viewHead autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Map And Store
/**
 *  @author Crazy-Wind, 14-11-25 星期二 10:11:23
 *
 *  请告诉我good.lng And good.lat
 */
- (void)gotoMap
{
    NSLog(@"定位去...");
    
    MapSystemViewController *map = [[MapSystemViewController alloc] init];
    
    [self.navigationController pushViewController:map animated:YES];
    [map release];
}
/**
 *  @author Crazy-Wind, 14-11-27 星期四 09:11:02
 * shopid
 *  "lng": "121.514481",
 "lat": "31.300732",
 */
- (void)gotoStore
{
    NSLog(@"进店看看");
    GotoStoreViewController *store = [[GotoStoreViewController alloc] init];
    store.shopId = [_good.shopId intValue];
//    store.goodId = [_good.goodId intValue];
    store.latAndLng = CGPointMake([_dictNext[@"lat"] floatValue], [_dictNext[@"lng"] floatValue]);
    [self.navigationController pushViewController:store animated:YES];
    [store release];
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
    detailCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil)
    {
        cell=[[[detailCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"]autorelease];
        cell.backgroundColor=[UIColor clearColor];
    }
    
    //根据tableView的tag值 确定一个index
    int index = tableView.tag == 1?0:1;
    //根据index确定哪个数组的数据要给哪个tableView显示
    NSMutableArray *arr = _indexArray[index];
    //该行处放的对象在_showArray中的索引
    NSNumber *number = arr[indexPath.row];
    //_showArray存放全部数据对象的数组
    GoodStore * list = _arrayself[[number integerValue]];
    
    cell.good = list;
    cell.picBtn.userInteractionEnabled = NO;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    GoodStore * list = _arrayself[[number integerValue]];
    return [list.height floatValue]+90.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    GoodStore * list = _arrayself[[number integerValue]];
    NSLog(@"NextOne--->%@",list.goodName);
    
    
    NextOneViewController *nextTwo = [[NextOneViewController alloc] init];
    nextTwo.good = list;
    [self.navigationController pushViewController:nextTwo animated:YES];
    [nextTwo release];
    
    
}



#pragma mark - ScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    float y = scrollView.contentOffset.y;
    CGRect rect = _imageBG.frame;

    if (y< 0) {
        rect.origin.y = ABS(y)/8;
        rect.size.height = ABS(y)/5+350;
        _imageBG.frame = rect;
 //        return;
    }else{
    
    rect.origin.y = -ABS(y)/3;
    rect.size.height = 350-ABS(y)/5;
    _imageBG.frame = rect;
    
    for (UIView * view in scrollView.subviews)
    {
        
        if ([view isKindOfClass:[UITableView class]])
        {
            UITableView * tview =(UITableView *)view;
            //判断最多拉到下边的高度
            float maxHeight = tview.contentSize.height-tview.frame.size.height;
            if (y>= (maxHeight+400))
            {
                continue;
            }
            if (y>400)
            {
                tview.contentOffset= CGPointMake(scrollView.contentOffset.x, y-400);
                tview.frame = CGRectMake(tview.frame.origin.x,y+3, tview.frame.size.width, tview.frame.size.height);
            }
            else
            {//当滑动的contentOffSet的Y小于100时，tableView跟随黄色view往上走
                tview.frame = CGRectMake(tview.frame.origin.x,400+3, tview.frame.size.width, tview.frame.size.height+y);
                tview.contentOffset= CGPointMake(scrollView.contentOffset.x, 0);
            }
        }
    }}
    
}


- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}




@end
