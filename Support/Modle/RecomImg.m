//
//  RecomImg.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "RecomImg.h"

@implementation RecomImg

- (void)dealloc {
    self.come_from_id = nil;
    self.come_from_type = nil;
    self.title = nil;
    self.summary = nil;
    self.www_url = nil;
    self.img_url = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.come_from_id = [dictionary objectForKey:@"come_from_id"];
        self.come_from_type = [dictionary objectForKey:@"come_from_type"];
        self.title = [dictionary objectForKey:@"title"];
        self.summary = [dictionary objectForKey:@"summary"];
        self.www_url = [dictionary objectForKey:@"www_url"];
        self.img_url = [dictionary objectForKey:@"img_url"];
        
    }
    return self;
}

@end
