//
//  JWBottomTableView.m
//  MostVisitors
//
//  Created by scjy on 16/4/16.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBottomTableView.h"

@implementation JWBottomTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWBottomTableViewCell * bottomCell = [tableView dequeueReusableCellWithIdentifier:@"JWBottomTableViewCell"];
    if (!bottomCell) {
        bottomCell = [[JWBottomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JWBottomTableViewCell"];
    }
    bottomCell.backgroundColor = [UIColor clearColor];
    return bottomCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (self.height/10);
}


@end
