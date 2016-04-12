//
//  EndCouponCell.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "EndCouponCell.h"

@implementation EndCouponCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

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
    [_dispriceLabel release];
    [super dealloc];
}
@end
