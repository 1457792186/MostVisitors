//
//  JWListViewController.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWListViewController.h"


@interface JWListViewController ()

@end

@implementation JWListViewController

- (instancetype)initWithModel:(JWBottomCotentModel*)model withBack:(BOOL)isBack{
    self = [super init];
    if (self) {
        self.model = model;
        self.title = model.title;
        self.isBack = isBack;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isBack) {
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"back" withSelectImage:@"back" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.showtableView registerNib:[UINib nibWithNibName:@"JWListTableViewCell" bundle:nil] forCellReuseIdentifier:@"JWListTableViewCell"];
    self.showtableView.model = self.model;
    
    [self.showtableView downRefreshGetData];
    
}



#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.f;
}

#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JWWebDetailViewController * webVC = [[JWWebDetailViewController alloc]initWithModel:self.showtableView.dataArray[indexPath.row]];
    
    [self.navigationController pushViewController:webVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.showtableView.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWListTableViewCell * listCell = [tableView dequeueReusableCellWithIdentifier:@"JWListTableViewCell"];
    listCell.model = self.showtableView.dataArray[indexPath.row];
    return listCell;
}


@end
