//
//  EndCoupon.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EndCoupon : NSObject

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
