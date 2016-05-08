//
//  JWBannerContentModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWBannerContentModel : NSObject
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * thumb;
@property (nonatomic,copy)NSString * type;
@property (nonatomic,copy)NSString * myGoto;

- (instancetype)initWithDic:(NSDictionary *)dataDic;
@end
