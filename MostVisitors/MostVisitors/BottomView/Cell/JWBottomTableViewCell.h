//
//  JWBottomTableViewCell.h
//  MostVisitors
//
//  Created by scjy on 16/4/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWBottomCotentModel.h"
#import <UIImageView+WebCache.h>

@interface JWBottomTableViewCell : UITableViewCell

@property (nonatomic,strong)JWBottomCotentModel * model;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@end
