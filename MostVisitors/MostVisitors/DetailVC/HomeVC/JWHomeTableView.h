//
//  JWHomeTableView.h
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
#import "JWAFNManger.h"
#import <MJExtension.h>
#import "JWHomeModel.h"
#import "JWBannerModel.h"

@interface JWHomeTableView : UITableView

@property (nonatomic,strong)JWHomeModel * homeModel;
@property (nonatomic,strong)JWBannerModel * bannerModel;


- (void)downRefreshGetData;


@end
