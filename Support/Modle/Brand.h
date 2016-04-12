//
//  Brand.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brand : NSObject

@property (nonatomic, copy) NSString *brand_id;
@property (nonatomic, copy) NSString *brand_name_zh;
@property (nonatomic, copy) NSString *brand_name_en;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "brand_id":"4005",
 "brand_name_zh":"玛丽亚·古琦",
 "brand_name_en":"Marja Kurki"
 */