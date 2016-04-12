//
//  AllDetailViewController.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDetailViewController : UIViewController

@property (nonatomic, assign) int indexPathRow;
@property (nonatomic, retain) NSMutableArray *specialArray;
@property (nonatomic, retain) Special *special;

@end
