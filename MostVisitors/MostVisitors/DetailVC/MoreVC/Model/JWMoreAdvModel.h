//
//  JWMoreAdvModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWMoreAdvContentModel.h"

@interface JWMoreAdvModel : NSObject

@property (nonatomic,strong)NSMutableArray * list;

- (instancetype)initWithArray:(NSArray * )arr;

@end
