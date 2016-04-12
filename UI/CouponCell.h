//
//  CouponCell.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *couponImage;

@property (retain, nonatomic) IBOutlet UILabel *couponName;

@property (retain, nonatomic) IBOutlet UILabel *priceLabel;

@property (retain, nonatomic) IBOutlet UILabel *disPriceLabel;

@end
