//
//  JWBannerModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWBannerContentModel.h"

@interface JWBannerModel : NSObject

@property (nonatomic,strong)NSMutableArray * banners;

- (instancetype)initWithArr:(NSArray * )arr;

@end
