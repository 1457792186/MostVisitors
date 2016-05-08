//
//  JWMoreViewController.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMoreViewController.h"
#import "JWFavViewController.h"
#import "JWWebDetailViewController.h"
#import "JWMoreModel.h"
#import "JWMoreAdvModel.h"
#import "JWAFNetWorking.h"

@interface JWMoreViewController ()
@property (weak, nonatomic) IBOutlet UITableView *moreTableView;

@property (nonatomic,strong)NSMutableArray * moreDataArray;


@end

@implementation JWMoreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    
    self.moreDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    [self getMoreDataArrayDate];
    
}

- (void)getMoreDataArrayDate{
    [self moreDataArrayWithHeaderName:@"个人收藏" WithCellType:@"10086" WithCellArr:@[[[JWMoreModel alloc]initWithImageName:@"plugin_icon_star" WithTittleName:@"我的收藏"]]];
    
    [self moreDataArrayWithHeaderName:@"系统设置" WithCellType:@"10086" WithCellArr:@[[[JWMoreModel alloc]initWithImageName:@"plugin_icon_setting" WithTittleName:@"清空缓存"]]];
    
    
    [self moreDataArrayWithHeaderName:@"建议反馈" WithCellType:@"10086" WithCellArr:@[
        [[JWMoreModel alloc]initWithImageName:@"plugin_icon_info" WithTittleName:@"关于我们"],
        [[JWMoreModel alloc]initWithImageName:@"plugin_icon_message" WithTittleName:@"意见建议反馈"]
        ]];
    
    
    JWMoreAdvModel * advModel = [self getAdvArray];
    [self moreDataArrayWithHeaderName:@"应用推荐" WithCellType:@"23333" WithCellArr:advModel.list];
}

- (JWMoreAdvModel *)getAdvArray{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    NSMutableArray * dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    NSString * advURL = @"http://www.app4life.mobi/applist.php";
    [manger GET:advURL parameters:@{@"format":@"json",@"from":@"com.ipadown.bhxy2",@"version":@"4.0",@"device":@"iPhone"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        JWLog(@"%@",responseObject);
        [dataArr addObjectsFromArray:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];

    JWMoreAdvModel * advModel = [[JWMoreAdvModel alloc]initWithArray:dataArr];
    return advModel;
}


- (void)moreDataArrayWithHeaderName:(NSString *)headerName WithCellType:(NSString *)isAdvert WithCellArr:(NSArray *)dataArr{
    NSDictionary * dataDic = @{@"headerName":headerName,@"isAdvert":isAdvert,@"dataArr":dataArr};
    
    [self.moreDataArray addObject:dataDic];
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        JWFavViewController * favVC = [[JWFavViewController alloc]init];
        favVC.isBack = YES;
        [self.navigationController pushViewController:favVC animated:YES];
    }else if (indexPath.section == 1){
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            JWWebDetailViewController * webVC = [[JWWebDetailViewController alloc]initWithURL:@"http://www.quweiwu.com/api.php?action=aboutus&version=4.0&appname=崩坏学园2攻略"];
            [self.navigationController pushViewController:webVC animated:YES];
        }else{
            
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.f;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.moreDataArray[section][@"headerName"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.moreDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.moreDataArray[section][@"dataArr"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dataDic = self.moreDataArray[indexPath.section];
    NSString * isAdvert = dataDic[@"isAdvert"];
    NSArray * dataArr = dataDic[@"dataArr"];
    
    if ([isAdvert isEqualToString:@"23333"]) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"favAdvCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"favAdvCell"];
        }
        
        return cell;
    }
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"favCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"favCell"];
    }
    
    JWMoreModel * moreModel = dataArr[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:moreModel.imageName];
    cell.textLabel.text = moreModel.tittleName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
