//
//  FindSingleCell.m
//  FamousGradeStreet
//
//  Created by FZHONGLI on 14-11-22.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "FindSingleCell.h"

@interface FindSingleCell()
{
    UIView *whiteview;
    UIImageView *headImage;
    UILabel *userLa;
    UILabel *addrLable;
    UILabel *nameLable;
    UILabel *moneyL;
    UIImageView *firmImg;
    UILabel *litL;
    UIImageView *fovaImg;
    UIImageView *colImg;
    UILabel *favL;
    UILabel *colL;
}


@end

@implementation FindSingleCell

//@synthesize good=good;
//@synthesize picBtn = picBtn;

- (void)dealloc {
    self.picBtn = nil;
    self.good = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        // 白底
        whiteview = [[UIView alloc] init];
        whiteview.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteview];
        [whiteview release];
        
        //用户名
        userLa = [[UILabel alloc] initWithFrame:CGRectMake(45, 15, 100, 20)];
        userLa.textColor = [UIColor redColor];
        userLa.adjustsFontSizeToFitWidth = YES;
        [self addSubview:userLa];
        [userLa release];
        
        //店名
        addrLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 15, 140, 20)];
        addrLable.textAlignment = NSTextAlignmentRight;
//        addrLable.adjustsFontSizeToFitWidth = YES;
        [self addSubview:addrLable];
        [addrLable release];
        
        //地标
        UIImageView *addrImg = [[UIImageView alloc] initWithFrame:CGRectMake(310-15, 15, 15, 20)];
        addrImg.image = [UIImage imageNamed:@"marketDistanceIcon"];
        [self addSubview:addrImg];
        [addrImg release];
        
        //图
        _picBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_picBtn];
        
        //头像
        headImage = [[UIImageView alloc] init];
        headImage.frame = CGRectMake(10, 10, 35, 35);
        headImage.layer.cornerRadius = 35/2;
        headImage.clipsToBounds = YES;
        [self addSubview:headImage];
        [headImage release];
        
        //货名
        nameLable = [[UILabel alloc] init];
        nameLable.adjustsFontSizeToFitWidth = YES;
        [self addSubview:nameLable];
        [nameLable release];
        
        //价格
        moneyL = [[UILabel alloc] init];
        moneyL.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];
        moneyL.textColor = [UIColor redColor];
        moneyL.textAlignment = NSTextAlignmentRight;
        [self addSubview:moneyL];
        [moneyL release];
        
        //商标
        firmImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conFirmIconmiddle"]];
        [self addSubview:firmImg];
        [firmImg release];
        
        litL = [[UILabel alloc] init];
        litL.text = @"onfirm";
        litL.textColor = RGBA(145, 145, 145, 1);
        litL.adjustsFontSizeToFitWidth = YES;
        [self addSubview:litL];
        [litL release];
        
        
        // 点赞
        fovaImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"marketFavNumIcon"]];
        [self addSubview:fovaImg];
        [fovaImg release];
        
        //收藏
        colImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"favIconCowry"]];
        [self addSubview:colImg];
        [colImg release];
        
        favL = [[UILabel alloc] init];
        favL.textColor = RGBA(100, 100, 100, 1);
        [self addSubview:favL];
        [favL release];
        
        colL = [[UILabel alloc] init];
        colL.textColor = RGBA(100, 100, 100, 1);
        [self addSubview:colL];
        [colL release];
        
        
    }
    return self;
}

- (void)setGood:(GoodStore *)good
{
    NSLog(@"%@",good.width);
    NSLog(@"%@",good.height);
    _good = good;
    [headImage setImageWithURL:[NSURL URLWithString:_good.avatar] placeholderImage:[UIImage imageNamed:@"userHeaderDefault"]];
    userLa.text = _good.userName;
    addrLable.text = _good.shopName;
    [_picBtn setBackgroundImageWithURL:[NSURL URLWithString:_good.firstImg]];
    nameLable.text = good.goodName;
    moneyL.text = [NSString stringWithFormat:@"¥%d",[good.disPrice intValue]];
    favL.text = good.favoriteNumber;
    colL.text = good.concernedNumber;
    [self setSubviews];
}


- (void)setSubviews
{
    float height = ([_good.height floatValue]/[_good.width floatValue])*310.0;
    
    
    //    height =200;
    
    whiteview.frame = CGRectMake(5, 5, 310, height+100);
    _picBtn.frame = CGRectMake(5, 40, 310, height);
    nameLable.frame = CGRectMake(10, height+45, 230, 20);
    moneyL.frame = CGRectMake(310-70, height+45, 70, 30);
    firmImg.frame = CGRectMake(10, height+70, 25, 25);
    litL.frame = CGRectMake(32, height+80, 39, 15);
    fovaImg.frame = CGRectMake(90, height+75, 20, 20);
    colImg.frame = CGRectMake(160, height+77, 20, 20);
    favL.frame = CGRectMake(112, height+75, 10, 20);
    colL.frame = CGRectMake(182, height+77, 10, 20);
}








//- (void)layoutSubviews
//{
//    float height = ([_good.height floatValue]/[_good.width floatValue])*310.0;
//   
//    
////    height =200;
//    
//    whiteview.frame = CGRectMake(5, 5, 310, height+100);
//    _picBtn.frame = CGRectMake(5, 40, 310, height);
//    nameLable.frame = CGRectMake(10, height+45, 230, 20);
//    moneyL.frame = CGRectMake(310-70, height+45, 70, 30);
//    firmImg.frame = CGRectMake(10, height+70, 25, 25);
//    litL.frame = CGRectMake(32, height+80, 39, 15);
//    fovaImg.frame = CGRectMake(90, height+75, 20, 20);
//    colImg.frame = CGRectMake(160, height+77, 20, 20);
//    favL.frame = CGRectMake(112, height+75, 10, 20);
//    colL.frame = CGRectMake(182, height+77, 10, 20);
//}
//
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
