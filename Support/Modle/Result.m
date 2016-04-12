//
//  Result.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Result.h"

@implementation Result

- (void)dealloc {
    self.store_id = nil;
    self.store_name = nil;
    self.brand = nil;
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        
        self.store_id = [dictionary objectForKey:@"store_id"];
        self.store_name = [dictionary objectForKey:@"store_name"];
        
        
        self.brand = [NSMutableArray array];
        NSArray *brand = [dictionary objectForKey:@"brand"];
        
        for (NSDictionary *dictionary in brand) {
            Brand *brand = [[Brand alloc] initWithDictionary:dictionary];
            [self.brand addObject:brand];
            [brand release];
        }
    }
    return self;
}

@end
