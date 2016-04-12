//
//  ShopStore.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "ShopStore.h"
#import "Ticket.h"

@implementation ShopStore


// shop_name  shop_address  phone  shop_img  lat  lng  favorite_number  distance  ticket  good_img

- (void)dealloc
{
    self.shop_img = nil;
    self.shop_address = nil;
    self.shop_name = nil;
    self.phone = nil;
    self.lat = nil;
    self.lng = nil;
    self.favorite_number = nil;
    self.distance = nil;
    self.ticket = nil;
    self.good_img = nil;
    [super dealloc];
}

- (id)initWhithDictionary:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.shop_name = dict[@"shop_name"];
        self.shop_address = dict[@"shop_address"];
        self.phone = dict[@"phone"];
        self.shop_img = dict[@"shop_img"];
        self.lat = dict[@"lat"];
        self.lng = dict[@"lng"];
        self.favorite_number = dict[@"favorite_number"];
        self.distance = dict[@"distance"];
        
        
        NSArray *tickets = dict[@"ticket"];
        if (tickets) {
            self.ticket = [NSMutableArray array];
            for (NSDictionary *dictTick in tickets) {
                Ticket *tick = [[Ticket alloc] initWhithDictionary:dictTick];
                [self.ticket addObject:tick];
                [tick release];
            }
        }
        
        
        self.good_img = dict[@"good_img"];
        
        
        
    }
    return self;
}


@end
