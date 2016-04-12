//
//  BrandDouble.m
//  FamousGradeStreet
//
//  Created by 龙翔 on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "BrandDouble.h"

@implementation BrandDouble

- (void)dealloc
{
    self.brand_id = nil;
    self.store_id = nil;
    self.brand_name_zh = nil;
    self.brand_name_en = nil;
    self.firs_word = nil;
    self.brand_logo = nil;
    self.brand_figure = nil;
    self.brand_head = nil;
    self.brand_icon = nil;
    self.is_enable = nil;
    self.brand_profile = nil;
    self.is_show = nil;
    self.sequence = nil;
    self.favorite_number = nil;
    self.created = nil;
    self.updated = nil;
    self.city = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.brand_id = [dictionary objectForKey:@"brand_id"];
        self.store_id = [dictionary objectForKey:@"store_id"];
        self.brand_name_zh = [dictionary objectForKey:@"brand_name_zh"];
        self.brand_name_en = [dictionary objectForKey:@"brand_name_en"];
        self.firs_word = [dictionary objectForKey:@"firs_word"];
        self.brand_logo = [dictionary objectForKey:@"brand_logo"];
        self.brand_figure = [dictionary objectForKey:@"brand_figure"];
        self.brand_head = [dictionary objectForKey:@"brand_head"];
        self.brand_icon = [dictionary objectForKey:@"brand_icon"];
        self.is_enable = [dictionary objectForKey:@"is_enable"];
        self.brand_profile = [dictionary objectForKey:@"brand_profile"];
        self.is_show = [dictionary objectForKey:@"is_show"];
        self.sequence = [dictionary objectForKey:@"sequence"];
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
        self.created = [dictionary objectForKey:@"created"];
        self.updated = [dictionary objectForKey:@"updated"];
        self.city = [dictionary objectForKey:@"city"];
    }
    return self;
}

@end
