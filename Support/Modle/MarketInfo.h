//
//  MarketInfo.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarketInfo : NSObject

@property (nonatomic, copy) NSString *market_id;
@property (nonatomic, copy) NSString *market_name;
@property (nonatomic, copy) NSString *market_address;
@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *trafficInfo;
@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *tel;
@property (nonatomic, copy) NSString *head_img;
@property (nonatomic, copy) NSString *logo_img;
@property (nonatomic, copy) NSString *sequence;
@property (nonatomic, copy) NSString *favorite_number;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

/*
 "result":{
 "market_id":"6",
 "market_uid":"6f9a23c7-6c7c-4196-842e-2d9c5afe8c78",
 "market_name":"置地广场",
 "region_id":"8",
 "circle_id":"43",
 "market_address":"南京东路409-459号",
 "lng":"121.496065",
 "lat":"31.244545",
 "intro":"位于“繁华”的南京路步行街中段。环境“不错”，布局“合理”，服饰、化妆品、鞋子、家居等“主流”的流行品牌“齐全”。“三天两头搞活动”，算下来“绝对超值”。“地下2层”还有个“特卖场”，“花时间花心思”去淘“必有收获”。人气“很旺”，“人挤人”“就像沙丁鱼罐头”，到了圣诞节或者新年，“进门还要排长队”呢。",
 "trafficInfo":"14、17、20、21、37、49、64、66、123、167、220 、584、801、802、946、旅游10号线、地铁2号线南京东路站",
 "area":"黄浦区",
 "tel":"021-63513828",
 "head_img":"http://img5.mplife.com/buy/market/2014/09/10/1410318012921842515.jpg",
 "logo_img":"http://img5.mplife.com/buy/market/2014/09/12/1410491195986109306.jpg",
 "is_show":"1",
 "sequence":"1",
 "favorite_number":"14",
 "city":"sh",
 "shopInfo":[]
 },

 
 "market_id":"183",
 "market_uid":"575b090d-eb3b-498a-99b7-a13339ab2568",
 "market_name":"国金中心商场",
 "region_id":"1",
 "circle_id":"11",
 "market_address":"世纪大道8号",
 "lng":"121.502433",
 "lat":"31.236345",
 "intro":"位于陆家嘴中心的顶级shopping mall，环境“一流”，配套设施“豪华”。地下1、2层比较“亲民”，“各式各样”的小吃琳琅满目，泡芙、布丁、蛋挞、鲷鱼烧、可丽饼等看起来都“很美味”；来自香港最IN的生活品味专门店city'super“进口物品偏多”，很多东西“外面买不到”；国金百丽宫设备“豪华”，3D电影看得“最舒服”。楼上“就高端了”，国际奢侈品“齐全”，“没有你买不到的，只有你买不动的”，而且每家店面“够大”，导购“很给力”；“上海首家”Apple Store总是“人山人海”。3、4层主要是餐饮，汇集中餐、西餐、日料，购物、看电影后，吃饭“方便”。",
 "trafficInfo":"地铁2号线陆家嘴站、933、971、961、985、993、996、583、774、870、871、791、795、796、798、81、82、85、93、607、621",
 "area":"浦东新区",
 "tel":"021-20207070",
 "head_img":"http://img5.mplife.com/buy/market/2014/10/23/1414029689012480072.jpg",
 "logo_img":"http://img5.mplife.com/buy/market/2014/10/23/1414029684487701266.jpg",
 "is_show":"0",
 "sequence":"9999",
 "favorite_number":"2",
 "city":"sh",
 "shopInfo":[
 {
    "shop_id":"491",
    "shop_name":"星期六国金中心店",
    "brand_icon":"http://img5.mplife.com/buy/brand/2014/08/28/1409195677310613230.jpg",
    "brand_name_zh":"星期六",
    "brand_name_en":"ST&SAT"
 
 },
 */