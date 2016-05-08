//
//  JWHomeModel.m
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWHomeModel.h"

@implementation JWHomeModel

- (instancetype)initWithArr:(NSArray * )arr{
    self = [super init];
    if (self) {
        self.list = [[NSMutableArray alloc]initWithCapacity:0];
        self.nameArr = [[NSMutableArray alloc]initWithCapacity:0];
        
        __weak typeof(self)mySelf = self;
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary * dic = [[NSDictionary alloc]initWithDictionary:obj];
            NSString * name = dic[@"title"];
            [mySelf.nameArr addObject:name];
            NSArray * dicArr = dic[@"list"];
            JWListModel * model = [[JWListModel alloc]initWithArray:dicArr];
            [mySelf.list addObject:model];
        }];
    }
    return self;
}

@end
