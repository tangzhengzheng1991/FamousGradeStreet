//
//  BrandDouble.h
//  FamousGradeStreet
//
//  Created by 龙翔 on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandDouble : NSObject

@property (nonatomic, copy) NSString *brand_id;
@property (nonatomic, copy) NSString *store_id;
@property (nonatomic, copy) NSString *brand_name_zh;
@property (nonatomic, copy) NSString *brand_name_en;
@property (nonatomic, copy) NSString *firs_word;
@property (nonatomic, copy) NSString *brand_logo;
@property (nonatomic, copy) NSString *brand_figure;
@property (nonatomic, copy) NSString *brand_head;
@property (nonatomic, copy) NSString *brand_icon;
@property (nonatomic, copy) NSString *is_enable;
@property (nonatomic, copy) NSString *brand_profile;
@property (nonatomic, copy) NSString *is_show;
@property (nonatomic, copy) NSString *sequence;
@property (nonatomic, copy) NSString *favorite_number;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *updated;
@property (nonatomic, copy) NSString *city;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "brand_id": "2003",
 "store_id": "19",
 "brand_name_zh": "\u94bb\u77f3\u5c0f\u9e1f",
 "brand_name_en": "Zbird",
 "firs_word": "z",
 "brand_logo": "2014\/07\/04\/1404459353120391020.jpg",
 "brand_figure": "2014\/10\/24\/1414140609241302270.jpg",
 "brand_head": "2014\/10\/24\/1414140375680005332.gif",
 "brand_icon": "http:\/\/img5.mplife.com\/buy\/brand\/2014\/08\/28\/1409196242396211387.jpg",
 "is_enable": "1",
 "brand_profile": "		
 "is_show": "0",
 "sequence": "9999",
 "favorite_number": "6",
 "created": "1383125154",
 "updated": "1414140612",
 "city": "sh"

 */