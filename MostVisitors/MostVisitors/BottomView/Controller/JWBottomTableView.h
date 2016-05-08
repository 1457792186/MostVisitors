//
//  JWBottomTableView.h
//  MostVisitors
//
//  Created by scjy on 16/4/16.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

#import "JWHomeViewController.h"
#import "JWMoreViewController.h"
#import "JWFavViewController.h"
#import "JWListViewController.h"

#import "JWBottomTableViewCell.h"
#import "JWBottomModel.h"


typedef void (^bottomTableViewSelect)(JWBottomCotentModel *,JWBottomCotentType);
@interface JWBottomTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)JWBottomModel * model;
@property (nonatomic,copy)bottomTableViewSelect cellSelected;


@end
