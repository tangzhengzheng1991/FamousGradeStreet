//
//  Special.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Special.h"

@implementation Special

- (void)dealloc {
    self.title = nil;
    self.discount = nil;
    self.has_coupon = nil;
    self.wap_img = nil;
    self.wap_url = nil;
    self.time_status = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.title = [dictionary objectForKey:@"title"];
        self.discount = [dictionary objectForKey:@"discount"];
        self.has_coupon = [dictionary objectForKey:@"has_coupon"];
        self.wap_img = [dictionary objectForKey:@"wap_img"];
        self.wap_url = [dictionary objectForKey:@"wap_url"];
        self.time_status = [dictionary objectForKey:@"time_status"];
        
    }
    return self;
}

@end
