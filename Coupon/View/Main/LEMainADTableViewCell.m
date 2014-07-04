//
//  LEMainADTableViewCell.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-4.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "LEMainADTableViewCell.h"
#import "LEMainADImageView.h"

@interface LEMainADTableViewCell()<UIScrollViewDelegate>
{
    UIScrollView *adScrollView_;
    UIPageControl *adPageContrl_;
    NSInteger page_;
    NSTimer *adChangeTimer_;
}

@end

@implementation LEMainADTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self loadADCell];
    }
    return self;
}

// 加载广告Cell
- (void) loadADCell
{
    // 存放广告的容器视图
    adScrollView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(11, 5, MAINADIMAGEBUTTON_SIZE_WIDTH, MAINADIMAGEBUTTON_SIZE_HEIGHT)];
    [adScrollView_ setContentSize:CGSizeMake(MAINADIMAGEBUTTON_SIZE_WIDTH * 3, MAINADIMAGEBUTTON_SIZE_HEIGHT)];
    [adScrollView_ setShowsHorizontalScrollIndicator:NO];
    [adScrollView_ setShowsVerticalScrollIndicator:NO];
    [adScrollView_ setBounces:NO];
    [adScrollView_ setPagingEnabled:YES];
    [adScrollView_ setDelegate:self];
    // 添加3个imageView
    for (int i = 0; i < 3; i ++) {
        LEMainADImageView *mainADImangeView = [[LEMainADImageView alloc] initWithPoint:CGPointMake(MAINADIMAGEBUTTON_SIZE_WIDTH * i, 0)];
        [adScrollView_ addSubview:mainADImangeView];
    }
    //pagecontroll设置
    adPageContrl_ = [[UIPageControl alloc] initWithFrame:CGRectMake(140, 94, 39, 37)];
    [adPageContrl_ setNumberOfPages:3];
    [adPageContrl_ setCurrentPage:0];
    [adPageContrl_ addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [adScrollView_ setBackgroundColor:[UIColor yellowColor]];
    [adPageContrl_ setBackgroundColor:[UIColor redColor]];
    [self.contentView addSubview:adScrollView_];
    [self.contentView addSubview:adPageContrl_];
    adChangeTimer_ = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];

}

- (void) scrollToNextPage:(NSTimer *)timer
{
    if (adPageContrl_.currentPage >= 2) {
        adPageContrl_.currentPage = 0;
    }else{
        adPageContrl_.currentPage ++;
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 暂停
    [adChangeTimer_ setFireDate:[NSDate distantFuture]];
//    [adChangeTimer_ invalidate];
}

// pagecontroll执行方法
- (void)changePage:(UIPageControl *)pageControl {
    
    //获取当前pagecontroll的值
    page_ = pageControl.currentPage;
    //根据pagecontroll的值来改变scrollview的滚动位置，以此切换到指定的页面
    [adScrollView_ setContentOffset:CGPointMake(MAINADIMAGEBUTTON_SIZE_WIDTH * page_, 0)];
    
}

// scrollview的委托方法，当滚动时执行
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
    // 通过滚动的偏移量来判断目前页面所对应的小白点
    page_ = scrollView.contentOffset.x / MAINADIMAGEBUTTON_SIZE_WIDTH;
//    // pagecontroll响应值的变化
//    adPageContrl_.currentPage = page;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 通过滚动的偏移量来判断目前页面所对应的小白点
    page_ = scrollView.contentOffset.x / MAINADIMAGEBUTTON_SIZE_WIDTH;
    // pagecontroll响应值的变化
    adPageContrl_.currentPage = page_;
    // 继续
    [adChangeTimer_ setFireDate:[NSDate date]];
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
