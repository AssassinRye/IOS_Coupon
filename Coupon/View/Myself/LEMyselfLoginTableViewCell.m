//
//  LEMyselfLoginTableViewCell.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-8.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMyselfLoginTableViewCell.h"
#import "LEMyselfLoginInfoView.h"

@interface LEMyselfLoginTableViewCell()
{
    UILabel *_loginHintLabel;   // 登录提示标签
    UIButton *_loginButton;     // 登录按钮
    BOOL _buttonSelect;          // 按钮是否点击
}

@end

@implementation LEMyselfLoginTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self loadCell];
    }
    return self;
}

- (void) loadCell
{
    // 登录cell背景
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ios_myself_loginCell_bg"]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [backgroundImage setFrame:CGRectMake(0, 0, 320, 60) ];
    // 登录提示标签
    _loginHintLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 25, 100, 20)];
    _loginHintLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.f];
    _loginHintLabel.textColor = [CommonlyUsedMethod colorWithHexString:@"#666666"];
    _loginHintLabel.text = @"亲，您还未登录哟~";
    [_loginHintLabel sizeToFit];
    // 登录按钮
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 15, 60,30)];
    [_loginButton setImage:[UIImage imageNamed:@"ios_myself_loginCell_loginButton"] forState:UIControlStateNormal];
    _loginButton.alpha = 0.8f;
    _buttonSelect = NO;
    [_loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    // 加载信息视图
    LEMyselfLoginInfoView *ticketInfoView = [[LEMyselfLoginInfoView alloc] initPoint:CGPointMake(0, backgroundImage.frame.size.height)andDataDic:@{@"titleText": @"电子卷",@"countText":@"0",@"titleImage":@"ios_myself_loginCell_ticket"}];

    
    UIImageView *borderImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(320 / 3 + 1, backgroundImage.frame.size.height + 10, 1, 50)];
    borderImageView1.image = [UIImage imageNamed:@"ios_myself_loginCell_border"];
    
    LEMyselfLoginInfoView *scoreInfoView = [[LEMyselfLoginInfoView alloc] initPoint:CGPointMake(320 / 3, backgroundImage.frame.size.height)andDataDic:@{@"titleText": @"积分",@"countText":@"0",@"titleImage":@"ios_myself_loginCell_scroe"}];


    
    UIImageView *borderImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(320 - 320 / 3 + 1, backgroundImage.frame.size.height + 10, 1, 50)];
    borderImageView2.image = [UIImage imageNamed:@"ios_myself_loginCell_border"];

    
    LEMyselfLoginInfoView *collectInfoView = [[LEMyselfLoginInfoView alloc] initPoint:CGPointMake(320 - 320 / 3, backgroundImage.frame.size.height) andDataDic:@{@"titleText": @"收藏",@"countText":@"0",@"titleImage":@"ios_myself_loginCell_collect"}];
    

    [self.contentView addSubview:backgroundImage];
    [self.contentView addSubview:_loginHintLabel];
    [self.contentView addSubview:_loginButton];
    [self.contentView addSubview:ticketInfoView];
    [self.contentView addSubview:borderImageView1];
    [self.contentView addSubview:scoreInfoView];
    [self.contentView addSubview:borderImageView2];
    [self.contentView addSubview:collectInfoView];
    
}

// 登录按钮点击事件
- (void) loginButtonClick:(UIButton *) button
{
    if (!_loginButton.selected) {
        _buttonSelect = YES;
        [_loginButton setImage:[UIImage imageNamed:@"ios_myself_loginCell_loginButton"] forState:UIControlStateNormal];
    }else{
        _buttonSelect = NO;
        [_loginButton setImage:[UIImage imageNamed:@"ios_myself_loginCell_selectloginButton"] forState:UIControlStateNormal];
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
