//
//  DetailViewController.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-21.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) int indexPathRow;
@property (nonatomic, retain) NSMutableArray *couponArray;

@end
