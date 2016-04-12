//
//  ShopID.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "ShopID.h"

@implementation ShopID

- (void)dealloc
{
    self.shop_id = nil;
    self.shop_name = nil;
    self.shop_address = nil;
    self.distance = nil;
    self.has_ticket = nil;
    self.ticket_num = nil;
    self.lng = nil;
    self.lat = nil;
    self.favorite_number = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.shop_id = [dictionary objectForKey:@"shop_id"];
        self.shop_name = [dictionary objectForKey:@"shop_name"];
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
        self.shop_address = [dictionary objectForKey:@"shop_address"];
        self.distance = [dictionary objectForKey:@"distance"];
        self.has_ticket = [dictionary objectForKey:@"has_ticket"];
        self.ticket_num = [dictionary objectForKey:@"ticket_num"];
        self.lng = [dictionary objectForKey:@"lng"];
        self.lat = [dictionary objectForKey:@"lat"];
        
    }
    return self;
}

@end
