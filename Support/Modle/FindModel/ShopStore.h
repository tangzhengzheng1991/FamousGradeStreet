//
//  ShopStore.h
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>


// shop_name  shop_address  phone  shop_img  lat  lng  favorite_number  distance  ticket  good_img
@interface ShopStore : NSObject

@property (nonatomic, copy)NSString *shop_name;
@property (nonatomic, copy)NSString *shop_address;
@property (nonatomic, copy)NSString *phone;
@property (nonatomic, copy)NSString *shop_img;
@property (nonatomic, copy)NSString *lat;
@property (nonatomic, copy)NSString *lng;
@property (nonatomic, copy)NSString *favorite_number;
@property (nonatomic, copy)NSString *distance;

@property (nonatomic, retain)NSMutableArray *ticket;
@property (nonatomic, retain)NSMutableArray *good_img;


- (id)initWhithDictionary:(NSDictionary *)dict;

@end
