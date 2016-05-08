//
//  JWListTableViewCell.h
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWListContentModel.h"
#import <UIImageView+WebCache.h>

@interface JWListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeft;
@property (nonatomic,strong)JWListContentModel * model;

@end
