//
//  SpecialCell.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "SpecialCell.h"

@implementation SpecialCell

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
    [_bigImage release];
    [_loadText release];
    [_titleLabel release];
    [_couponImage release];
    [_discountLabel release];
    [super dealloc];
}
@end
