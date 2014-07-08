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
    [self.tabBarController.tabBar setSelectedImageTintColor:[CommonlyUsedMethod colorWithHexString:@"FF6738"]];
    // 根据版本进行navigationController的颜色调整
  if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//    Load resources for iOS 6.1 or earlier
    self.navigationController.navigationBar.tintColor = [CommonlyUsedMethod colorWithHexString:@"FF6738"];
    } else {
        // Load resources for iOS 7 or later
        self.navigationController.navigationBar.barTintColor = [CommonlyUsedMethod colorWithHexString:@"FF6738"];
    }
    [self addRefreshViewControl];
}


// 添加UIRefreshControl下拉刷新控件到UITableViewController的view中
-(void)addRefreshViewControl
{
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(RefreshViewControlEventValueChanged) forControlEvents:UIControlEventValueChanged];
}

-(void)RefreshViewControlEventValueChanged
{
    if (self.refreshControl.refreshing) {
        NSLog(@"refreshing");
//        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"刷新中"];
        [self performSelector:@selector(handleData) withObject:nil afterDelay:2];
    }
}

- (void) handleData
{
    NSLog(@"refreshed");
    [self.refreshControl endRefreshing];
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.tableView reloadData];
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.f;
    }else if(section == 1){
        return 25.f;
    }
    return 0.f;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    // 设置一个组头view
    if (section != 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, 200, 20)];
        [titleLabel setTextColor:[CommonlyUsedMethod colorWithHexString:@"#2f2f2f"]];
        [titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.f]];
        [titleLabel setText:@"热们优惠 HOT SALE"];
        [titleLabel sizeToFit];
        [headerView addSubview:titleLabel];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(70, 21, 4, 2)];
        [imageView setImage:[UIImage imageNamed:@"ios_main_list_arrows"]];
        [headerView addSubview:imageView];
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(11, 23, 298, 2)];
        [lineLabel setBackgroundColor:[UIColor redColor]];
        [headerView addSubview:lineLabel];
        return headerView;
        
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
            // 加载广告cell
            LEMainADTableViewCell *adCell = [[LEMainADTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adCell"];
            adCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return adCell;
        }else if(indexPath.row == 1){
            // 加载功能cell
            LEMainFunctionTableViewCell *functionCell = [[LEMainFunctionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"functionCell"];
            functionCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return functionCell;
        }
    }else if (indexPath.section == 1){
        // 加载数据cell
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
