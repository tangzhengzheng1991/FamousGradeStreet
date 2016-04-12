//
//  Brand.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Brand.h"

@implementation Brand

- (void)dealloc {
    self.brand_id = nil;
    self.brand_name_zh = nil;
    self.brand_name_en = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.brand_id = [dictionary objectForKey:@"brand_id"];
        self.brand_name_zh = [dictionary objectForKey:@"brand_name_zh"];
        self.brand_name_en = [dictionary objectForKey:@"brand_name_en"];
        
    }
    return self;
}

@end
