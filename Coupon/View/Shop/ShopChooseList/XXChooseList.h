//
//  XXChooseList.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-10.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXChooseListButton.h"

@interface XXChooseList : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) XXChooseListButton *leftButton;
@property (nonatomic) XXChooseListButton *rightButton;

@end
