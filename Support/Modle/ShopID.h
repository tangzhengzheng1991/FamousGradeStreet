//
//  ShopID.h
//  FamousGradeStreet
//
//  Created by mac on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopID : NSObject

@property (nonatomic, copy) NSString *shop_id;
@property (nonatomic, copy) NSString *shop_name;
@property (nonatomic, copy) NSString *favorite_number;
@property (nonatomic, copy) NSString *shop_address;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *has_ticket;
@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *ticket_num;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 //点击品牌上方
 "shop_id": "1078",
 "shop_name": "\u7d22\u83f2\u5a05\u4e0a\u5609\u4e1c\u65b9Y",
 "favorite_number": "1",
 "shop_address": "\u5609\u5b9a\u533a\u57ce\u4e2d\u8def66\u53f7\u4e1c\u65b9\u5546\u53a61F",
 "distance": "784777.320896168",
 "lng": "121.248299",
 "lat": "31.380554",
 "has_ticket": false,
 "ticket_num": 0

 
 */