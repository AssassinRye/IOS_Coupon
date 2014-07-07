//
//  LEDelectLineLabel.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-7.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEDelectLineLabel.h"

@implementation LEDelectLineLabel

@synthesize delectLineEnabled = _delectLineEnabled;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
    

    CGSize textSize = [[self text] sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] }];
    CGFloat strikeWidth = textSize.width;
    CGRect lineRect;
    
    if ([self textAlignment] == NSTextAlignmentRight) {
        lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2, strikeWidth, 1);
    } else if ([self textAlignment] == NSTextAlignmentCenter) {
        lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2, strikeWidth, 1);
    } else {
        lineRect = CGRectMake(0, rect.size.height/2, strikeWidth, 1);
    }
    
    if (_delectLineEnabled) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextFillRect(context, lineRect);
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
