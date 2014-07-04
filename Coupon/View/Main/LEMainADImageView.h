//
//  LEMainADImageView.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-4.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LEMainADImageViewDelegate

// 点击button切换视图
- (void) gestureRecognizerPushViewController;

@end

@interface LEMainADImageView : UIImageView

@property (strong, nonatomic) id<LEMainADImageViewDelegate> delegate;
- (id)initWithPoint:(CGPoint)point;
@end
