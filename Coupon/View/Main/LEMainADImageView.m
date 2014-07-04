//
//  LEMainADImageView.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-4.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainADImageView.h"

@interface LEMainADImageView()
{
    // 创建tap longPress手势触发器
@private
    
    UITapGestureRecognizer *button_tapGestureRecogizer;
    UILongPressGestureRecognizer *button_longPressGestureRecognizer;
    
}

@end



@implementation LEMainADImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithPoint:(CGPoint)point
{
    self = [super initWithFrame:CGRectMake(point.x, point.y, MAINADIMAGEBUTTON_SIZE_WIDTH, MAINADIMAGEBUTTON_SIZE_HEIGHT)];
    if (self) {
        self.frame = CGRectMake(point.x, point.y, MAINADIMAGEBUTTON_SIZE_WIDTH, MAINADIMAGEBUTTON_SIZE_HEIGHT);
        self.userInteractionEnabled = YES;
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
    // 根据手势状态切换图片
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self.delegate gestureRecognizerPushViewController];
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
