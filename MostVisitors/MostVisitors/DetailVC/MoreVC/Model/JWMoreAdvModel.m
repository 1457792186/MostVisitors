//
//  JWMoreAdvModel.m
//  MostVisitors
//
//  Created by scjy on 16/5/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMoreAdvModel.h"

@implementation JWMoreAdvModel

- (instancetype)initWithArray:(NSArray * )arr{
    self = [super init];
    if (self) {
        self.list = [[NSMutableArray alloc]initWithCapacity:0];
        
        __weak typeof(self)mySelf = self;
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            JWMoreAdvContentModel * model = [[JWMoreAdvContentModel alloc]initWithDic:obj];
            [mySelf.list addObject:model];
        }];
    }
    return self;
}

@end
