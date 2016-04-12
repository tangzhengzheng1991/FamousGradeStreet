//
//  Ticket.h
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <Foundation/Foundation.h>

// ticket_title  selling_price

@interface Ticket : NSObject

@property (nonatomic, copy)NSString *ticket_title;
@property (nonatomic, copy)NSString *selling_price;

- (id)initWhithDictionary:(NSDictionary *)dict;


@end
