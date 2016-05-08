//
//  JWListTableViewCell.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWListTableViewCell.h"

@implementation JWListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(JWListContentModel *)model{
    if (!model)return;
    _model = model;
    __weak typeof(self)mySelf = self;
    
    if ([model.thumb isEqualToString:@""]&&[model.thumb_2 isEqualToString:@""]) {
        self.imageWidth.constant = 0.f;
        self.labelLeft.constant = 0.f;
        self.showLabel.text = model.title;
        [self setNeedsLayout];
        return;
    }
    
    if ([model.thumb_2 isEqualToString:@""]) {
        [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:model.thumb] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            mySelf.showImage.image = image;
            
            mySelf.showLabel.text = model.title;
        }];
    }else{
        [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:model.thumb_2] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            mySelf.showImage.image = image;
            
            mySelf.showLabel.text = model.title;
        }];
    }
    
}

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor colorWithWhite:0.5f alpha:0.5f] set];
    
    CGContextSetLineWidth(ctx, 0.5f);
    
    CGContextMoveToPoint(ctx, self.showImage.x, CGRectGetMaxY(rect) - 1.f);
    CGContextAddLineToPoint(ctx, jSCREENWIDTH - self.showImage.x, CGRectGetMaxY(rect) - 1.f);
    CGContextStrokePath(ctx);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
