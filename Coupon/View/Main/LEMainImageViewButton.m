//
//  LEMainImageViewButton.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-3.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainImageViewButton.h"

@interface LEMainImageViewButton()
{
    // 创建tap longPress手势触发器
    @private
    
    UITapGestureRecognizer *button_tapGestureRecogizer;
    UILongPressGestureRecognizer *button_longPressGestureRecognizer;
    
}

@end

@implementation LEMainImageViewButton


- (id)initWithPoint:(CGPoint)point andData:(NSDictionary *)dic
{
    self = [super initWithFrame:CGRectMake(point.x, point.y,MAINIMAGEVIEWBUTTON_SIZE_WIDTH ,MAINIMAGEVIEWBUTTON_SIZE_HEIGHT)];
    if (self) {
        self.image = [UIImage imageNamed:dic[@"imageName"]];
        self.titleName = dic[@"titleName"];
        self.frame = CGRectMake(point.x, point.y,MAINIMAGEVIEWBUTTON_SIZE_WIDTH ,MAINIMAGEVIEWBUTTON_SIZE_HEIGHT);
        // 设置为圆角
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6.0;
        // 给自己添加tap手势触发器
        self -> button_tapGestureRecogizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogizeClick:)];
        [self addGestureRecognizer:button_tapGestureRecogizer];
        // 给自己添加longPress手势触发器
        self -> button_longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogizeClick:)];
        [self addGestureRecognizer:button_longPressGestureRecognizer];
    }
    return self;
}

// 手势触发事件
- (void) gestureRecogizeClick:(UIGestureRecognizer *)gestureRecognizer
{
    // 当手势状态不为结束时 button的背景颜色为灰色
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.delegate gestureRecognizerPushViewController];
    }else{
        [self setBackgroundColor:[UIColor grayColor]];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
