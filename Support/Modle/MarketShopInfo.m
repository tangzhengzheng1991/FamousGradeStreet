//
//  MarketShopInfo.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "MarketShopInfo.h"

@implementation MarketShopInfo

- (void)dealloc
{
    self.shop_id = nil;
    self.shop_name = nil;
    self.brand_icon = nil;
    self.brand_name_zh = nil;
    self.brand_name_en = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        self.shop_id = [dictionary objectForKey:@"shop_id"];
        self.shop_name = [dictionary objectForKey:@"shop_name"];
        self.brand_icon = [dictionary objectForKey:@"brand_icon"];
        self.brand_name_zh = [dictionary objectForKey:@"brand_name_zh"];
        self.brand_name_en = [dictionary objectForKey:@"brand_name_en"];
    }
    return self;
}


@end
