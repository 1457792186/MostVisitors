//
//  JWNavigationViewController.m
//  MostVisitors
//
//  Created by scjy on 16/4/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWNavigationViewController.h"

@interface JWNavigationViewController ()

@end

@implementation JWNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar * navBar = [[UINavigationBar alloc]init];
    navBar.backgroundColor = [UIColor colorWithHexString:@"#ee4f7c"];
    navBar.barTintColor = [UIColor colorWithHexString:@"#ee4f7c"];
    
    [self setValue:navBar forKey:@"navigationBar"];
    
    NSDictionary * dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationBar.titleTextAttributes = dict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
