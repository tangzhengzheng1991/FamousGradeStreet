//
//  Ticket.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-27.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

- (void)dealloc
{
    self.ticket_title = nil;
    self.selling_price = nil;
    [super dealloc];
}

- (id)initWhithDictionary:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.ticket_title = dict[@"ticket_title"];
        self.selling_price = dict[@"selling_price"];
        
        
    }
    return self;
}

@end
