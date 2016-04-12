//
//  Store.m
//  FamousGradeStreet
//
//  Created by mac on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Store.h"

@implementation Store

- (void)dealloc {
    self.favorite_number = nil;
    self.brand_name_zh = nil;
    self.brand_name_en = nil;
    self.brand_logo = nil;
    self.brand_head = nil;
    self.brand_icon = nil;
    self.brand_profile = nil;
    
    
    [super dealloc];
}
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        self.favorite_number = [dictionary objectForKey:@"favorite_number"];
        self.brand_name_zh = [dictionary objectForKey:@"brand_name_zh"];
        self.brand_name_en = [dictionary objectForKey:@"brand_name_en"];
        self.brand_logo = [dictionary objectForKey:@"brand_logo"];
        self.brand_head = [dictionary objectForKey:@"brand_head"];
        self.brand_icon = [dictionary objectForKey:@"brand_icon"];
        self.brand_profile = [dictionary objectForKey:@"brand_profile"];
        
    }
    return self;
}


@end
