//
//  CouponTwo.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-21.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CouponTwo : NSObject

@property (nonatomic, copy) NSString *ticket_id;
@property (nonatomic, copy) NSString *ticket_uuid;
@property (nonatomic, copy) NSString *ticket_title;
@property (nonatomic, copy) NSString *ticket_type;
@property (nonatomic, copy) NSString *ticket_summary;
@property (nonatomic, copy) NSString *shop_id;
@property (nonatomic, copy) NSString *shop_name;
@property (nonatomic, copy) NSString *par_value;
@property (nonatomic, copy) NSString *selling_price;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, copy) NSString *valid_stime;
@property (nonatomic, copy) NSString *valid_etime;
@property (nonatomic, copy) NSString *cover_img;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *has_led;
@property (nonatomic, copy) NSString *limit_count;
@property (nonatomic, copy) NSString *app_price;
@property (nonatomic, copy) NSString *sequence;
@property (nonatomic, copy) NSString *sort_name;
@property (nonatomic, copy) NSString *sort_mark;
@property (nonatomic, copy) NSString *surplus;
@property (nonatomic, copy) NSString *dis_price;
@property (nonatomic, copy) NSString *valid_time;

@property (nonatomic, retain) NSMutableArray *shopInfoArray;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
/*
 "ticket_id":"194",
 "ticket_uuid":"0393fc3b-a9e3-4c34-bc0c-b23ab44949ad",
 "ticket_title":"第二届大型服饰节建行65元购80元现金券",
 "ticket_type":"2",
 "ticket_summary":"可累计使用，未兑换活动结束后7个工作日内自动原路返还，11.26-11.29，延安西路2299号世贸商城4楼。",
 "shop_id":"2786",
 "shop_name":"MP特卖—世贸商城",
 "par_value":"80.00",
 "selling_price":"65.00",
 "start_time":"1415682060",
 "end_time":"1417266540",
 "valid_stime":"1416881400",
 "valid_etime":"1417266540",
 "cover_img":"http://img5.mplife.com/buy/cover/2014/11/11/1415683487832156773.jpg",
  "total":1500,
 "has_led":856,
 "limit_count":"1",
 "app_price":6500,
 "sequence":"1",
 "sort_name":"现金券",
 "sort_mark":"voucher",
 "surplus":644,
 "dis_price":"65.00",
 "valid_time":"2014.11.25-11.29",
 "shopInfo":[
 {
    "shop_id":"2786",
    "shop_name":"MP特卖—世贸商城",
    "favorite_number":"21",
    "shop_address":"延安西路2299号世贸商城4楼",
    "distance":"807255.973536159",
    "coupon_num":4
 }
 ]
 */