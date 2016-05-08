//
//  JWBannerModel.m
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBannerModel.h"

@implementation JWBannerModel

- (instancetype)initWithArr:(NSArray * )arr{
    self = [super init];
    if (self) {
        self.banners = [[NSMutableArray alloc]initWithCapacity:0];
        __weak typeof(self)mySelf = self;
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            JWBannerContentModel * model = [[JWBannerContentModel alloc]initWithDic:obj];
            [mySelf.banners addObject:model];
        }];
    }
    return self;
}

@end
