//
//  Baby.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Baby.h"

@implementation Baby

- (void)dealloc {
    self.good_id = nil;
    self.good_name = nil;
    self.shop_id = nil;
    self.shop_name = nil;
    self.user_id = nil;
    self.user_name = nil;
    self.org_price = nil;
    self.dis_price = nil;
    self.concerned_number = nil;
    self.favorite_number = nil;
    self.is_auth = nil;
    self.first_img = nil;
    self.width = nil;
    self.height = nil;
    self.img_num = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.good_id = [dictionary objectForKey:@"good_id"];
        self.good_name = [dictionary objectForKey:@"good_name"];
        self.shop_id = [dictionary objectForKey:@"shop_id"];
        self.shop_name = [dictionary objectForKey:@"shop_name"];
        self.user_id = [dictionary objectForKey:@"user_id"];
        self.user_name = [dictionary objectForKey:@"user_name"];
        self.org_price = [dictionary objectForKey:@"org_price"];
        self.dis_price = [dictionary objectForKey:@"dis_price"];
        self.concerned_number = [dictionary objectForKey:@"concerned_number"];
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
        self.is_auth = [dictionary objectForKey:@"is_auth"];
        self.first_img = [dictionary objectForKey:@"first_img"];
        self.width = [dictionary objectForKey:@"width"];
        self.height = [dictionary objectForKey:@"height"];
        self.img_num = [dictionary objectForKey:@"img_num"];
    }
    return self;
}

@end
