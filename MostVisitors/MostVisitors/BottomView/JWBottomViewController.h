//
//  JWBottomViewController.h
//  MostVisitors
//
//  Created by scjy on 16/4/16.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JWBottomTableView.h"
@interface JWBottomViewController : UIViewController


@property (weak, nonatomic) IBOutlet JWBottomTableView *contentTableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentTableViewWidth;


@end
