//
//  JWBottomModel.h
//  MostVisitors
//
//  Created by scjy on 16/4/21.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWBottomCotentModel.h"

@interface JWBottomModel : NSObject

@property (nonatomic,strong)NSMutableArray * contentArr;

- (instancetype)initWithArr:(NSArray *)dataArr;

@end
