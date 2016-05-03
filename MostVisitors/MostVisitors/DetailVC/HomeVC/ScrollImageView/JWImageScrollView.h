//
//  JWImageScrollView.h
//  轮播图
//
//  Created by scjy on 16/3/6.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface JWImageScrollView : UIScrollView

@property (nonatomic,assign)NSInteger currentBannerCount;
@property (nonatomic,strong)NSMutableArray * imagesArray;
@property (nonatomic,strong)NSArray * imagesNameArray;
@property (nonatomic,strong)UIButton * currentView;
@property (nonatomic,strong)UIView * beyoundView;
@property (nonatomic,strong)UIView * laterView;


- (instancetype)initWithFrame:(CGRect)frame withImagesArray:(NSMutableArray *)imagesNameArray;

- (void)imagesArrayAdd;

- (void)viewGetImagesView;

- (void)leftShift;

- (void)rightShift;

@end
