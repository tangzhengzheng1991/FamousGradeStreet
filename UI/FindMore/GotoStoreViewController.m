//
//  GotoStoreViewController.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "GotoStoreViewController.h"
#import "ShopStore.h"
#import "Ticket.h"
#import "StoreMoreBabyViewController.h"
#import "NextOneViewController.h"
#import "detailCell.h"
#import "MapSystemViewController.h"

@interface GotoStoreViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    UIButton *_praiseBtn;
    BOOL _isPraise;
    
    UIScrollView *_scrollView;
    
    NSMutableArray * _indexArray;
    float colHeight[2];
    
    UIButton *_promptBtn;
    
    
    float _basicHeight;
    
    UIView *_whiteView;
}

@property (nonatomic, retain)ShopStore *shopS;
@property (nonatomic, retain)NSMutableArray *arrayself;

@end

@implementation GotoStoreViewController


- (void)dealloc
{
    self.storeDict = nil;
    self.shopS = nil;
    self.arrayself = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"---->%@----%d",NSStringFromCGPoint(self.latAndLng),self.shopId);
    
    // longitude
    // latitude
    
    [HTTPRequestEnding gotoStoreRequestWithShopId:self.shopId latitude:self.latAndLng.x longitude:self.latAndLng.y completion:^(NSDictionary *dict) {
//        self.storeDict = dict;
//        NSLog(@"dict--->%@",dict);
        self.shopS = [[[ShopStore alloc] initWhithDictionary:dict] autorelease];
        
        NSLog(@"_shopsStan-->%@,%@",_shopS.lat,_shopS.lng);
        [self customView];
    }];
    
    
}

- (void)customView
{
    

    // 背景图
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    backImage.image = [UIImage imageNamed:@"img_shop_default.jpg"];
    [self.view addSubview:backImage];
    [backImage release];
    
    // scrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(320, VHEIGHT);
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_scrollView];
    [_scrollView release];
    
    // scrollView 加白底
    _whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 230, 320, _scrollView.contentSize.height-230)];
    _whiteView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_whiteView];
    [_whiteView release];
    
    // 波浪条
    UIImageView *samllImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 130, 320, 100)];
    samllImage.image = [UIImage imageNamed:@"brand_detail_desc.png"];
    [_scrollView addSubview:samllImage];
    [samllImage release];
    
    // 店名
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 155, 95, 35)];
//    label.text = _shopS.shop_name;
//    label.textAlignment = NSTextAlignmentCenter;
//    [scrollView addSubview:label];
//    [label release];

    // 地名
    UILabel *labelPlace = [[UILabel alloc] initWithFrame:CGRectMake(10, 185, 300, 30)];
    labelPlace.text = [NSString stringWithFormat:@"地点:%@",_shopS.shop_address];
    labelPlace.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:labelPlace];
    [labelPlace release];
    
    // 图版
    UIImageView *backHead = [[UIImageView alloc] initWithFrame:CGRectMake(239, 128, 62, 66)];
    backHead.image = [UIImage imageNamed:@"marketIcondefaultImage.png"];
    [_scrollView addSubview:backHead];
    [backHead release];
    
    // 店标图
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(240, 130, 60, 60)];
    [headerImage setImageWithURL:[NSURL URLWithString:_shopS.shop_img] placeholderImage:[UIImage imageNamed:@"brand_default_icon.png"]];
