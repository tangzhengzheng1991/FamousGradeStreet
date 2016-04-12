//
//  MoreBrandDetailController.h
//  FamousGradeStreet
//
//  Created by mac on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreBrandDetailController : UIViewController

@property (nonatomic, assign) int indexPathRow;
@property (nonatomic, retain) BrandDouble *brandDouble;

@property (nonatomic, assign) BOOL isJump;
@property (nonatomic, retain) Recomsamll *samll;

@end
