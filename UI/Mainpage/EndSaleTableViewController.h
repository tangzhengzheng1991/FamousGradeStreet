//
//  EndSaleTableViewController.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Complete)(int num);

@interface EndSaleTableViewController : UITableViewController

@property (nonatomic, copy) Complete completeNum;

@end
