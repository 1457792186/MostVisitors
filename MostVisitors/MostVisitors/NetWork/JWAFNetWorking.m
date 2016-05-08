//
//  JWAFNetWorking.m
//  MostVisitors
//
//  Created by scjy on 16/4/21.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWAFNetWorking.h"

@implementation JWAFNetWorking

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manger = [[JWAFNManger alloc]init];
        
    }
    return self;
}

+ (id)manger{
    return [[self alloc]init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static id idValue = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        idValue = [super allocWithZone:zone];
    });
    return idValue;
}

@end
