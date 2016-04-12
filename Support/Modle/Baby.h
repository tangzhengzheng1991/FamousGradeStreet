//
//  Baby.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Baby : NSObject

@property (nonatomic, copy) NSString *good_id;
@property (nonatomic, copy) NSString *good_name;
@property (nonatomic, copy) NSString *shop_id;
@property (nonatomic, copy) NSString *shop_name;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *org_price;
@property (nonatomic, copy) NSString *dis_price;
@property (nonatomic, copy) NSString *concerned_number;
@property (nonatomic, copy) NSString *favorite_number;
@property (nonatomic, copy) NSString *is_auth;
@property (nonatomic, copy) NSString *first_img;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *img_num;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
/*
 "good_id":"12490",
 "good_name":"偶遇千百度员工内购会，永升大厦21楼2108室",
 "shop_id":"0",
 "shop_name":"",
 "user_id":"19802",
 "user_name":"mob_43024",
 "org_price":"0.00",
 "dis_price":"100.00",
 "concerned_number":"0",
 "favorite_number":"0",
 "is_auth":"0",
 "first_img":"http://img5.mplife.com/buy/good/640/2014/11/12/1415762831037796.jpg",
 "width":640,
 "height":360,
 "img_num":"2"
 */