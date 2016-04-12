//
//  Recombig.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recombig : NSObject

@property (nonatomic, copy) NSString *come_from_id;
@property (nonatomic, copy) NSString *come_from_type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *www_url;
@property (nonatomic, copy) NSString *img_url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
/*
 "come_from_id":"2432",
 "come_from_type":"3",
 "title":"APP推荐了lacoste品牌",
 "summary":"APP推荐了lacoste品牌",
 "www_url":"",
 "img_url":"http://img5.mplife.com/buy/recommend/2014/09/28/1411887500716224439.jpg"
 },
 */