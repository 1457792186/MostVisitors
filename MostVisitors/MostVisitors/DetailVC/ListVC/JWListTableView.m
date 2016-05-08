//
//  JWListTableView.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWListTableView.h"

@implementation JWListTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dataArray = [[NSMutableArray alloc]initWithCapacity:0];
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self downRefreshGetData];
        }];
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self upRefreshGetData];
        }];
    }
    return self;
}
#pragma mark - NetWorking
- (void)downRefreshGetData{
    
    JWAFNetWorking * manger = [JWAFNetWorking manger];
    __weak typeof(self)mySelf = self;
    
    [manger.manger GET:[self.model.apiurl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [mySelf.mj_header endRefreshing];
        
//        JWLog(@"%@",responseObject);
        mySelf.listModel = [[JWListModel alloc]initWithArray:responseObject];
        mySelf.dataArray = [NSMutableArray arrayWithArray:mySelf.listModel.list];
        [mySelf reloadData];
        [mySelf scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
    
    
}

- (void)upRefreshGetData{
    
    JWAFNetWorking * manger = [JWAFNetWorking manger];
    __weak typeof(self)mySelf = self;
    [manger.manger GET:[self.model.apiurl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [mySelf.mj_footer endRefreshing];
        
        mySelf.listModel = [[JWListModel alloc]initWithArray:responseObject];
        [mySelf.dataArray addObjectsFromArray:self.listModel.list];
        [mySelf reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
    
}

@end
