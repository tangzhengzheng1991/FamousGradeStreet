//
//  MenuSingleTableView.h
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-19.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuSingleTableView : UITableViewController

@property (nonatomic, assign)int TableIndex;

@property (nonatomic, retain)NSMutableArray *singleArray;
@property (nonatomic, assign)BOOL isMain;

@end
