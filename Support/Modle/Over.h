//
//  Over.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Over : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *discount;
@property (nonatomic, copy) NSString *has_coupon;
@property (nonatomic, copy) NSString *wap_img;
@property (nonatomic, copy) NSString *wap_url;
@property (nonatomic, copy) NSString *time_status;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
/*
 "title":"HUM STCO COTRA等联合特卖",
 "discount":"全场20元起",
 "has_coupon":0,
 "wap_img":"http://promo.mplife.com/mp/2296/images/wap_url.jpg",
 "wap_url":"http://promo.mplife.com/mp/2296/wap.html",
 "time_status":"已结束"
 },
 */