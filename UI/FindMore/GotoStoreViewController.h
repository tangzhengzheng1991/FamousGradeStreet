//
//  GotoStoreViewController.h
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-25.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GotoStoreViewController : UIViewController

@property (nonatomic, assign)CGPoint latAndLng;
//@property (nonatomic, assign)int goodId;
@property (nonatomic, assign)int shopId;

@property (nonatomic, retain)NSDictionary *storeDict;

@end
