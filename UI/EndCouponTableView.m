//
//  EndCouponTableView.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "EndCouponTableView.h"
#import "EndCouponCell.h"

@interface EndCouponTableView ()

@property (nonatomic, retain) NSMutableArray *couponEndArray;

@end

@implementation EndCouponTableView

- (void)dealloc {
    self.couponEndArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
    
    [HTTPRequestEnding getCouponEndComplete:^(NSMutableArray *couponEndArray) {
        self.couponEndArray = couponEndArray;
        
        self.tableView.rowHeight = 170;
        [self.tableView reloadData];
        NSLog(@"array-->>%ld",self.couponEndArray.count);
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
    return self.couponEndArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell1";
    
    EndCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CouponCell" owner:nil options:nil] objectAtIndex:1];
    }
    EndCoupon *endCoupon = [self.couponEndArray objectAtIndex:indexPath.row];
    
    [cell.couponImage setImageWithURL:[NSURL URLWithString:endCoupon.cover_img]];
    cell.couponName.text = endCoupon.ticket_title;
    cell.couponName.adjustsFontSizeToFitWidth = YES;
    cell.priceLabel.text = [endCoupon.selling_price substringToIndex:2];
    cell.dispriceLabel.text = [NSString stringWithFormat:@"￥%@",[endCoupon.par_value substringToIndex:3]];
    cell.dispriceLabel.adjustsFontSizeToFitWidth = YES;
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
