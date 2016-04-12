//
//  RecomImg.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecomImg : NSObject

@property (nonatomic, copy) NSString *come_from_id;
@property (nonatomic, copy) NSString *come_from_type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *www_url;
@property (nonatomic, copy) NSString *img_url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "come_from_id":"0",
 "come_from_type":"0",
 "title":"久光国庆3天福袋完整版",
 "summary":"久光百货周年庆福袋",
 "www_url":"http://m.mplife.com/zhekou/mall/140924/44141365401.shtml ",
 "img_url":"http://img5.mplife.com/buy/recommend/2014/09/28/1411887685073069240.jpg"
 */