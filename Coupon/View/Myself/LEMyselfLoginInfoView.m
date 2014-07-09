//
//  LEMyselfLoginInfoView.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-9.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMyselfLoginInfoView.h"

@implementation LEMyselfLoginInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initPoint:(CGPoint)point andDataDic:(NSDictionary *)dic
{
    self = [super initWithFrame:CGRectMake(point.x, point.y, 320 / 3, 70)];
    if (self) {
        // 设置infoView的图片 与 标签
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dic[@"titleImage"]]];
        [imageView setFrame:CGRectMake(20, 20, 30, 30)];
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 15, 50, 20)];
        countLabel.textAlignment = NSTextAlignmentCenter;
        countLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.f];
        countLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#666666"];
        countLabel.text = dic[@"countText"];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 50, 30)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15.f];
        titleLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#666666"];
        titleLabel.text = dic[@"titleText"];
        [self addSubview:imageView];
        [self addSubview:countLabel];
        [self addSubview:titleLabel];
    }
    return self;
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
