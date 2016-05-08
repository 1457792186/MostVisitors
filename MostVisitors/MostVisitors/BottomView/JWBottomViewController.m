//
//  JWBottomViewController.m
//  MostVisitors
//
//  Created by scjy on 16/4/16.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBottomViewController.h"
#import "JWBottomTableView.h"
#import "RESideMenu.h"
#import "JWNavigationViewController.h"
#import "JWHomeViewController.h"
#import "JWMoreViewController.h"
#import "JWFavViewController.h"
#import "JWListViewController.h"

@interface JWBottomViewController ()

@property (nonatomic,strong)JWBottomTableView * bottomTableView;

@end

@implementation JWBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bottomTableView = [[JWBottomTableView alloc]initWithFrame:CGRectMake(20.f, 30.f, jSCREENWIDTH/2, jSCREENHEIGH) style:UITableViewStylePlain];
    [self.view addSubview:self.bottomTableView];
    
    
    __weak typeof(self)mySelf = self;
    self.bottomTableView.cellSelected = ^(JWBottomCotentModel* model,JWBottomCotentType vcType){
        switch (vcType) {
            case JWBottomCotentTypeIndex:
                [mySelf.sideMenuViewController setContentViewController:[[JWNavigationViewController alloc]initWithRootViewController:[[JWHomeViewController alloc]init] ] animated:YES];
                break;
            case JWBottomCotentTypeList:
                [mySelf.sideMenuViewController setContentViewController:[[JWNavigationViewController alloc]initWithRootViewController:[[JWListViewController alloc]initWithModel:model withBack:NO] ] animated:YES];
                break;
            case JWBottomCotentTypeFav:
                [mySelf.sideMenuViewController setContentViewController:[[JWNavigationViewController alloc]initWithRootViewController:[[JWFavViewController alloc]init] ] animated:YES];
                break;
            case JWBottomCotentTypeMore:
                [mySelf.sideMenuViewController setContentViewController:[[JWNavigationViewController alloc]initWithRootViewController:[[JWMoreViewController alloc]init] ] animated:YES];
                break;
                
            default:
                break;
        }
        
        [mySelf.sideMenuViewController hideMenuViewController];
    };
    
    
}


@end
