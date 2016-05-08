//
//  JWMoreModel.m
//  MostVisitors
//
//  Created by scjy on 16/5/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMoreModel.h"

@implementation JWMoreModel

- (instancetype)initWithImageName:(NSString *)imageName WithTittleName:(NSString *)tittleName
{
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.tittleName = tittleName;
    }
    return self;
}


@end
