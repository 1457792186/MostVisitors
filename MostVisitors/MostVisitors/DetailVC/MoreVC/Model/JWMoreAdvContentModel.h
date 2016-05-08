//
//  JWMoreAdvContentModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWMoreAdvContentModel : NSObject

@property(nonatomic, copy)NSString *ID;

@property(nonatomic, copy)NSString *cid;

@property(nonatomic, copy)NSString *app_id;

@property(nonatomic, copy)NSString *app_bundleid;

@property(nonatomic, copy)NSString *app_sellerid;

@property(nonatomic, copy)NSString *app_version;

@property(nonatomic, copy)NSString *app_device;

@property(nonatomic, copy)NSString *app_name;

@property(nonatomic, copy)NSString *app_icon;

@property(nonatomic, copy)NSString *app_url;

@property(nonatomic, copy)NSString *app_desc;

@property(nonatomic, copy)NSString *app_price;

@property(nonatomic, copy)NSString *app_commend;

@property(nonatomic, copy)NSString *app_stars_count;

@property(nonatomic, copy)NSString * addtime;

@property(nonatomic, copy)NSString * edittime;

- (instancetype)initWithDic:(NSDictionary * )dic;

@end
