//
//  HTTPRequestEnding.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
#import "ShopDouble.h"
#import "MarketInfo.h"

@interface HTTPRequestEnding : NSObject

#pragma mark - 获取首页上方幻灯片的数据
+ (void)getHeadScrollComplete:(void(^)(NSMutableArray *headScrollArray))complete;

#pragma mark - 获取首页品牌的数据
+ (void)getRecomsamllComplete:(void(^)(NSMutableArray *recomsamllArray,NSMutableArray *recombigArray))complete;
+ (void)getBrandListComplete:(void(^)(NSMutableArray *brandListArray))complete;

#pragma mark - 获取首页商场的数据
+ (void)getShoppingDataComplete:(void(^)(NSMutableArray *recomImgArray,NSMutableArray *hotCircleArray,NSMutableArray *marketRecomArray))complete;

#pragma mark - 获取首页特卖的数据
+ (void)getSaleComplete:(void(^)(NSMutableArray *specialArray))complete;
+ (void)getSaleOverComplete:(void(^)(NSMutableArray *overArray))complete;

#pragma mark - 获取劵的数据
+ (void)getCouponComplete:(void(^)(NSMutableArray *couponArray))complete;
+ (void)getCouponTwoComplete:(void(^)(NSMutableArray *couponTwoArray))complete;
+ (void)getCouponEndComplete:(void(^)(NSMutableArray *couponEndArray))complete;

#pragma mark - 获取附近宝贝的数据
+ (void)getNearbyComplete:(void(^)(NSMutableArray *babyNearbyArray))complete;

#pragma mark - 发现我的数据 -

+ (void)findMainRequestWithPage:(int)page completion:(void(^)(NSArray *array))block;
+ (void)findOtherRequestWhithStoreid:(int)storeId Whithpage:(int)page completion:(void(^)(NSArray *array))block;

+ (void)findMainDoubleRequestWithGoodid:(NSString *)googid completion:(void(^)(NSDictionary *dict))block;

+ (void)findOtherDoubleRequestWithGoodid:(NSString *)googid completion:(void(^)(NSDictionary *dict))block;

#pragma mark - 获取品牌配饰等数据
+ (void)getBrandDoubleWithStoreId:(NSString *)storeId page:(NSInteger)page complete:(void(^)(NSMutableArray *brandDoubleArray))complete;

+ (void)getBrandThreeWithBrandId:(NSString *)brandId page:(int)page complete:(void(^)(Store *store))complete;

+ (void)getBrandShopWithBrandId:(NSString *)brandId page:(int)page complete:(void(^)(NSMutableArray *brandShopArray))complete;


#pragma mark - 获取商场陆家嘴数据
+ (void)getMarketsWithCircleId:(NSString *)circleId page:(int)page complete:(void(^)(NSMutableArray *marketsArray))complete;

+ (void)getMarketInfoWithMarketId:(NSString *)marketId complete:(void(^)(MarketInfo *marketInfo,NSMutableArray *marketShopInfoArray))complete;


#pragma mark - 就是我的资料管理

+ (void)sendCodeOrLoginWithType:(int)type phoneNumber:(NSString *)number  phoneCode:(NSString *)code completion:(void(^)(BOOL succeed))block;
+ (void)userLoginRequestWithUsername:(NSString *)userName password:(NSString *)psw completion:(void(^)(BOOL succeed))block;
+ (void)suggestWithText:(NSString *)string completion:(void(^)(BOOL succeed))block;

+ (void)gotoStoreRequestWithShopId:(int)shopid latitude:(float)lat longitude:(float)lng completion:(void(^)(NSDictionary *dict))block;

+ (void)searchShopRequestWithShopName:(NSString *)sname page:(int)page completion:(void(^)(NSMutableArray *retureArray, int goodsNum))block;

@end
