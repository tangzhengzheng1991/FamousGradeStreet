//
//  HTTPRequestEnding.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "HTTPRequestEnding.h"

@implementation HTTPRequestEnding

#pragma mark - 获取首页上方幻灯片的数据

+ (void)getHeadScrollComplete:(void(^)(NSMutableArray *headScrollArray))complete {
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/get-head"]];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"解析之前数据-->>%@",json);
        
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            HeadScroll *scroll = [[HeadScroll alloc] initWithDictionary:dictionary];
            [resultArray addObject:scroll];
            [scroll release];
            //            NSLog(@"resultArray-->>%d",resultArray.count);
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 获取首页品牌的数据

+ (void)getRecomsamllComplete:(void(^)(NSMutableArray *recomsamllArray,NSMutableArray *recombigArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/brand-store-list"]];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *recom_small = [json objectForKey:@"recom_small"];
        NSMutableArray *recom_smallArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in recom_small) {
            Recomsamll *recomsamll = [[Recomsamll alloc] initWithDictionary:dictionary];
            [recom_smallArray addObject:recomsamll];
            [recomsamll release];
        }
        
        NSMutableArray *recom_big = [json objectForKey:@"recom_big"];
        NSMutableArray *recom_bigArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in recom_big) {
            Recombig *recombig = [[Recombig alloc] initWithDictionary:dictionary];
            [recom_bigArray addObject:recombig];
            [recombig release];
        }
        
        if (complete) {
            complete(recom_smallArray,recom_bigArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getBrandListComplete:(void(^)(NSMutableArray *brandListArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/brand-store-list"]];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            Result *result = [[Result alloc] initWithDictionary:dictionary];
            [resultArray addObject:result];
            [result release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 获取首页商场的数据

+ (void)getShoppingDataComplete:(void(^)(NSMutableArray *recomImgArray,NSMutableArray *hotCircleArray,NSMutableArray *marketRecomArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/market-index"]];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *result = [json objectForKey:@"result"];
        NSMutableArray *recom_img = [result objectForKey:@"recom_img"];
        NSMutableArray *recomImgArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in recom_img) {
            RecomImg *recomImg = [[RecomImg alloc] initWithDictionary:dictionary];
            [recomImgArray addObject:recomImg];
            [recomImg release];
        }
        
        
        NSMutableArray *hot_circle = [result objectForKey:@"hot_circle"];
        NSMutableArray *hotCircleArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in hot_circle) {
            Hotcircle *hotCircle = [[Hotcircle alloc] initWithDictionary:dictionary];
            [hotCircleArray addObject:hotCircle];
            [hotCircle release];
        }
        
        
        NSMutableArray *market_recom = [result objectForKey:@"market_recom"];
        NSMutableArray *marketRecomArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in market_recom) {
            MarketRecom *marketRecom = [[MarketRecom alloc] initWithDictionary:dictionary];
            [marketRecomArray addObject:marketRecom];
            [marketRecom release];
        }
        
        if (complete) {
            complete(recomImgArray,hotCircleArray,marketRecomArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 获取首页特卖的数据
+ (void)getSaleComplete:(void(^)(NSMutableArray *specialArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://promo.mpning.com/api/index/special"]];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            Special *special = [[Special alloc] initWithDictionary:dictionary];
            [resultArray addObject:special];
            [special release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getSaleOverComplete:(void(^)(NSMutableArray *overArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://promo.mpning.com/api/index/over"]];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            Special *special = [[Special alloc] initWithDictionary:dictionary];
            [resultArray addObject:special];
            [special release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 获取劵页面的数据POST
+ (void)getCouponComplete:(void(^)(NSMutableArray *couponArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/ticket-class"]];
    
    [request addPostValue:@(1) forKey:@"page"];
    [request addPostValue:@(34.722031) forKey:@"lat"];
    [request addPostValue:@(113.741234) forKey:@"lng"];
    [request addPostValue:@(1) forKey:@"class"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"json-->>%@",json);
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            BrandCoupon *brandCoupon = [[BrandCoupon alloc] initWithDictionary:dictionary];
            [resultArray addObject:brandCoupon];
            [brandCoupon release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getCouponTwoComplete:(void(^)(NSMutableArray *couponTwoArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/ticket-class"]];
    
    [request addPostValue:@(1) forKey:@"page"];
    [request addPostValue:@(34.722031) forKey:@"lat"];
    [request addPostValue:@(113.741234) forKey:@"lng"];
    [request addPostValue:@(2) forKey:@"class"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"json-->>%@",json);
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            CouponTwo *couponTwo = [[CouponTwo alloc] initWithDictionary:dictionary];
            [resultArray addObject:couponTwo];
            [couponTwo release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getCouponEndComplete:(void(^)(NSMutableArray *couponEndArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/ticket-class"]];
    
    [request addPostValue:@(1) forKey:@"page"];
    [request addPostValue:@(34.722031) forKey:@"lat"];
    [request addPostValue:@(113.741234) forKey:@"lng"];
    [request addPostValue:@(3) forKey:@"class"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"json-->>%@",json);
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            EndCoupon *endCoupon = [[EndCoupon alloc] initWithDictionary:dictionary];
            [resultArray addObject:endCoupon];
            [endCoupon release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}
//http://buy.mplife.com/api/goods/ticket-class
//http://buy.mplife.com/api/goods/ticket-class

#pragma mark - 获取附近宝贝的数据
+ (void)getNearbyComplete:(void(^)(NSMutableArray *babyNearbyArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/scan-list"]];
    
//lat=34.72203&lng=113.7412&distance=500&rid=&cid=&page=1&type=good
    
    [request addPostValue:@(34.72216) forKey:@"lat"];
    [request addPostValue:@(113.7412) forKey:@"lng"];
    [request addPostValue:@(500) forKey:@"distance"];
    [request addPostValue:@(1) forKey:@"page"];
    [request addPostValue:@"good" forKey:@"type"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"json-->>%@",json);
        
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            Baby *baby = [[Baby alloc] initWithDictionary:dictionary];
            [resultArray addObject:baby];
            [baby release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 发现我的数据 -
#pragma mark - 首页数据

+ (void)findMainRequestWithPage:(int)page completion:(void(^)(NSArray *array))block
{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/pick"]];
    [request addPostValue:@(page) forKey:@"page"];
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *result = [json objectForKey:@"result"];
        NSMutableArray *parsers = [NSMutableArray array];
        
        for (NSDictionary *dict in result) {
            GoodStore *good = [[GoodStore alloc] initWhithDictionary:dict];
            [parsers addObject:good];
            [good release];
        }
        
        
        if (block && result != nil) {
            block(parsers);
        }else {
            NSLog(@"请检查网络");
            SHOWALERT(@"请检查网络")
            block(nil);
        }
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

#pragma mark - 配饰19, 女装22, 童装23, 鞋包25, 媚颜27

+ (void)findOtherRequestWhithStoreid:(int)storeId Whithpage:(int)page completion:(void(^)(NSArray *array))block
{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/store-good"]];
    [request addPostValue:@(storeId) forKey:@"store_id"];
    [request addPostValue:@(page) forKey:@"page"];
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *result = [json objectForKey:@"result"];
        NSMutableArray *parsers = [NSMutableArray array];
        
        for (NSDictionary *dict in result) {
            GoodStore *good = [[GoodStore alloc] initWhithDictionary:dict];
            [parsers addObject:good];
            [good release];
        }
        
        if (block && result != nil) {
            block(parsers);
        }else {
            NSLog(@"请检查网络");
            SHOWALERT(@"请检查网络")
            block(nil);
            
        }
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

/*首页:Post
 http://buy.mplife.com/api/goods/good-detail/gid/12728
 
 uuid=605d668f-0536-4e6f-9ec1-84437cb5d636
 &uname=mob_57585
 &page=1
 &pagesize=20*/

+ (void)findMainDoubleRequestWithGoodid:(NSString *)googid completion:(void(^)(NSDictionary *dict))block
{
    NSString *urlStr = [NSString stringWithFormat:@"http://buy.mplife.com/api/goods/good-detail/gid/%@",googid];
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [request addPostValue:@"1" forKey:@"page"];
    [request addPostValue:@"20" forKey:@"pagesize"];
    
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *dict = [json objectForKey:@"result"];
        
        //        GoodStore *good = [[GoodStore alloc] init];
        //        good.goodId = dict[@""];
        
        //        GoodStore *good = [[GoodStore alloc] initWhithDictionary:dict];
        
        if (block && dict != nil) {
            block(dict);
        }else {
            NSLog(@"请检查网络");
            SHOWALERT(@"请检查网络")
            block(nil);
        }
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}


/*其他
 http://buy.mplife.com/api/goods/good-view
 
 good_id=6508
 &uuid=605d668f-0536-4e6f-9ec1-84437cb5d636
 &uname=mob_57585&pagesize=20
 &page=1*/

+ (void)findOtherDoubleRequestWithGoodid:(NSString *)googid completion:(void(^)(NSDictionary *dict))block
{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/good-view"]];
    [request addPostValue:googid forKey:@"good_id"];
    [request addPostValue:@"20" forKey:@"pagesize"];
    [request addPostValue:@"1" forKey:@"page"];
    
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *dict = [json objectForKey:@"result"];
        //        GoodStore *good = [[GoodStore alloc] initWhithDictionary:dict];
        
        if (block && dict != nil) {
            block(dict);
        }else {
            NSLog(@"请检查网络");
            SHOWALERT(@"请检查网络")
            block(nil);
        }
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

#pragma mark - 获取品牌配饰数据
+ (void)getBrandDoubleWithStoreId:(NSString *)storeId page:(NSInteger)page complete:(void(^)(NSMutableArray *brandDoubleArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/brand-list-by-store"]];
    
    [request addPostValue:@(page) forKey:@"page"];
    [request addPostValue:storeId forKey:@"store_id"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"json-->>%@",json);
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            BrandDouble *brandDouble = [[BrandDouble alloc] initWithDictionary:dictionary];
            [resultArray addObject:brandDouble];
            [brandDouble release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getBrandThreeWithBrandId:(NSString *)brandId page:(int)page complete:(void(^)(Store *store))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/brand-view-home"]];
    
    //brand_id=2900&lng=113.7416&uuid=&uname=&lat=34.72268&page=1
    
    [request addPostValue:@(page) forKey:@"page"];
    [request addPostValue:brandId forKey:@"brand_id"];
    [request addPostValue:@(113.7412) forKey:@"lng"];
    [request addPostValue:@(34.72268) forKey:@"lat"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"json-->>%@",json);
        NSDictionary *brandInfo = [json objectForKey:@"brandInfo"];
        
        
        Store *store = [[Store alloc] initWithDictionary:brandInfo];
        NSLog(@"store:%@",store.brand_name_zh);
        if (complete) {
            complete(store);
        }
        }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getBrandShopWithBrandId:(NSString *)brandId page:(int)page complete:(void(^)(NSMutableArray *brandShopArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/brand-view-home"]];
    
    //brand_id=2900&lng=113.7416&uuid=&uname=&lat=34.72268&page=1
    
    [request addPostValue:@(page) forKey:@"page"];
    [request addPostValue:brandId forKey:@"brand_id"];
    [request addPostValue:@(113.7412) forKey:@"lng"];
    [request addPostValue:@(34.72268) forKey:@"lat"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"json-->>%@",json);
        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dictionary in result) {
            ShopID *shopId = [[ShopID alloc] initWithDictionary:dictionary];
            [resultArray addObject:shopId];
            [shopId release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 获取商场陆家嘴数据

+ (void)getMarketsWithCircleId:(NSString *)circleId page:(int)page complete:(void(^)(NSMutableArray *marketsArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/market-circle"]];
    
    //page=1&lat=34.722031&lng=113.741234&circle_id=11
    
    [request addPostValue:@(page) forKey:@"page"];
    [request addPostValue:@(34.722031) forKey:@"lat"];
    [request addPostValue:@(113.741234) forKey:@"lng"];
    [request addPostValue:circleId forKey:@"circle_id"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"json-->>%@",json);

        NSMutableArray *result = [json objectForKey:@"result"];
        NSMutableArray *resultArray = [NSMutableArray array];
        
        for (NSDictionary *dictionary in result) {
            MarketRecom *marketRecom = [[MarketRecom alloc] initWithDictionary:dictionary];
            [resultArray addObject:marketRecom];
            [marketRecom release];
        }
        if (complete) {
            complete(resultArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

+ (void)getMarketInfoWithMarketId:(NSString *)marketId complete:(void(^)(MarketInfo *marketInfo,NSMutableArray *marketShopInfoArray))complete {
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/market-view"]];
    
    [request addPostValue:marketId forKey:@"market_id"];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *result = [json objectForKey:@"result"];
        
        MarketInfo *marketInfo = [[MarketInfo alloc] initWithDictionary:result];
        NSLog(@"market:%@",marketInfo.market_name);
        
        NSMutableArray *shopInfo = [result objectForKey:@"shopInfo"];
        NSMutableArray *shopInfoArray = [NSMutableArray array];
        
        for (NSDictionary *dictionary in shopInfo) {
            MarketShopInfo *marketShopInfo = [[MarketShopInfo alloc] initWithDictionary:dictionary];
            [shopInfoArray addObject:marketShopInfo];
            [marketShopInfo release];
        }
        
        if (complete) {
            complete(marketInfo,shopInfoArray);
        }
    }];
    [request setFailedBlock:^{
        NSLog(@"error--%@",request.error);
    }];
    request.timeOutSeconds = 30;
    [request startAsynchronous];//启动异步请求
}

#pragma mark - 发送验证码

// 获取验证码  手机号 type:send
/*http://shtb.open.mplife.com/1.4/WCFService/getmessage
 
 reqmsg={"apply_type":"captcha","apply_message":{"type":"send","mobile":"13208964468","datacode":""},"apply_key":"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VNeHBVX1VTRMvn8sV%2FhYM7VA%3D%3D","apply_timestamp":"20141125120708"}*/

// 登录请求 手机号+验证码 type:auth
/*http://shtb.open.mplife.com/1.4/WCFService/getmessage
 
 reqmsg={"apply_type":"captcha","apply_message":{"type":"auth","mobile":"13208964468","datacode":"253163"},"apply_key":"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VNeHBVX1VTRMtXv5AW8fGtmw%3D%3D","apply_timestamp":"20141125120928"}*/
+ (void)sendCodeOrLoginWithType:(int)type phoneNumber:(NSString *)number  phoneCode:(NSString *)code completion:(void(^)(BOOL succeed))block
{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://shtb.open.mplife.com/1.4/WCFService/getmessage"]];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * s1 = [df stringFromDate:[NSDate date]];
    
    NSDate * date = [df dateFromString:s1];
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];//格式化
    [df2 setDateFormat:@"yyyyMMddHHmmss"];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [df2 setLocale:locale];
    NSString *numberDate = [df2 stringFromDate:date];
    
    NSString *typeStr = nil;
    if (type==0) {
        typeStr = @"send";
    }else{
        typeStr = @"auth";
    }
    
    NSDictionary *dictre = @{@"apply_type":@"captcha",@"apply_message":@{@"type":typeStr,@"mobile":number,@"datacode":code},@"apply_key":@"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VNeHBVX1VTRMvn8sV%2FhYM7VA%3D%3D",@"apply_timestamp":numberDate};
    NSLog(@"number-->%@",dictre);
    
    [df release];
    [df2 release];
    [locale release];
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dictre options:NSJSONWritingPrettyPrinted error:nil];
    //    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    [request addData:jsonData forKey:@"reqmsg"];
    
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dict = [json objectForKey:@"GetMessageResult"];
        NSLog(@"messsage--->%@",dict);
        if (block) {
            block(NO);
        }
        
        
        /*验证码
         {"GetMessageResult":"{\"returncode\":100,\"returnmessage\":\"succeed\",\"total\":1,\"result\":null}"}
         登录返回
         失败
         {"GetMessageResult":"{\"returncode\":201,\"returnmessage\":\"验证码错误，请重新输入\",\"total\":0,\"result\":null}"}
         成功
         {"GetMessageResult":"{\"returncode\":100,\"returnmessage\":\"succeed\",\"total\":1,\"result\":null}"}*/
        
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

#pragma mark - 登录

/*http://shtb.open.mplife.com/1.4/WCFService/getmessage
 
 reqmsg={"apply_type":"user","apply_message":{"type":"login","username":"Woshissbbb ","password":"jXyt7EC7F44%3D"},"apply_key":"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VN%2F6aJxwti1effF9DsKcwFaA%3D%3D","apply_timestamp":"20141125174637"}
 
 */

+ (void)userLoginRequestWithUsername:(NSString *)userName password:(NSString *)psw completion:(void(^)(BOOL succeed))block
{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://shtb.open.mplife.com/1.4/WCFService/getmessage"]];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * s1 = [df stringFromDate:[NSDate date]];
    
    NSDate * date = [df dateFromString:s1];
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];//格式化
    [df2 setDateFormat:@"yyyyMMddHHmmss"];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [df2 setLocale:locale];
    NSString *numberDate = [df2 stringFromDate:date];
    
    
    NSDictionary *dictre = @{@"apply_type":@"user",@"apply_message":@{@"type":@"login",@"username":userName,@"password":[psw MD5]},@"apply_key":@"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VN%2F6aJxwti1effF9DsKcwFaA%3D%3D",@"apply_timestamp":numberDate};
    NSLog(@"number-->%@",numberDate);
    
    [df release];
    [df2 release];
    [locale release];
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dictre options:NSJSONWritingPrettyPrinted error:nil];
    //    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    [request addData:jsonData forKey:@"reqmsg"];
    
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dict = [json objectForKey:@"GetMessageResult"];
        NSLog(@"messsage--->%@",dict);
        //        NSString *code = dict[@"returncode"];
        //        if ([code intValue] == 100) {
        //            NSLog(@"reture-->%d",[code intValue]);
        //            block(YES);
        //        }else{
        //            NSLog(@"reture-111->%d",[code intValue]);
        block(NO);
        //        }
        
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

#pragma mark - 意见反馈
/*reqmsg={"apply_type":"feedback","apply_message":{"type":"post","sn":"5A3ABE58-D545-4400-80A7-30C5C59760EE","message":"","username":"Woshissbbb"},"apply_key":"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VNBm4bBWnnTw0l2%2BExw8%2FYpw%3D%3D","apply_timestamp":"20141125173827"}*/
+ (void)suggestWithText:(NSString *)sugString completion:(void(^)(BOOL succeed))block
{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://shtb.open.mplife.com/1.4/WCFService/getmessage"]];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * s1 = [df stringFromDate:[NSDate date]];
    
    NSDate * date = [df dateFromString:s1];
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];//格式化
    [df2 setDateFormat:@"yyyyMMddHHmmss"];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [df2 setLocale:locale];
    NSString *numberDate = [df2 stringFromDate:date];
    
    
    NSDictionary *dictre = @{@"apply_type":@"feedback",@"apply_message":@{@"type":@"post",@"sn":@"5A3ABE58-D545-4400-80A7-30C5C59760EE",@"message":sugString,@"username":@"Woshissbbb"},@"apply_key":@"wBQOEIB6TtkUjfFn%2BH7OiP3KR9jXy6VN%2F6aJxwti1effF9DsKcwFaA%3D%3D",@"apply_timestamp":numberDate};
    NSLog(@"number-->%@",numberDate);
    
    [df release];
    [df2 release];
    [locale release];
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dictre options:NSJSONWritingPrettyPrinted error:nil];
    //    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    [request addData:jsonData forKey:@"reqmsg"];
    
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dict = [json objectForKey:@"GetMessageResult"];
        NSLog(@"messsage--->%@",dict);
        
        //        NSData  *strData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
        //        NSString *string = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];
        //        NSLog(@"string-->%@",string);
        //
        //        NSString *code = [dict objectForKey:@"returncode"];
        //        if ([code intValue] == 100) {
        //            NSLog(@"reture-->%d",[code intValue]);
        //            block(YES);
        //        }else{
        //            NSLog(@"reture-111->%d",[code intValue]);
        block(NO);
        //        }
        
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

#pragma mark - 进商店看看去...
/*http://buy.mplife.com/api/goods/shop-detail
 
 shop_id=2283&uuid=e704937f-ebf1-4aac-88ac-ce3e14f1c015&uname=Woshissbbb&lat=34.72216&lng=113.7412&pagesize=20&page=1*/
// longitude
// latitude
+ (void)gotoStoreRequestWithShopId:(int)shopid latitude:(float)lat longitude:(float)lng completion:(void(^)(NSDictionary *dict))block
{
    
    //    NSLog(@"gooid--->%d  %f  %f",shopid,lat,lng);
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/shop-detail"]];
    [request addPostValue:@(shopid) forKey:@"shop_id"];
    //    [request addPostValue:@"e704937f-ebf1-4aac-88ac-ce3e14f1c015" forKey:@"uuid"];
    //    [request addPostValue:@"Woshissbbb" forKey:@"uname"];
    [request addPostValue:@(34.72216) forKey:@"lat"];
    [request addPostValue:@(113.7412) forKey:@"lng"];
    [request addPostValue:@"20" forKey:@"pagesize"];
    [request addPostValue:@"1" forKey:@"page"];
    
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *dict = [json objectForKey:@"result"];
        //        GoodStore *good = [[GoodStore alloc] initWhithDictionary:dict];
        //        NSLog(@"---request-->%@",dict);
        if (block && dict != nil) {
            block(dict);
        }else {
            NSLog(@"请检查网络");
            SHOWALERT(@"请检查网络")
            block(nil);
        }
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}

/*更多宝贝
 http://buy.mplife.com/api/goods/search-shop
 
 page=1&sname=MP%E7%89%B9%E5%8D%96%E2%80%94%E4%B8%96%E8%B4%B8%E5%95%86%E5%9F%8E
 
 MP特卖—世贸商城(以上是编码)*/

+ (void)searchShopRequestWithShopName:(NSString *)sname page:(int)page completion:(void(^)(NSMutableArray *retureArray, int goodsNum))block
{
    
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://buy.mplife.com/api/goods/search-shop"]];
    
    [request addPostValue:@(page) forKey:@"page"];
    [request addPostValue:[sname stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:@"sname"];
    //    NSLog(@"sname-->%@",[sname stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    [request setTimeOutSeconds:30];
    
    [request setCompletionBlock:^{
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"json-->%@",json);
        NSDictionary *dict = [json objectForKey:@"result"];
        NSLog(@"总条数--->%@",dict[@"goodsNum"]);
        int number = [dict[@"goodsNum"] intValue];
        
        NSArray *arrayData = dict[@"data"];
        NSMutableArray *retureArray = [NSMutableArray array];
        
        for (NSDictionary *goodDict in arrayData) {
            GoodStore *good = [[GoodStore alloc] initWhithDictionary:goodDict];
            [retureArray addObject:good];
            [good release];
        }
        
        if (block && dict != nil) {
            block(retureArray,number);
        }else {
            NSLog(@"请检查网络");
            SHOWALERT(@"请检查网络")
            block(nil,0);
        }
    }];
    
    [request setFailedBlock:^{
        NSLog(@"error--%@",[request.error description]);
    }];
    
    [request startAsynchronous];
}


@end






