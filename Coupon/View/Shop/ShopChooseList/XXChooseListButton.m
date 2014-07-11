//
//  XXChooseListButton.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-10.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "XXChooseListButton.h"
#import "UIImage+Tint.h"

@interface XXChooseListButton()
{
    // 原始图片
    UIImage *_originalImage;
    // 创建tap longPress手势触发器
@private
    
    UITapGestureRecognizer *button_tapGestureRecogizer;
    UILongPressGestureRecognizer *button_longPressGestureRecognizer;
}

@end

@implementation XXChooseListButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
    }
    return self;
}

- (id)initPoint:(CGPoint) point
{
    self = [super initWithFrame:CGRectMake(point.x, point.y, 320 / 2, 35)];
    if (self) {
        self.frame = CGRectMake(point.x, point.y, 320 / 2, 35);
        // Initialization code
        self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 15, 15)];
        self.titleStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 30, 20)];
        [self.titleStringLabel sizeToFit];
        [self.titleStringLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.f]];
        [self.titleStringLabel setTextColor:[CommonlyUsedMethod colorWithHexString:@"#666666"]];
        self.arrowsImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, self.frame.size.height / 2 - 5, 10, 5)
                                 ];
        // 给自己添加tap手势触发器
        self -> button_tapGestureRecogizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogizeClick:)];
        [self addGestureRecognizer:button_tapGestureRecogizer];
        // 给自己添加longPress手势触发器
        self -> button_longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogizeClick:)];
        [self addGestureRecognizer:button_longPressGestureRecognizer];
        
        [self addSubview:self.titleImageView];
        [self addSubview:self.titleStringLabel];
        [self addSubview:self.arrowsImageView];
        
        
    }
    return self;
}

// 手势触发事件
- (void) gestureRecogizeClick:(UIGestureRecognizer *)gestureRecognizer
{
    // 根据手势状态切换图片
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (self.selectClick) {
            self.selectClick = NO;
        }else{
            self.selectClick = YES;
        }
    }
}



- (void)setSelectClick:(BOOL)selectClick
{
    if (!selectClick) {
        _originalImage = self.titleImageView.image;
        // 动画让箭头旋转
        [UIView animateWithDuration:0.4f animations:^{
            self.titleImageView.image = [self.titleImageView.image imageWithGradientTintColor:[CommonlyUsedMethod colorWithHexString:@"#FF6738"]];
            [self.titleStringLabel setTextColor:[CommonlyUsedMethod colorWithHexString:@"#FF6738"]];
            CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
            [self.arrowsImageView setTransform:rotation];
             }];
    }else{
        [UIView animateWithDuration:0.3f animations:^{
            self.titleImageView.image = _originalImage;
            [self.titleStringLabel setTextColor:[CommonlyUsedMethod colorWithHexString:@"#666666"]];
            CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
            [self.arrowsImageView setTransform:rotation];
        }];
    }
}
@end
