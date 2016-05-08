//
//  JWShowViewController.m
//  MostVisitors
//
//  Created by scjy on 16/4/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWShowViewController.h"
#import "RESideMenu.h"

@interface JWShowViewController ()


@property (nonatomic,strong)JWAFNetWorking * manger;



@end

@implementation JWShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"menu" withSelectImage:@"menu" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.manger = [JWAFNetWorking manger];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
