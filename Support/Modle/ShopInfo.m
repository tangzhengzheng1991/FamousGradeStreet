//
//  ShopInfo.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "ShopInfo.h"

@implementation ShopInfo

- (void)dealloc {
    self.shop_id = nil;
    self.shop_name = nil;
    self.favorite_number = nil;
    self.shop_address = nil;
    self.distance = nil;
    self.coupon_num = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.shop_id = [dictionary objectForKey:@"shop_id"];
        self.shop_name = [dictionary objectForKey:@"shop_name"];
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
        self.shop_address = [dictionary objectForKey:@"shop_address"];
        self.distance = [dictionary objectForKey:@"distance"];
        self.coupon_num = [dictionary objectForKey:@"coupon_num"];
    }
    return self;
}

@end
/*
 shop_id;
 shop_name;
 favorite_number;
 shop_address;
 distance;
 coupon_num;
 */