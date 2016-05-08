//
//  JWBottomCotentModel.m
//  MostVisitors
//
//  Created by scjy on 16/4/22.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBottomCotentModel.h"

@implementation JWBottomCotentModel

- (instancetype)initWithDic:(NSDictionary *)dataDic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dataDic];
    }
    return self;
}


@end
