//
//  HeadScroll.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "HeadScroll.h"

@implementation HeadScroll

- (void)dealloc {
    self.title = nil;
    self.www_url = nil;
    self.ticket_uuid = nil;
    self.head_url = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.title = [dictionary objectForKey:@"title"];
        self.www_url = [dictionary objectForKey:@"www_url"];
        self.ticket_uuid = [dictionary objectForKey:@"ticket_uuid"];
        self.head_url = [dictionary objectForKey:@"head_url"];
    }
    return self;
}


@end
