//
//  DeepDetailViewController.h
//  FamousGradeStreet
//
//  Created by mac on 14-11-26.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeepDetailViewController : UIViewController

@property (nonatomic, retain) Store *store;
@property (nonatomic, retain) BrandDouble *brandDouble;
@property (nonatomic, retain) Recomsamll *samll;

@property (nonatomic, assign) int indexPathRow;
@property (nonatomic, retain) NSMutableArray *brandShopArray;

@property (nonatomic, retain) MarketShopInfo *marketShopInfo;
@property (nonatomic, retain) MarketInfo *marketInfo;

@end
