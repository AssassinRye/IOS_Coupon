//
//  LEMainDataTableViewCell.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-7.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainDataTableViewCell.h"
#import "LEDelectLineLabel.h"

#define LABELORIGIN_X 115
#define LABELORIGIN_Y 63

@interface LEMainDataTableViewCell(){
    
    // 活动指示器
    UIActivityIndicatorView *_imageActivityIndicatorView;
    // 商品图片
    UIImageView *_goodsImageView;
    // 商品名称
    UILabel *_goodsNameLabel;
    // 商品简介
    UILabel *_goodsDescribeLabel;
    // 会员
    UILabel *_goodsMembersLabel;
    // 会员价格
    UILabel *_goodsMembersPriceLabel;
    // 非会员
    UILabel *_goodsNoMembersLabel;
    // 非会员价格
    UILabel *_goodsNoMembersPriceLabel;
    // 原价
    UILabel *_goodsSoriginalLabel;
    // 原价价格
    LEDelectLineLabel *_goodsSoriginalPriceLabel;

}

@end

@implementation LEMainDataTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initDataCell];
    }
    return self;
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

// 加载列表数据Cell
- (void) initDataCell
{
    
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
    // 商品展示图片
    _goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 0, 90, 90)];
    [self.contentView addSubview:_goodsImageView];
    // 活动指示器
    _imageActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _imageActivityIndicatorView.center = _goodsImageView.center;
    [_imageActivityIndicatorView startAnimating];
    [self.contentView addSubview:_imageActivityIndicatorView];
    // 设置商品的名称，各种价格，以及描述
    _goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X, 8, 120, 21)];
    _goodsNameLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:12.0];
     _goodsNameLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#2f2f2f"];
    _goodsNameLabel.text = @"大盘鸡";
    [_goodsNameLabel sizeToFit];
    [self.contentView addSubview:_goodsNameLabel];
    // 简介
    _goodsDescribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X, 22, 181, 35)];
    // 自动折行
    _goodsDescribeLabel.lineBreakMode =NSLineBreakByCharWrapping;
    _goodsDescribeLabel.numberOfLines = 0;
    _goodsDescribeLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:12.0];
    _goodsDescribeLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#999999"];
    _goodsDescribeLabel.text = @"fdsfdsfshljgsjfdfsfsfsfsfdsfsfsfsfsfsfsdfdfdgdfg";
    [_goodsDescribeLabel sizeToFit];
    [self.contentView addSubview:_goodsDescribeLabel];
    // 会员
    _goodsMembersLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X, LABELORIGIN_Y, 22, 21)];
    _goodsMembersLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:9.0];
    _goodsMembersLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#2f2f2f"];
    _goodsMembersLabel.text = @"会员";
    [_goodsMembersLabel sizeToFit];
    [self.contentView addSubview:_goodsMembersLabel];
    // 会员价格
    _goodsMembersPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X + _goodsMembersLabel.frame.size.width, LABELORIGIN_Y, 22, 21)];
    _goodsMembersPriceLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:15.0];;
    _goodsMembersPriceLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#ff0000"];
     _goodsMembersPriceLabel.text = @"￥160";
    [_goodsMembersPriceLabel sizeToFit];
    [self.contentView addSubview:_goodsMembersPriceLabel];
    // 非会员
    _goodsNoMembersLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X + _goodsMembersLabel.frame.size.width + _goodsMembersPriceLabel.frame.size.width, LABELORIGIN_Y, 22, 21)];
    _goodsNoMembersLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:9.0];
    _goodsNoMembersLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#2f2f2f"];
    _goodsNoMembersLabel.text = @"非会员";
    [_goodsNoMembersLabel sizeToFit];
    [self.contentView addSubview:_goodsNoMembersLabel];
    // 非会员价格
    _goodsNoMembersPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X + _goodsMembersLabel.frame.size.width + _goodsMembersPriceLabel.frame.size.width + _goodsNoMembersLabel.frame.size.width, LABELORIGIN_Y, 22, 21)];
    _goodsNoMembersPriceLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:15.0];;
    _goodsNoMembersPriceLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#ff6738"];
    _goodsNoMembersPriceLabel.text = @"￥160";
    [_goodsNoMembersPriceLabel sizeToFit];
    [self.contentView addSubview:_goodsNoMembersPriceLabel];
    // 原价
    _goodsSoriginalLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X + _goodsMembersLabel.frame.size.width + _goodsMembersPriceLabel.frame.size.width + _goodsNoMembersLabel.frame.size.width + _goodsNoMembersPriceLabel.frame.size.width, LABELORIGIN_Y, 22, 21)];
    _goodsSoriginalLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:9.0];
    _goodsSoriginalLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#2f2f2f"];
    _goodsSoriginalLabel.text = @"原价";
    [_goodsSoriginalLabel sizeToFit];
    [self.contentView addSubview:_goodsSoriginalLabel];
    // 原价价格
    _goodsSoriginalPriceLabel = [[LEDelectLineLabel alloc] initWithFrame:CGRectMake(LABELORIGIN_X + _goodsMembersLabel.frame.size.width + _goodsMembersPriceLabel.frame.size.width + _goodsNoMembersLabel.frame.size.width + _goodsNoMembersPriceLabel.frame.size.width + _goodsSoriginalLabel.frame.size.width, LABELORIGIN_Y, 22, 21)];
    _goodsSoriginalPriceLabel.delectLineEnabled = YES;
    _goodsSoriginalPriceLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:10.0];
    _goodsSoriginalPriceLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#2f2f2f"];
     _goodsSoriginalPriceLabel.text = @"￥160";
    [_goodsSoriginalPriceLabel sizeToFit];
    [self.contentView addSubview:_goodsSoriginalPriceLabel];
}

- (void) loadCellData
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
        });
    });
}

@end
