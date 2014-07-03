//
//  LE_MainController.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-3.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainController.h"
#import "LEMainTableViewCellButton.h"

@implementation LEMainController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"123.png",@"imageName",@"苹果",@"titleName", nil];
    LE_MainTableViewCellButton *mainTableViewButton = [[LE_MainTableViewCellButton alloc] initPoint:CGPointMake(20, 20) ImageAndTitle:dic];
    [self.view11 addSubview:mainTableViewButton];
}

@end
