//
//  JWListContentModel.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWListContentModel.h"

@implementation JWListContentModel

- (instancetype)initWithDic:(NSDictionary * )dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
