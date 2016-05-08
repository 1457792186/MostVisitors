//
//  JWShowViewController.h
//  MostVisitors
//
//  Created by scjy on 16/4/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWBottomCotentModel.h"

@interface JWShowViewController : UIViewController

@property (nonatomic,strong)JWBottomCotentModel * model;

- (void)backAction;
@end
