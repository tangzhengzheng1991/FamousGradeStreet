//
//  HeadScroll.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadScroll : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *www_url;
@property (nonatomic, copy) NSString *ticket_uuid;
@property (nonatomic, copy) NSString *head_url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
/*
 "title":"皇家时尚",
 "www_url":"http://promo.mplife.com/oto/royalmaine/wap/20141112/",
 "ticket_uuid":"",
 "head_url":"http://img5.mplife.com/buy/recommend/2014/11/16/1416116569821767160.jpg"
 
 */

