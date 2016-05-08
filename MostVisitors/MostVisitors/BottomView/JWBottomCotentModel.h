//
//  JWBottomCotentModel.h
//  MostVisitors
//
//  Created by scjy on 16/4/22.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum bottomCotentType{
    JWBottomCotentTypeIndex,
    JWBottomCotentTypeList,
    JWBottomCotentTypeFav,
    JWBottomCotentTypeMore
}JWBottomCotentType;

@interface JWBottomCotentModel : NSObject

@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * icon;
@property (nonatomic,copy)NSString * type;
@property (nonatomic,copy)NSString * apiurl;

- (instancetype)initWithDic:(NSDictionary *)dataDic;

@end
