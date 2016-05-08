//
//  JWWebDetailViewController.h
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWShowViewController.h"
#import "JWListContentModel.h"
#import "JWAFNetWorking.h"


@interface JWWebDetailViewController : JWShowViewController

@property (nonatomic,copy)NSString * loadURL;

- (instancetype)initWithModel:(JWListContentModel*)model;

- (instancetype)initWithURL:(NSString *)loadURL;

@end
