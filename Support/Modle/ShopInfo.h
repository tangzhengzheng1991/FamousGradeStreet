//
//  ShopInfo.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopInfo : NSObject

@property (nonatomic, copy) NSString *shop_id;
@property (nonatomic, copy) NSString *shop_name;
@property (nonatomic, copy) NSString *favorite_number;
@property (nonatomic, copy) NSString *shop_address;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *coupon_num;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "shopInfo":[
 {
    "shop_id":"2618",
    "shop_name":"69上海青城中",
    "favorite_number":"1",
    "shop_address":"上海市青浦区城中东路374-376号",
    "distance":"787820.793968384",
    "coupon_num":1
 },

 */