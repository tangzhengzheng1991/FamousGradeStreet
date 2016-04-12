//
//  MarketInfo.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MarketInfo.h"

@implementation MarketInfo

- (void)dealloc
{
    self.market_id = nil;
    self.market_name = nil;
    self.market_address = nil;
    self.lng = nil;
    self.lat = nil;
    self.intro = nil;
    self.trafficInfo = nil;
    self.area = nil;
    self.tel = nil;
    self.head_img = nil;
    self.logo_img = nil;
    self.sequence = nil;
    self.favorite_number = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        self.market_id = [dictionary objectForKey:@"market_id"];
        self.market_name = [dictionary objectForKey:@"market_name"];
        self.market_address = [dictionary objectForKey:@"market_address"];
        self.lng = [dictionary objectForKey:@"lng"];
        self.lat = [dictionary objectForKey:@"lat"];
        self.intro = [dictionary objectForKey:@"intro"];
        self.trafficInfo = [dictionary objectForKey:@"trafficInfo"];
        self.area = [dictionary objectForKey:@"area"];
        self.tel = [dictionary objectForKey:@"tel"];
        self.head_img = [dictionary objectForKey:@"head_img"];
        self.logo_img = [dictionary objectForKey:@"logo_img"];
        self.sequence = [dictionary objectForKey:@"sequence"];
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
    }
    return self;
}

@end








