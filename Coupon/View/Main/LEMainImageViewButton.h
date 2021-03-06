//
//  LEMainImageViewButton.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-3.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LEMainFunctionImageViewButtonDelegate

// 点击button切换视图
- (void) gestureRecognizerPushViewController;

@end


@interface LEMainImageViewButton : UIImageView

@property (strong, nonatomic) id<LEMainFunctionImageViewButtonDelegate> delegate;
@property (copy, nonatomic) NSString *titleName; // 标题

// 加载imageButton数据
- (id)initWithPoint:(CGPoint)point andData:(NSDictionary *)dic;


@end
