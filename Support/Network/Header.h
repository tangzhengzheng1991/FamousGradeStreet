//
//  Header.h
//  FamousGradeStreet
//
//  Created by cc on 14-11-18.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#ifndef FamousGradeStreet_Header_h
#define FamousGradeStreet_Header_h

#define  SHOWALERT(mesageString) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:mesageString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];\
[alert show];\
[alert release];
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kDuration 0.7   // 动画持续时间(秒)

#define iPhone4 480
#define iPhone5 568

#define VHEIGHT self.view.bounds.size.height

#define SINA @"https://open.weibo.cn/"
#define TENCENT @"https://open.t.qq.com"


#import "HTTPRequestEnding.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "MJRefresh.h"
#import "SVPullToRefresh.h"
#import "MBProgressHUD.h"
#import "NSString+MD5.h"

#import "HeadScroll.h"
#import "Recomsamll.h"
#import "Recombig.h"
#import "Result.h"
#import "Brand.h"
#import "RecomImg.h"
#import "Hotcircle.h"
#import "MarketRecom.h"
#import "Special.h"
#import "BrandCoupon.h"
#import "ShopInfo.h"
#import "CouponTwo.h"
#import "EndCoupon.h"
#import "Baby.h"
#import "GoodStore.h"
#import "BrandDouble.h"
#import "Store.h"
#import "ShopID.h"
#import "ShopDouble.h"
#import "MarketInfo.h"
#import "MarketShopInfo.h"

#endif
