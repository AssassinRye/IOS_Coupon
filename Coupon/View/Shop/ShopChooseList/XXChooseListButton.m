//
//  XXChooseListButton.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-10.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "XXChooseListButton.h"
#import "UIImage+Tint.h"

@implementation XXChooseListButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 15, 15)];
        self.titleStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 30, 20)];
        [self.titleStringLabel sizeToFit];
        [self.titleStringLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.f]];
        [self.titleStringLabel setTextColor:[CommonlyUsedMethod colorWithHexString:@"#666666"]];
        self.arrowsImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, self.frame.size.height / 2 - 5, 10, 5)
                                 ];
    }
    return self;
}




- (void)setSelectClick:(BOOL)selectClick
{
    if (selectClick) {
         _titleImage = [_titleImage imageWithGradientTintColor:[CommonlyUsedMethod colorWithHexString:@"#FF6738"]];
        
    }
}
@end
