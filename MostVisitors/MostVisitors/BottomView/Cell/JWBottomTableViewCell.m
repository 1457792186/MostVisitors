//
//  JWBottomTableViewCell.m
//  MostVisitors
//
//  Created by scjy on 16/4/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBottomTableViewCell.h"

@implementation JWBottomTableViewCell

- (void)awakeFromNib {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(JWBottomCotentModel *)model{
    if (!model)return;
    _model = model;
    __weak typeof(self)mySelf = self;
    
    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:model.icon] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        mySelf.bottomImageView.image = image;
        mySelf.bottomLabel.text = model.title;
    }];
    
}

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor colorWithWhite:1.f alpha:0.5f] set];
    
    CGContextSetLineWidth(ctx, 0.5f);
    
    CGContextMoveToPoint(ctx, CGRectGetMaxX(self.bottomImageView.frame), CGRectGetMaxY(rect) - 1.f);
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(self.bottomLabel.frame), CGRectGetMaxY(rect) - 1.f);
    CGContextStrokePath(ctx);
    
}

@end
