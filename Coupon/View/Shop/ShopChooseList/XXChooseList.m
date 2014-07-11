//
//  XXChooseList.m
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-10.
//  Copyright (c) 2014年 蓝尔科技(lanerkeji@icloud.com). All rights reserved.
//

#import "XXChooseList.h"

@interface XXChooseList()
{
    UITableView *_leftTableView;
    UITableView *_rightTableView;
    XXChooseListButton *_leftButton;
    XXChooseListButton *_rightButton;
    UIView *_listView;
    
    NSDictionary *_leftDataDictionary;
    NSDictionary *_rightDataDictionary;
    NSArray *_leftDataArray;
    NSArray *_rightDataArray;
}

@end

@implementation XXChooseList
@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void) loadChooseList
{
    _leftDataArray = @[@"附近",@"全城",@"桥东区",@"长安区",@"桥东区",@"长安区"@"裕华区",@"近郊"];
    _rightDataDictionary = @{@"桥东区":@[@"全部",@"3123",@"312",@"321",@"321"],@"长安":@[@"全部",@"长安1",@"长安2",@"长安3",@"长安4"]};
    
    _leftButton = [[XXChooseListButton alloc] initPoint:CGPointMake(0, 0)];
    _leftButton.tag = 20;
    
    _rightButton = [[XXChooseListButton alloc] initPoint:CGPointMake(320 / 2, 0)];
    _rightButton.tag = 30;
    
    _listView = [[UIView alloc] initWithFrame:CGRectMake(0, 35, 320, 300)];
    
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _listView.frame.size.width / 2, _listView.frame.size.height)];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(_listView.frame.size.width / 2, 0, _leftTableView.frame.size.width,  _leftTableView.frame.size.height)];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_leftTableView) {
        return 1;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_leftTableView) {
        if (!_leftDataArray) {
            return _leftDataDictionary.count;
        }else{
            return _leftDataArray.count;
        }
    }else{
        if (!_rightDataArray) {
            return _rightDataDictionary.count;
        }else{
            return _rightDataArray.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_leftTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
        }
        cell.textLabel.text = _leftDataArray[indexPath.row];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightCell"];
        }
        if (_leftButton.selectClick) {
            cell.textLabel.text = _rightDataDictionary[_leftButton.titleStringLabel.text][indexPath.row];
        }else{
             cell.textLabel.text = _rightDataDictionary[_rightButton.titleStringLabel.text][indexPath.row];
        }
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_leftTableView) {
        if (_leftButton.selectClick) {
            _leftButton.titleStringLabel.text = [self tableView:_leftTableView cellForRowAtIndexPath:indexPath].textLabel.text;
        }else{
            _rightButton.titleStringLabel.text = [self tableView:_leftTableView cellForRowAtIndexPath:indexPath].textLabel.text;
        }
        [_rightTableView reloadData];
    }
}

@end
