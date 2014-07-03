//
//  LE_MainTableViewCellButton.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-3.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LEMainTableViewCellButtonDelegate

// 点击button切换视图
- (void) gestureRecognizerPushViewController;

@end


@interface LEMainTableViewCellButton : UIView


@property (strong, nonatomic) id<LEMainTableViewCellButtonDelegate> delegate;
@property (copy, nonatomic) NSString *titleName; // 标题
@property (copy, nonatomic) NSString *imageName; // 图片


- (id)initPoint:(CGPoint)point ImageAndTitle:(NSDictionary *)dic;
@end
