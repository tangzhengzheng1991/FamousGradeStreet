//
//  ShopDouble.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "ShopDouble.h"

@implementation ShopDouble

- (void)dealloc
{
    self.shop_id = nil;
    self.shop_name = nil;
    self.shop_address = nil;
    self.distance = nil;
    self.lng = nil;
    self.lat = nil;
    self.favorite_number = nil;
    
    self.brand_id = nil;
    self.brand_name = nil;
    self.phone = nil;
    self.shop_img = nil;
    self.notice = nil;
    self.is_flag = nil;
    self.is_enable = nil;
    self.brand_icon = nil;
    [super dealloc];
}
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.shop_id = [dictionary objectForKey:@"shop_id"];
        self.shop_name = [dictionary objectForKey:@"shop_name"];
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
        self.shop_address = [dictionary objectForKey:@"shop_address"];
        self.distance = [dictionary objectForKey:@"distance"];
        self.lng = [dictionary objectForKey:@"lng"];
        self.lat = [dictionary objectForKey:@"lat"];
        
        self.brand_id = [dictionary objectForKey:@"brand_id"];
        self.brand_name = [dictionary objectForKey:@"brand_name"];
        self.phone = [dictionary objectForKey:@"phone"];
        self.shop_img = [dictionary objectForKey:@"shop_img"];
        self.notice = [dictionary objectForKey:@"notice"];
        self.is_flag = [dictionary objectForKey:@"is_flag"];
        self.is_enable = [dictionary objectForKey:@"is_enable"];
        self.brand_icon = [dictionary objectForKey:@"brand_icon"];
    }
    return self;
}


@end
