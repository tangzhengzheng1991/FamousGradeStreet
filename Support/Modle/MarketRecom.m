//
//  MarketRecom.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MarketRecom.h"

@implementation MarketRecom

- (void)dealloc {
    self.market_id = nil;
    self.market_name = nil;
    self.market_address = nil;
    self.logo_img = nil;
    self.shop_num = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.market_id = [dictionary objectForKey:@"market_id"];
        self.market_name = [dictionary objectForKey:@"market_name"];
        self.market_address = [dictionary objectForKey:@"market_address"];
        self.logo_img = [dictionary objectForKey:@"logo_img"];
        self.shop_num = [dictionary objectForKey:@"shop_num"];
        
    }
    return self;
}

@end
