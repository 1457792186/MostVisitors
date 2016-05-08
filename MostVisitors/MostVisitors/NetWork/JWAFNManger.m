//
//  JWAFNManger.m
//  MostVisitors
//
//  Created by scjy on 16/4/21.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWAFNManger.h"

@implementation JWAFNManger

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:JWBasicURL]];
    if (self) {
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    }
    return self;
}



@end
