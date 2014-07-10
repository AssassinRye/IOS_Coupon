//
//  LEMyselfTableViewController.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-8.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMyselfTableViewController.h"
#import "LEMyselfLoginTableViewCell.h"

@interface LEMyselfTableViewController ()
{
    NSArray *_cellDataArray; // cell数据数组
}

@end

@implementation LEMyselfTableViewController

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
    

    _cellDataArray = @[@{@"imageName":@"ios_myself_chagePassword",@"titleName":@"修改密码"},@{@"imageName":@"ios_myself_chageVip",@"titleName":@"升级会员"},@{@"imageName":@"ios_myself_consumption",@"titleName":@"消费记录"}];
    
   
    
    self.navigationController.navigationItem.title = @"个人中心";
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        //    Load resources for iOS 6.1 or earlier
        self.navigationController.navigationBar.tintColor = [CommonlyUsedMethod colorWithHexString:@"#FF6738"];
    } else {
        // Load resources for iOS 7 or later
        self.navigationController.navigationBar.barTintColor = [CommonlyUsedMethod colorWithHexString:@"#FF6738"];
    }
    // 去掉多余的分割线
    [self setExtraCellLineHidden:self.tableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
// 去掉多余分割线
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    
    if (section == 0) {
        return 5;
    }else{
        return 0;
    }
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 130.f;
    }else if (indexPath.row == 1){
        return 10.f;
    }else{
        return 40.f;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 登录cell
        LEMyselfLoginTableViewCell *loginCell  = [[LEMyselfLoginTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"loginCell"];
        
        return loginCell;
    }else if(indexPath.row == 1){
        // 空白行cell
        UITableViewCell *emptyCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"emptyCell"];
        emptyCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return emptyCell;
    }else{
        // 功能cell
        UITableViewCell *normalCell = [tableView dequeueReusableCellWithIdentifier:@"normalCell"];
        if (!normalCell) {
            normalCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"normalCell"];
        }
        // 箭头类型
        [normalCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        // 添加image
        normalCell.imageView.image = [UIImage imageNamed:_cellDataArray[indexPath.row - 2][@"imageName"]];
        normalCell.textLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#666666"];
        normalCell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.f];
        normalCell.textLabel.text = _cellDataArray[indexPath.row - 2][@"titleName"];
        return normalCell;

    }
   
    
    // Configure the cell...
    
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
