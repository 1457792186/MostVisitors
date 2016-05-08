//
//  JWHomeModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWListModel.h"

@interface JWHomeModel : NSObject
@property (nonatomic,strong)NSMutableArray * list;
@property (nonatomic,strong)NSMutableArray * nameArr;

- (instancetype)initWithArr:(NSArray * )arr;

@end
