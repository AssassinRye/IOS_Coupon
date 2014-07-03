//
//  LE_MainTableViewCellButton.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-3.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainTableViewCellButton.h"

@interface LEMainTableViewCellButton()
{
    // 创建tap longPress手势触发器
    @private
    
    UITapGestureRecognizer *button_tapGestureRecogizer;
    UILongPressGestureRecognizer *button_longPressGestureRecognizer;

}

@end

@implementation LEMainTableViewCellButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}


- (id)initPoint:(CGPoint)point ImageAndTitle:(NSDictionary *)dic
{
    self = [super initWithFrame:CGRectMake(point.x, point.y,MAINTABLEVIEWBUTTON_SIZE_WIDTH ,MAINTABLEVIEWBUTTON_SIZE_HEIGHT)];
    if (self) {
        self.imageName = dic[@"imageName"];
        self.titleName = dic[@"titleName"];
        self.frame = CGRectMake(point.x, point.y,MAINTABLEVIEWBUTTON_SIZE_WIDTH ,MAINTABLEVIEWBUTTON_SIZE_HEIGHT);
        // 给自己添加tap手势触发器
        self -> button_tapGestureRecogizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogizeClick:)];
        [self addGestureRecognizer:button_tapGestureRecogizer];
        // 给自己添加longPress手势触发器
        self -> button_longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogizeClick:)];
        [self addGestureRecognizer:button_longPressGestureRecognizer];
        [self loadButton];
        }
    
    return self;
}



// 加载button中的图片文字
- (void) loadButton
{
    [self setBackgroundColor:[UIColor whiteColor]];
    // 添加图片视图并设为圆角
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageName]];
    imageView.frame = CGRectMake(22, 20, 35, 35);
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 6.0;
    [self addSubview:imageView];
    // 添加标题标签并设置字体
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 63, MAINTABLEVIEWBUTTON_SIZE_WIDTH, 21)];
    titleLabel.text = self.titleName;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"宋体" size:12.f];
    [self addSubview:titleLabel];
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
