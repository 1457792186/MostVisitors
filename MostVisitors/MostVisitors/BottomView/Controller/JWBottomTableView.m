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
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self registerNib:[UINib nibWithNibName:@"JWBottomTableViewCell" bundle:nil] forCellReuseIdentifier:@"JWBottomTableViewCell"];
        
        [self requestData];
    }
    return self;
}

- (void)requestData{
    JWAFNetWorking * manger = [JWAFNetWorking manger];
    NSDictionary * parameters = @{@"action":@"topiccategory",@"curl":@"bhxy2",@"from":@"com.ipadown.bhxy2",@"version":[JWTools getProjectVersion]};
    
    [manger.manger GET:JWURLPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        JWLog(@"%@",responseObject);
        self.model = [[JWBottomModel alloc]initWithArr:responseObject];
        [self reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"error is %@",error);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.contentArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWBottomTableViewCell * bottomCell = [tableView dequeueReusableCellWithIdentifier:@"JWBottomTableViewCell"];
    
    JWBottomCotentModel * model = self.model.contentArr[indexPath.row];
    bottomCell.model = model;
    
    return bottomCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((self.height - 60) /10);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JWBottomCotentModel * model = self.model.contentArr[indexPath.row];
    JWBottomCotentType type = JWBottomCotentTypeList;
    if ([model.type isEqualToString:@"index"]) {
        type = JWBottomCotentTypeIndex;
    }else if ([model.type isEqualToString:@"fav"]) {
        type = JWBottomCotentTypeFav;
    }else if ([model.type isEqualToString:@"more"]) {
        type = JWBottomCotentTypeMore;
    }
    
    self.cellSelected(model,type);
}


@end
