//
//  SaleCouponTableView.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "SaleCouponTableView.h"
#import "CouponCell.h"

@interface SaleCouponTableView ()

@property (nonatomic, retain) NSMutableArray *couponArray;

@end

@implementation SaleCouponTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    self.couponArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
    
    [HTTPRequestEnding getCouponTwoComplete:^(NSMutableArray *couponTwoArray) {
        self.couponArray = couponTwoArray;
        
        self.tableView.rowHeight = 170;
        [self.tableView reloadData];
    }];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.couponArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    CouponCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CouponCell" owner:nil options:nil] objectAtIndex:0];
    }
    CouponTwo *couponTwo = [self.couponArray objectAtIndex:indexPath.row];
    
    [cell.couponImage setImageWithURL:[NSURL URLWithString:couponTwo.cover_img]];
    cell.couponName.text = couponTwo.ticket_title;
    cell.couponName.adjustsFontSizeToFitWidth = YES;
    cell.priceLabel.text = [couponTwo.selling_price substringToIndex:2];
    cell.disPriceLabel.text = [NSString stringWithFormat:@"￥%@",[couponTwo.par_value substringToIndex:3]];
    cell.disPriceLabel.adjustsFontSizeToFitWidth = YES;
    cell.backgroundColor = RGBA(230, 230, 230, 1);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.completeNum(indexPath.row);
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
