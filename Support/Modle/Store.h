//
//  Store.h
//  FamousGradeStreet
//
//  Created by mac on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

@property (nonatomic, copy) NSString *favorite_number;
@property (nonatomic, copy) NSString *brand_name_zh;
@property (nonatomic, copy) NSString *brand_name_en;
@property (nonatomic, copy) NSString *brand_logo;
@property (nonatomic, copy) NSString *brand_head;
@property (nonatomic, copy) NSString *brand_icon;
@property (nonatomic, copy) NSString *brand_profile;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "brand_name_zh":"钻石小鸟",
 "brand_name_en":"Zbird",
 "brand_logo":"2014/07/04/1404459353120391020.jpg",
 "brand_profile":"钻石小鸟始创于2002年，率先把“鼠标+水泥”的模式引入网络奢侈品销售，是国内最早的网络钻石品牌。其始终倡导钻石文化的传播，坚持以安特卫普经典切割，一钻双证，为消费者带来贴心的购钻体验和无与伦比的DIY乐趣。钻石小鸟已为无数对情侣缔造了那颗爱情见证，收获了近百万会员[1] 的口口相传，倾情演绎着钻石与网络的恒久传奇。",
 "brand_head":"http://img5.mplife.com/buy/brand/2014/10/24/1414140375680005332.gif",
 "brand_icon":"http://img5.mplife.com/buy/brand/2014/08/28/1409196242396211387.jpg",
 "favorite_number":"7",
 "is_fav":true
 */