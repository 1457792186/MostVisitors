//
//  JWBottomModel.m
//  MostVisitors
//
//  Created by scjy on 16/4/21.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBottomModel.h"

@implementation JWBottomModel

- (instancetype)initWithArr:(NSArray *)dataArr{
    self = [super init];
    if (self) {
        self.contentArr = [[NSMutableArray alloc]initWithCapacity:0];
        
        __weak typeof(self)mySelf = self;
        [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            JWBottomCotentModel * model = [[JWBottomCotentModel alloc]initWithDic:(NSDictionary *)obj];
            [mySelf.contentArr addObject:model];
        }];
    }
    return self;
}


@end
