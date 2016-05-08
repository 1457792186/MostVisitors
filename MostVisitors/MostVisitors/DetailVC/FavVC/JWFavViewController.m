//
//  JWFavViewController.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWFavViewController.h"

@interface JWFavViewController ()

@property (nonatomic,strong)UIBarButtonItem * editItem;
@property (nonatomic,strong)UIBarButtonItem * finishItem;

@end

@implementation JWFavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    
    if (self.isBack) {
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"back" withSelectImage:@"back" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.editItem = [UIBarButtonItem barItemWithImageName:nil withSelectImage:nil withHorizontalAlignment:UIControlContentHorizontalAlignmentRight withTittle:@"编辑" withTittleColor:[UIColor whiteColor] withTarget:self action:@selector(editCellAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.finishItem = [UIBarButtonItem barItemWithImageName:nil withSelectImage:nil withHorizontalAlignment:UIControlContentHorizontalAlignmentRight withTittle:@"完成" withTittleColor:[UIColor whiteColor] withTarget:self action:@selector(editCellAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = self.editItem;
    
//    self.favDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.favDataArray = [NSMutableArray arrayWithArray:@[@"崩坏学园2禁止接触女王成就怎么做",@"删档了做任务的钻石会不会按照120%返还?",@"崩坏学园2非洲新人的雾海庄园BOSS技巧",@"崩坏学园2炎狼维克多综合实力解析",@"崩坏学园2普罗米修斯的咆哮实战心得"]];
    if (self.favDataArray.count == 0) {
        self.title = @"暂无收藏";
    }
    
}

- (void)editCellAction{
    if (self.favDataArray.count == 0) return;
    
    for (int i = (int)self.favTableView.indexPathsForSelectedRows.count - 1; i >= 0; i--) {
        NSIndexPath * indexPath = self.favTableView.indexPathsForSelectedRows[i];
        [self.favDataArray removeObjectAtIndex:indexPath.row];
        [self.favTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
    }
    
    [self.favTableView setEditing:!self.favTableView.editing animated:YES];
    if (self.favTableView.editing) {
        self.navigationItem.rightBarButtonItem = self.finishItem;
    } else{
        self.navigationItem.rightBarButtonItem = self.editItem;
    }
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.favDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"favCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"favCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.favDataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.favDataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}


@end
