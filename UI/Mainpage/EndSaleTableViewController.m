//
//  EndSaleTableViewController.m
//  FamousGradeStreet
//
//  Created by cc on 14-11-20.
//  Copyright (c) 2014年 JiangLin. All rights reserved.
//

#import "EndSaleTableViewController.h"
#import "SpecialCell.h"

@interface EndSaleTableViewController ()

@property (nonatomic, retain) NSMutableArray *overlArray;

@end

@implementation EndSaleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    self.overlArray = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
    
    
    [HTTPRequestEnding getSaleOverComplete:^(NSMutableArray *overArray) {
        self.overlArray = overArray;
        
        self.tableView.rowHeight = 170;
        [self.tableView reloadData];
        [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
        [self.tableView headerBeginRefreshing];
        [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    }];
}

- (void)headerRereshing {
    [self.tableView headerEndRefreshing];
}

- (void)footerRereshing {
//    SHOWALERT(@"亲，已经没有新特卖咯！");
    [self.tableView footerEndRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.overlArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SpecialCell" owner:nil options:nil] objectAtIndex:0];
    }
    Special *special = [self.overlArray objectAtIndex:indexPath.row];
    
    cell.backgroundColor = RGBA(230, 230, 230, 1);
    [cell.loadText setBackgroundImage:[UIImage imageNamed:@"timeStatusBg3.png"] forState:UIControlStateNormal];
    [cell.loadText setTitle:special.time_status forState:UIControlStateNormal];
    [cell.loadText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cell.loadText.titleLabel.font = [UIFont systemFontOfSize:15];
    [cell.bigImage setImageWithURL:[NSURL URLWithString:special.wap_img]];
    cell.titleLabel.text = special.title;
    cell.titleLabel.adjustsFontSizeToFitWidth = YES;
    cell.discountLabel.text = special.discount;
    cell.discountLabel.adjustsFontSizeToFitWidth = YES;
    
    
    if ([special.has_coupon intValue] == 0) {
        [cell.couponImage setImage:[UIImage imageNamed:@"promoHasIconNO.png"]];
    }else {
        [cell.couponImage setImage:[UIImage imageNamed:@"promoHasIconYES.png"]];
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //调用block
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
