//
//  JWBannerContentModel.m
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBannerContentModel.h"

@implementation JWBannerContentModel

- (instancetype)initWithDic:(NSDictionary *)dataDic{
    self = [super init];
    if (self) {
        self.title = dataDic[@"title"];
        self.thumb = dataDic[@"thumb"];
        self.type = dataDic[@"type"];
        self.myGoto = dataDic[@"goto"];
        
    }
    return self;
}


@end
