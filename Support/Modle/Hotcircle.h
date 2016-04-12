//
//  Hotcircle.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hotcircle : NSObject

@property (nonatomic, copy) NSString *circle_id;
@property (nonatomic, copy) NSString *circle_name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "circle_id":"11",
 "circle_name":"陆家嘴"
 */