//    headerImage.layer.cornerRadius = 10;
//    headerImage.layer.masksToBounds = YES;
    [_scrollView addSubview:headerImage];
    [headerImage release];
    
    // 电话 MarketDetailPhoneIcon
    if (![_shopS.phone isEqualToString:@""]) {
        UIButton *callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        callBtn.frame = CGRectMake(10, 235, 20, 20);
        callBtn.tag = 300;
        [callBtn setBackgroundImage:[UIImage imageNamed:@"MarketDetailPhoneIcon"] forState:UIControlStateNormal];
        [callBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:callBtn];
        
        UILabel *callLab = [[UILabel alloc] initWithFrame:CGRectMake(33, 235, 150, 20)];
        callLab.text = _shopS.phone;
        [_scrollView addSubview:callLab];
        [callLab release];
    }
    
    // 心
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _praiseBtn.frame = CGRectMake(190, 235, 20, 20);
    [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavNumIcon.png"] forState:UIControlStateNormal];
    [_praiseBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _praiseBtn.tag = 100;
    [_scrollView addSubview:_praiseBtn];
    
    // 心数
    UILabel *_praiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(215, 235, 20, 25)];
    _praiseLabel.textColor = [UIColor lightGrayColor];
    _praiseLabel.text = _shopS.favorite_number;
    _praiseLabel.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:_praiseLabel];
    
    // 地标图
    UIButton *_positionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _positionBtn.frame = CGRectMake(240, 235, 15, 20);
    [_positionBtn setBackgroundImage:[UIImage imageNamed:@"marketDistanceIcon.png"] forState:UIControlStateNormal];
    [_positionBtn addTarget:self action:@selector(praiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _positionBtn.tag = 200;
    [_scrollView addSubview:_positionBtn];
    
    // 距离
    UILabel* _positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 235, 60, 25)];
    _positionLabel.textColor = [UIColor lightGrayColor];
    _positionLabel.text = [NSString stringWithFormat:@"%lldm",[_shopS.distance longLongValue]];
    NSLog(@"distance--->%@",_shopS.distance);
    _positionLabel.font = [UIFont systemFontOfSize:13];
    [_scrollView addSubview:_positionLabel];
    
    // 线
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 260, 320, 10)];
    lineImage.image = [UIImage imageNamed:@"marketDetail_line.png"];
    [_scrollView addSubview:lineImage];
    [lineImage release];
    
    // 票 list_line_for_iphone线  img_coupon劵
    if (_shopS.ticket) {
        for (int i=0; i<_shopS.ticket.count; i++) {
            
            Ticket *ticket = _shopS.ticket[i];
            UIButton *couponBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            couponBtn.tag = 1000+i;
            couponBtn.frame = CGRectMake(0, 270+i*44, 320, 44);
            couponBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            
            couponBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            couponBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
            [couponBtn setTitle:ticket.ticket_title forState:UIControlStateNormal];
            [couponBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [couponBtn addTarget:self action:@selector(couponBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:couponBtn];
            
            UIImageView *imagecoup = [[UIImageView alloc] initWithFrame:CGRectMake(20, 6, 45, 30)];
            imagecoup.image = [UIImage imageNamed:@"img_coupon"];
            [couponBtn addSubview:imagecoup];
            [imagecoup release];
            
            UILabel *moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 6, 40, 30)];
            //ticket.selling_price
            moneyLab.text = [NSString stringWithFormat:@" ¥%d",[ticket.selling_price intValue]];
            moneyLab.textColor = [UIColor whiteColor];
            moneyLab.font = [UIFont boldSystemFontOfSize:17];
            [couponBtn addSubview:moneyLab];
            [moneyLab release];
            
            UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 42, 310, 2)];
            lineImage.image = [UIImage imageNamed:@"list_line_for_iphone"];
            [couponBtn addSubview:lineImage];
            [lineImage release];
            
            if (i==_shopS.ticket.count-1) {
                // 线
                UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 270+_shopS.ticket.count*44, 320, 10)];
                lineImage.image = [UIImage imageNamed:@"marketDetail_line.png"];
                [_scrollView addSubview:lineImage];
                [lineImage release];
            }
        }
    }
    
    // 黑条按钮
    _promptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (_shopS.ticket) {
        _promptBtn.frame = CGRectMake(0, 270+44*_shopS.ticket.count+10, 320, 35);
    }else{
        _promptBtn.frame = CGRectMake(0, 270, 320, 35);
    }
    
    [_promptBtn setBackgroundImage:[UIImage imageNamed:@"NavigationBar_createdBg.png"] forState:UIControlStateNormal];
    [_promptBtn addTarget:self action:@selector(promptBtn) forControlEvents:UIControlEventTouchUpInside];
    _promptBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _promptBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_promptBtn setTitle:@"更多宝贝" forState:UIControlStateNormal];
    [_scrollView addSubview:_promptBtn];
    
    // 箭头
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 7, 10, 20)];
    arrowImage.image = [UIImage imageNamed:@"PageArrowIcon.png"];
    [_promptBtn addSubview:arrowImage];
    [arrowImage release];
    
    // 返回
    UIButton *goBackBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBackBtn.frame = CGRectMake(0, 25, 50, 30);
    [goBackBtn setBackgroundImage:[UIImage imageNamed:@"backIconImage.png"] forState:UIControlStateNormal];
    [goBackBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackBtn];
    
    _basicHeight = CGRectGetMaxY(_promptBtn.frame)+3;
    NSLog(@"--->%f",_basicHeight);
    
    for (int i=0; i<2; i++)
    {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectMake(3+158*i, _basicHeight, 155,_scrollView.frame.size.height-_basicHeight) style:UITableViewStylePlain];
        
        tableView.scrollEnabled=NO;
        tableView.tag=i+1;
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor=RGBA(239, 239, 239, 1);;
        [_scrollView addSubview:tableView];
        
    }
    
    
    
    [self heightDecide];
    
}




