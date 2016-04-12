//
//  detailCell.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "detailCell.h"

@interface detailCell ()
{
    UIView * whiteView;
    UILabel *nameLable;
    UILabel *addrLable;
    UILabel *moneyL;
    UIImageView *firmImg;
    UIImageView *colImg;
    UILabel *colL;
    UIImageView *addrImg;
    
    UIImageView *authImg;
    UILabel *authLab;
    
    UIImageView *favoImg;
    UILabel *favoLab;
}

@end

@implementation detailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // 认证 auth_icon_image  灰星 favIconImage  灰心 img_favorite_num
        
        // 白底
        whiteView =[[UIView alloc]init];
        whiteView.backgroundColor=[UIColor whiteColor];
        [self addSubview:whiteView];
        [whiteView release];
        
        // 图片
        _picBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_picBtn];
        
        //价格
        moneyL = [[UILabel alloc] init];
        moneyL.font = [UIFont boldSystemFontOfSize:20];
        moneyL.backgroundColor = [UIColor blackColor];
        moneyL.alpha = .5;
        moneyL.textColor = [UIColor whiteColor];
        moneyL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:moneyL];
        [moneyL release];
        
        // 货名
        nameLable = [[UILabel alloc] init];
        nameLable.textColor = RGBA(111, 111, 111, 1);
        [self addSubview:nameLable];
        [nameLable release];
        
        // 认证
        authImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"auth_icon_image"]];
        [self addSubview:authImg];
        [authImg release];
        
        // 认证
        authLab = [[UILabel alloc] init];
        authLab.text = @"认证";
        authLab.textColor = RGBA(111, 111, 111, 1);
        [self addSubview:authLab];
        [authLab release];
        
        // 点赞
        favoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_favorite_num"]];
        [self addSubview:favoImg];
        [favoImg release];
        // 点赞数
        favoLab = [[UILabel alloc] init];
        favoLab.textColor = RGBA(111, 111, 111, 1);
        favoLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:favoLab];
        [favoLab release];
        
        //收藏
        colImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favIconImage"]];
        [self addSubview:colImg];
        [colImg release];
        // 收藏数
        colL = [[UILabel alloc] init];
        colL.textColor = RGBA(111, 111, 111, 1);
        colL.font = [UIFont systemFontOfSize:14];
        [self addSubview:colL];
        [colL release];
        
        //地标
        addrImg = [[UIImageView alloc] init];
        addrImg.image = [UIImage imageNamed:@"marketDistanceIcon"];
        [self addSubview:addrImg];
        [addrImg release];
        
        //店名
        addrLable = [[UILabel alloc] init];
        addrLable.textAlignment = NSTextAlignmentLeft;
        addrLable.textColor = RGBA(111, 111, 111, 1);
        [self addSubview:addrLable];
        [addrLable release];
        
    }
    return self;
}

- (void)setGood:(GoodStore *)good
{
    _good = good;
    
    [_picBtn setBackgroundImageWithURL:[NSURL URLWithString:_good.firstImg]];
    nameLable.text=_good.goodName;
    moneyL.text = [NSString stringWithFormat:@"¥ %d",[good.disPrice intValue]];
    colL.text = _good.concernedNumber;
    addrLable.text = _good.shopName;
    
    favoLab.text = _good.favoriteNumber;
}

- (void)layoutSubviews
{
    whiteView.frame=CGRectMake(0, 0, 155, [_good.height floatValue]+83);
    _picBtn.frame=CGRectMake(0, 0, 155, [_good.height floatValue]);
    nameLable.frame=CGRectMake(2, [_good.height floatValue]+3,153, 20);
    moneyL.frame = CGRectMake(5, [_good.height floatValue]-45, 70, 30);
    
    colImg.frame = CGRectMake(110, [_good.height floatValue]+33, 15, 15);
    colL.frame = CGRectMake(133, [_good.height floatValue]+32, 10, 20);
    
    addrImg.frame = CGRectMake(5, [_good.height floatValue]+63, 12, 16);
    addrLable.frame = CGRectMake(22, [_good.height floatValue]+60, 125, 20);
    
    authImg.frame = CGRectMake(2, [_good.height floatValue]+33, 15, 15);
    authLab.frame = CGRectMake(25, [_good.height floatValue]+30, 40, 20);
    
    favoImg.frame = CGRectMake(65, [_good.height floatValue]+33, 15, 15);
    favoLab.frame = CGRectMake(88, [_good.height floatValue]+32, 10, 20);
    
    
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

@end
