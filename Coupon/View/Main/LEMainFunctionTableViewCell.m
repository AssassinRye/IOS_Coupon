//
//  LEMainFunctionTableViewCell.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-3.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainFunctionTableViewCell.h"
#import "LEMainImageViewButton.h"

@implementation LEMainFunctionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self loadImageViewButton];
    }
    return self;
}

// 给imageViewButton加载图片和标题
- (void) loadImageViewButton
{
    NSArray *functionArray = [[NSArray alloc] initWithObjects:@"food",@"movie",@"hotel",@"recreation",@"beauty",@"life",@"travel",@"all", nil];
    for (int i = 0; i < functionArray.count; i++) {
        NSDictionary *functionDic = [[NSDictionary alloc] initWithObjectsAndKeys:functionArray[i],@"titleName",[NSString stringWithFormat:@"ios_main_function_%@.png",functionArray[i]],@"imageName", nil];
        // 通过i判断button的行
        if (i < 4) {
            LEMainImageViewButton *imageButton = [[LEMainImageViewButton alloc] initWithPoint:CGPointMake(11 + i * 76, 10) andData:functionDic];
            [self.contentView addSubview:imageButton];

        }else{
            LEMainImageViewButton *imageButton = [[LEMainImageViewButton alloc] initWithPoint:CGPointMake(11 + (i - 4) * 76, 80) andData:functionDic];
            [self.contentView addSubview:imageButton];
        }
        
    }
    
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
