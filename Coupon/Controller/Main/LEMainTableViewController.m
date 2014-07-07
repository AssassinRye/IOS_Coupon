//
//  LEMainTableViewController.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-4.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainTableViewController.h"
#import "LEMainFunctionTableViewCell.h"
#import "LEMainADTableViewCell.h"
#import "LEMainDataTableViewCell.h"

@interface LEMainTableViewController ()

@end

@implementation LEMainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.tableView.dataSource =self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 2;
    }else if(section == 1){
        return 5;
    }
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.f;
    }else if(section == 1){
        return 30.f;
    }
    return 0.f;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"dasdsda";
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    // 设置一个组头view
    if (section != 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, 200, 25)];
        [titleLabel setText:@"热们优惠 HOT SALE"];
        [titleLabel setTextColor:[UIColor blackColor]];
        [titleLabel setFont:[UIFont fontWithName:@"华文细黑" size:12.5]];
        [titleLabel sizeToFit];
        [tableView.tableHeaderView addSubview:titleLabel];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(51, 26, 4, 2)];
        [imageView setBackgroundColor:[UIColor blackColor]];
        [tableView.tableHeaderView addSubview:imageView];
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(11, 28, 298, 2)];
        [lineLabel setBackgroundColor:[UIColor redColor]];
        [tableView.tableHeaderView addSubview:lineLabel];
        return tableView.tableHeaderView;
        
    }
    return tableView.tableHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 140.f;
        }else if(indexPath.row == 1){
            return 150.f;
        }
    }
    return 90.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //
            LEMainADTableViewCell *adCell = [[LEMainADTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adCell"];
            adCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return adCell;
        }else if(indexPath.row == 1){
            LEMainFunctionTableViewCell *functionCell = [[LEMainFunctionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"functionCell"];
            functionCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return functionCell;
        }
    }else if (indexPath.section == 1){
        LEMainDataTableViewCell *dataCell = [tableView dequeueReusableCellWithIdentifier:@"shanghuCell"];
        if (!dataCell) {
            dataCell = [[LEMainDataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dataCell"];
        }
        return dataCell;
    }
    return nil;
    
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
