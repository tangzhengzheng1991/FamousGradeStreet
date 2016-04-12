//
//  BrandCoupon.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "BrandCoupon.h"
#import "ShopInfo.h"

@implementation BrandCoupon

- (void)dealloc {
    self.ticket_id = nil;
    self.ticket_uuid = nil;
    self.ticket_title = nil;
    self.ticket_type = nil;
    self.ticket_summary = nil;
    self.shop_id = nil;
    self.shop_name = nil;
    self.par_value = nil;
    self.selling_price = nil;
    self.start_time = nil;
    self.end_time = nil;
    self.valid_stime = nil;
    self.valid_etime = nil;
    self.cover_img = nil;
    self.content = nil;
    self.total = nil;
    self.has_led = nil;
    self.limit_count = nil;
    self.app_price = nil;
    self.sequence = nil;
    self.sort_name = nil;
    self.sort_mark = nil;
    self.surplus = nil;
    self.dis_price = nil;
    self.valid_time = nil;
    self.shopInfoArray = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.ticket_id = [dictionary objectForKey:@"ticket_id"];
        self.ticket_uuid = [dictionary objectForKey:@"ticket_uuid"];
        self.ticket_title = [dictionary objectForKey:@"ticket_title"];
        self.ticket_type = [dictionary objectForKey:@"ticket_type"];
        self.ticket_summary = [dictionary objectForKey:@"ticket_summary"];
        self.shop_id = [dictionary objectForKey:@"shop_id"];
        self.shop_name = [dictionary objectForKey:@"shop_name"];
        self.par_value = [dictionary objectForKey:@"par_value"];
        self.selling_price = [dictionary objectForKey:@"selling_price"];
        self.start_time = [dictionary objectForKey:@"start_time"];
        self.end_time = [dictionary objectForKey:@"end_time"];
        self.valid_stime = [dictionary objectForKey:@"valid_stime"];
        self.valid_etime = [dictionary objectForKey:@"valid_etime"];
        self.cover_img = [dictionary objectForKey:@"cover_img"];
        self.content = [dictionary objectForKey:@"content"];
        self.total = [dictionary objectForKey:@"total"];
        self.has_led = [dictionary objectForKey:@"has_led"];
        self.limit_count = [dictionary objectForKey:@"limit_count"];
        self.app_price = [dictionary objectForKey:@"app_price"];
        self.sequence = [dictionary objectForKey:@"sequence"];
        self.sort_name = [dictionary objectForKey:@"sort_name"];
        self.sort_mark = [dictionary objectForKey:@"sort_mark"];
        self.surplus = [dictionary objectForKey:@"surplus"];
        self.dis_price = [dictionary objectForKey:@"dis_price"];
        self.valid_time = [dictionary objectForKey:@"valid_time"];
        
        self.shopInfoArray = [[NSMutableArray alloc] init];
        
        NSArray *shopInfo = [dictionary objectForKey:@"shopInfo"];
        for (NSDictionary *dictionary in shopInfo) {
            ShopInfo *shopInfo = [[ShopInfo alloc] initWithDictionary:dictionary];
            [self.shopInfoArray addObject:shopInfo];
            [shopInfo release];
        }
    }
    return self;
}

@end
