//
//  JWListViewController.h
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWShowViewController.h"
#import "JWListTableView.h"
#import "JWWebDetailViewController.h"
#import "JWListTableViewCell.h"

@interface JWListViewController : JWShowViewController

@property (nonatomic,assign)BOOL isBack;

- (instancetype)initWithModel:(JWBottomCotentModel*)model withBack:(BOOL)isBack;
@property (weak, nonatomic) IBOutlet JWListTableView *showtableView;

@end
