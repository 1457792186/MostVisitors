//
//  JWListTableView.h
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
#import "JWAFNManger.h"
#import "JWBottomCotentModel.h"
#import <MJExtension.h>
#import "JWListModel.h"

@interface JWListTableView : UITableView

@property (nonatomic,strong)JWBottomCotentModel * model;
@property (nonatomic,strong)JWListModel * listModel;

@property (nonatomic,strong)NSMutableArray * dataArray;

- (void)downRefreshGetData;

- (void)upRefreshGetData;

@end