- (void)couponBtnClick:(UIButton *)btn
{
    //tag:1000~
    NSLog(@"查看劵...");
}

- (void)praiseBtnClick:(UIButton *)btn
{
    // 地标tag:200 心:100 电话300
    switch (btn.tag) {
        case 300:
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"我要再想想" destructiveButtonTitle:nil otherButtonTitles:_shopS.phone, nil];
            [actionSheet showInView:self.view];
            [actionSheet release];
            
            
//            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
//            NSURLRequest *request = [NSURLRequest requestWithURL:url];
//            [webView loadRequest:request];
//            [self.view addSubview:webView];
//            [webView release];
        }
            break;
        case 200:
        {
            NSLog(@"看看路线");
            
            MapSystemViewController *map = [[MapSystemViewController alloc] init];
            
            [self.navigationController pushViewController:map animated:YES];
            [map release];
            
        }
            break;
        case 100:
        {
            // 点赞了 marketFavedNumIcon
            _isPraise =! _isPraise;
            if (_isPraise) {
                [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavedNumIcon"] forState:UIControlStateNormal];
            }else{
                [_praiseBtn setBackgroundImage:[UIImage imageNamed:@"marketFavNumIcon.png"] forState:UIControlStateNormal];
            }
        }
            break;
            
        default:
            break;
    }    
    
}

#pragma mark - UIActionSheetDelegate -

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:{
            NSLog(@"访问设备的通讯功能");
            
            NSString *str = [NSString stringWithFormat:@"tel://%@",_shopS.phone];
            NSURL *url = [NSURL URLWithString:str];
            [[UIApplication sharedApplication] openURL:url];

            
//            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
//            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.marketInfo.tel]]];
//            [webView loadRequest:request];
//            [self.view addSubview:webView];
//            [webView release];
        }
            break;
        case 1:
            NSLog(@"我要再想想");
            break;
            
        default:
            break;
    }
}

- (void)promptBtn
{// 进入更多宝贝
    StoreMoreBabyViewController *more = [[StoreMoreBabyViewController alloc] init];
    more.searchName = _shopS.shop_name;
    [self.navigationController pushViewController:more animated:YES];
    [more release];
}


- (void)heightDecide

//- (void)setDictNext:(NSDictionary *)dictNext
{
    //    _dictNext = dictNext;
    
//    [_scrollView addSubview:[self ceateTableHead]];
    
    _indexArray =[[NSMutableArray alloc]init];
    _indexArray[0] = [NSMutableArray array];
    _indexArray[1] = [NSMutableArray array];
    
    self.arrayself = [NSMutableArray array];
    
    NSMutableArray *arryDict = _shopS.good_img;
    for (NSDictionary *dict in arryDict) {
        GoodStore *goodDict = [[GoodStore alloc] initWhithDictionary:dict];
        [self.arrayself addObject:goodDict];
        [goodDict release];
    }
    for (int i = 0; i<self.arrayself.count; i++) {
        GoodStore *goodDict = self.arrayself[i];
        float height = [goodDict.height floatValue];
        float width = [goodDict.width floatValue];
        
        height= height*150/width;
        width=150.0;
        
        goodDict.height=[NSString stringWithFormat:@"%f",height];
        goodDict.width=[NSString stringWithFormat:@"%f",width];
        
        int index = colHeight[0]<=colHeight[1] ? 0 : 1;
        float currentHeight = colHeight[index];
        [_indexArray[index] addObject:[NSNumber numberWithInt:i]];
        currentHeight += ([goodDict.height floatValue]+60);
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
    
    _scrollView.contentSize=CGSizeMake(320, maxHeight+_basicHeight);
    
    _whiteView.frame = CGRectMake(0, 230, 320, _scrollView.contentSize.height-230);
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
    
    if (y< 0) {
        //        return;
    }else{
        
        for (UIView * view in scrollView.subviews)
        {
            
            if ([view isKindOfClass:[UITableView class]])
            {
                UITableView * tview =(UITableView *)view;
                //判断最多拉到下边的高度
                float maxHeight = tview.contentSize.height-tview.frame.size.height;
                if (y>= (maxHeight+_basicHeight))
                {
                    continue;
                }
                if (y>_basicHeight)
                {
                    tview.contentOffset= CGPointMake(scrollView.contentOffset.x, y-_basicHeight);
                    tview.frame = CGRectMake(tview.frame.origin.x,y, tview.frame.size.width, tview.frame.size.height);
                }
                else
                {
                    tview.frame = CGRectMake(tview.frame.origin.x,_basicHeight, tview.frame.size.width, tview.frame.size.height+y);
                    tview.contentOffset= CGPointMake(scrollView.contentOffset.x, 0);
                }
            }
        }}
    
}





- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
