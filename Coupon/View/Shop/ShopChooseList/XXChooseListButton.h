//
//  XXChooseListButton.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-10.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXChooseListButton : UIView

// 标题图片
@property (nonatomic) UIImageView *titleImageView;
// 标题
@property (nonatomic) UILabel *titleStringLabel;
// 是否点击
@property  (getter = isSelectClick ,nonatomic) BOOL selectClick;
// 箭头图片
@property (nonatomic) UIImageView *arrowsImageView;
// 初始化
- (id)initPoint:(CGPoint) point;
@end
