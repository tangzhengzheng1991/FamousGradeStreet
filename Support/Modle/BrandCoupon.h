//
//  BrandCoupon.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandCoupon : NSObject

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
@property (nonatomic, copy) NSString *content;
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
 "ticket_id":"201",
 "ticket_uuid":"c7c3ca40-11ff-4128-8915-bc7c35f5ff84",
 "ticket_title":"星期六集团100元现金券",
 "ticket_type":"2",
 "ticket_summary":"星期六集团指定活动专柜折后再享线上70/APP65元购100元现金券优惠；可累计使用，不兑换可退款。",
 "shop_id":"1005",
 "shop_name":"星期六世博源店",
 "par_value":"100.00",
 "selling_price":"70.00",
 "start_time":"1415844600",
 "end_time":"1422713400",
 "valid_stime":"1415865840",
 "valid_etime":"1422717060",
 "cover_img":"http://img5.mplife.com/buy/cover/2014/11/13/1415863838713079118.jpg",
 "content":"<p> 活动时间：2014.11.13-2015.1.31 </p> <p> 星期六集团旗下 </p> <p> ST&amp;SAT、69、D：fuse、FBL、STONEFLY、SAFIYA 指定活动专柜折后再享70元购100元现金券优惠！ </p> <p> APP上享65元购100元现金券优惠！ </p> <p> 具体活动商铺：http://promo.mplife.com/saturday/20141113/ </p> <p> <img src="http://img5.mplife.com/buy/ticket/740/2014/11/13/1415863796664837685.jpg" alt="" /></p> <p> <img src="http://img5.mplife.com/buy/ticket/740/2014/11/13/1415863798383558635.jpg" alt="" /></p>",
 "total":1500,
 "has_led":952,
 "limit_count":"500",
 "app_price":6500,
 "sequence":"1",
 "sort_name":"现金券",
 "sort_mark":"voucher",
 "surplus":548,
 "dis_price":"70.00",
 "valid_time":"2014.11.13-1.31",
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

/*
 XML-Data
 
 <p> 活动时间：2014.11.13-2015.1.31 </p> 
 <p> 星期六集团旗下 </p>
 <p> ST&amp;SAT、69、D：fuse、FBL、STONEFLY、SAFIYA 指定活动专柜折后再享70元购100元现金券优惠！ </p> 
 <p> APP上享65元购100元现金券优惠！ </p>
 <p> 具体活动商铺：http://promo.mplife.com/saturday/20141113/ </p> 
 <p> <img src="http://img5.mplife.com/buy/ticket/740/2014/11/13/1415863796664837685.jpg" alt="" /></p>
 <p> <img src="http://img5.mplife.com/buy/ticket/740/2014/11/13/1415863798383558635.jpg" alt="" /></p>
 */










