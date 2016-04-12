//
//  MarketShopInfo.h
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarketShopInfo : NSObject

@property (nonatomic, copy) NSString *shop_id;
@property (nonatomic, copy) NSString *shop_name;
@property (nonatomic, copy) NSString *brand_icon;
@property (nonatomic, copy) NSString *brand_name_zh;
@property (nonatomic, copy) NSString *brand_name_en;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "shopInfo":[
 {
    "shop_id":"491",
    "shop_name":"星期六国金中心店",
    "brand_icon":"http://img5.mplife.com/buy/brand/2014/08/28/1409195677310613230.jpg",
    "brand_name_zh":"星期六",
    "brand_name_en":"ST&SAT"
 
 },
 */