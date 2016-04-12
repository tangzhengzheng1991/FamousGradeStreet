//
//  CouponCell.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "CouponCell.h"

@implementation CouponCell

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
    [_couponImage release];
    [_couponName release];
    [_priceLabel release];
    [_disPriceLabel release];
    [super dealloc];
}
@end
