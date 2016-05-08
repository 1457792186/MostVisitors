//
//  JWHomeTableView.m
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWHomeTableView.h"

@implementation JWHomeTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self downRefreshGetData];
        }];
        
    }
    return self;
}
#pragma mark - NetWorking
- (void)downRefreshGetData{
    
    JWAFNetWorking * manger = [JWAFNetWorking manger];
    __weak typeof(self)mySelf = self;
    
    NSString * bannerURL = @"http://www.app4life.mobi/adslist.php?device=iPhone&from=com.ipadown.bhxy2&version=4.0&size=600x260&count=5";
    [manger.manger GET:[bannerURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        JWLog(@"%@",responseObject);
        self.bannerModel = [[JWBannerModel alloc]initWithArr:responseObject];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
    
    NSString * url = @"http://www.quweiwu.com/api.php?action=topicindex&curl=bhxy2&from=com.ipadown.bhxy2&version=4.0&size=600x260";
    
    [manger.manger GET:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [mySelf.mj_header endRefreshing];
        
        //        JWLog(@"%@",responseObject);
        NSDictionary * dataDic = (NSDictionary *)responseObject;
        NSArray * dataArr = dataDic[@"list"];
        mySelf.homeModel = [[JWHomeModel alloc]initWithArr:dataArr];
        
        [mySelf reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
    
    
    
}




@end
