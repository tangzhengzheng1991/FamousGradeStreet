//
//  Hotcircle.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Hotcircle.h"

@implementation Hotcircle

- (void)dealloc {
    self.circle_id = nil;
    self.circle_name = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.circle_id = [dictionary objectForKey:@"circle_id"];
        self.circle_name = [dictionary objectForKey:@"circle_name"];
        
    }
    return self;
}

@end
