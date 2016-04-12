//
//  DrawView.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctr, 1, 1, 1, 1);
    CGContextSetLineWidth(ctr, 1);
    CGContextAddRect(ctr, CGRectMake(1, 1, self.frame.size.width-2, self.frame.size.height-2));
    CGContextStrokePath(ctr);
}


@end
