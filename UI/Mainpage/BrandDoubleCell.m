//
//  BrandDoubleCell.m
//  FamousGradeStreet
//
//  Created by 龙翔 on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "BrandDoubleCell.h"

@implementation BrandDoubleCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_brandImage release];
    [_brandTitle release];
    [_brandDescribe release];
    [super dealloc];
}
@end
