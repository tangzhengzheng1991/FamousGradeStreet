//
//  MarketRecom.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarketRecom : NSObject

@property (nonatomic, copy) NSString *market_id;
@property (nonatomic, copy) NSString *market_name;
@property (nonatomic, copy) NSString *market_address;
@property (nonatomic, copy) NSString *logo_img;
@property (nonatomic, copy) NSString *shop_num;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "market_id":"6",
 "market_name":"置地广场",
 "market_address":"南京东路409-459号",
 "logo_img":"http://img5.mplife.com/buy/market/2014/09/12/1410491195986109306.jpg",
 "shop_num":"193"
 
 {
 "market_id": "183",
 "market_name": "国金中心商场",
 "market_address": "世纪大道8号",
 "logo_img": "http://img5.mplife.com/buy/market/2014/10/23/1414029684487701266.jpg",
 "distance": "813479.535075124",
 "shop_num": "2"
 }
 */