//
//  JWListContentModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWListContentModel : NSObject

@property(nonatomic, copy)NSString *edittime;

@property(nonatomic, copy)NSString *curl;

@property(nonatomic, copy)NSString *thumb;

@property(nonatomic, copy)NSString *iscommend;

@property(nonatomic, copy)NSString *ishasvideo;

@property(nonatomic, copy)NSString *ID;

@property(nonatomic, copy)NSString *cname;

@property(nonatomic, copy)NSString *tags;

@property(nonatomic, copy)NSString *extradata;

@property(nonatomic, copy)NSString *cid;

@property(nonatomic, copy)NSString *title;

@property(nonatomic, copy)NSString *iszq;

@property(nonatomic, copy)NSString *thumb_2;

@property(nonatomic, copy)NSString *siteid;

@property(nonatomic, copy)NSString *aid;

@property(nonatomic, copy)NSString *views;

@property(nonatomic, copy)NSString * subcatename;
- (instancetype)initWithDic:(NSDictionary * )dic;

@end
