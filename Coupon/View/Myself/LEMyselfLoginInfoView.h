//
//  LEMyselfLoginInfoView.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-9.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEMyselfLoginInfoView : UIView

@property (strong, nonatomic) UIImage *titleImage;
@property (copy, nonatomic) NSString *countLabelText;
@property (copy, nonatomic) NSString *titleLabelText;

- (id)initPoint:(CGPoint)point andDataDic:(NSDictionary *)dic;

@end
