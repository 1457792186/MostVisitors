//
//  JWFavViewController.h
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWShowViewController.h"

@interface JWFavViewController : JWShowViewController
@property (weak, nonatomic) IBOutlet UITableView *favTableView;

@property (nonatomic,strong)NSMutableArray * favDataArray;
@property (nonatomic,assign)BOOL isBack;

@end
