//
//  Result.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (nonatomic, copy) NSString *store_id;
@property (nonatomic, copy) NSString *store_name;

@property (nonatomic, retain) NSMutableArray *brand;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "store_id":19,
 "store_name":"配饰",
 "brand":[
 
  
  */