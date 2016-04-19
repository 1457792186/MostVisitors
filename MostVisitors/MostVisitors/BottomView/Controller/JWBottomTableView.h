//
//  JWBottomTableView.h
//  MostVisitors
//
//  Created by scjy on 16/4/16.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWBottomTableViewCell.h"

@interface JWBottomTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray * dataArr;



@end
