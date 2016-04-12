//
//  FindMoreCell.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-23.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "FindMoreCell.h"

@interface FindMoreCell ()
{
    UIView * whiteView;
    UILabel *nameLable;
    UILabel *addrLable;
    UILabel *moneyL;
    UIImageView *firmImg;
    UIImageView *colImg;
    UILabel *colL;
    UIImageView *addrImg;
}

@end

@implementation FindMoreCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        // 白底
        whiteView =[[UIView alloc]init];
        whiteView.backgroundColor=[UIColor whiteColor];
        [self addSubview:whiteView];
        [whiteView release];
        
        // 图片
        _picBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_picBtn];
        
        //商标
        firmImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conFirmIconmiddle"]];
        firmImg.frame = CGRectMake(7, 7, 33, 28);
        [self addSubview:firmImg];
        [firmImg release];
        
        // 货名
        nameLable = [[UILabel alloc] init];
        [self addSubview:nameLable];
        [nameLable release];
        
        //价格
        moneyL = [[UILabel alloc] init];
        
        moneyL.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];//就即是粗体又是斜体
        moneyL.textColor = [UIColor redColor];
        moneyL.textAlignment = NSTextAlignmentLeft;
        [self addSubview:moneyL];
        [moneyL release];
        
        //收藏
        colImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favIconCowry"]];
        [self addSubview:colImg];
        [colImg release];
        // 收藏数
        colL = [[UILabel alloc] init];
        colL.textColor = RGBA(100, 100, 100, 1);
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
        [self addSubview:addrLable];
        [addrLable release];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setGood:(GoodStore *)good
{
    _good = good;
    
    [_picBtn setBackgroundImageWithURL:[NSURL URLWithString:_good.firstImg]];
    nameLable.text=_good.goodName;
    moneyL.text = [NSString stringWithFormat:@"¥%d",[good.disPrice intValue]];
    colL.text = _good.concernedNumber;
    addrLable.text = _good.shopName;
}

- (void)layoutSubviews
{
    whiteView.frame=CGRectMake(0, 0, 150, [_good.height floatValue]+83);
    _picBtn.frame=CGRectMake(0, 0, 150, [_good.height floatValue]);
    nameLable.frame=CGRectMake(0, [_good.height floatValue]+3,150, 20);
    moneyL.frame = CGRectMake(5, [_good.height floatValue]+27, 70, 30);
    colImg.frame = CGRectMake(90, [_good.height floatValue]+30, 20, 20);
    colL.frame = CGRectMake(115, [_good.height floatValue]+32, 10, 20);
    addrImg.frame = CGRectMake(5, [_good.height floatValue]+60, 15, 20);
    addrLable.frame = CGRectMake(22, [_good.height floatValue]+60, 125, 20);

}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
