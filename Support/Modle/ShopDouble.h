//
//  ShopDouble.h
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopDouble : NSObject

@property (nonatomic, copy) NSString *shop_id;
@property (nonatomic, copy) NSString *shop_name;
@property (nonatomic, copy) NSString *favorite_number;
@property (nonatomic, copy) NSString *shop_address;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *brand_id;
@property (nonatomic, copy) NSString *brand_name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *shop_img;
@property (nonatomic, copy) NSString *notice;
@property (nonatomic, copy) NSString *is_flag;
@property (nonatomic, copy) NSString *is_enable;
@property (nonatomic, copy) NSString *brand_icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 //公共的
 "shop_id":"1569",
 "shop_name":"中国黄金安亭店",
 "shop_address":"嘉定区安亭镇新源路566号",
 "lat":"31.295690",
 "lng":"121.155852",
 "favorite_number":"0",
 "distance":"782138.657414874",
 
 "brand_id":"2114",
 "brand_name":"中国黄金",
 "phone":"",
 "shop_img":"",
 "notice":"",
 "is_flag":"0",
 "is_enable":"0",
 "brand_icon":"http://img5.mplife.com/buy/brand/2014/08/28/1409196599804490201.jpg",
 "is_fav":false,
 "ticket":{

 */