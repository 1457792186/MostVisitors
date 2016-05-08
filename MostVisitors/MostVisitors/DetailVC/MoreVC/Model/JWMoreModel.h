//
//  JWMoreModel.h
//  MostVisitors
//
//  Created by scjy on 16/5/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWMoreModel : NSObject

@property (nonatomic,copy)NSString * imageName;
@property (nonatomic,copy)NSString * tittleName;

- (instancetype)initWithImageName:(NSString *)imageName WithTittleName:(NSString *)tittleName;

@end
