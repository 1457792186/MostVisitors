//
//  JWListModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWListContentModel.h"


@interface JWListModel : NSObject
@property (nonatomic,strong)NSMutableArray * list;

- (instancetype)initWithArray:(NSArray * )arr;

@end
