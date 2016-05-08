//
//  JWHomeViewController.m
//  MostVisitors
//
//  Created by scjy on 16/5/2.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWHomeViewController.h"
#import "JWBottomCotentModel.h"
#import "JWListViewController.h"
#import "JWHomeTableHeadeView.h"
#import "JWImageScrollView.h"


@interface JWHomeViewController ()<UISearchBarDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *homeSearchBar;

@property (weak, nonatomic) IBOutlet JWHomeTableView *showTableView;

@property (nonatomic,strong)JWImageScrollView * bannerScrolerView;
@property (nonatomic,strong)JWBannerModel * bannerModel;
@property (nonatomic,strong)NSTimer * bannerTimer;
@end

@implementation JWHomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(bannerTimerAction) userInfo:nil repeats:YES];
    
    if (self.bannerScrolerView) {
        NSInteger currentPage = self.bannerScrolerView.currentBannerCount;
        for (NSInteger i = 0; i < currentPage; i++) {
            [self.bannerScrolerView rightShift];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"崩坏学园2攻略";
    
    self.homeSearchBar.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    [self.showTableView registerNib:[UINib nibWithNibName:@"JWListTableViewCell" bundle:nil] forCellReuseIdentifier:@"JWListTableViewCell"];
    
    [self.showTableView downRefreshGetData];
}

- (void)keyboardFrameChanged:(NSNotification *)notification{
    self.homeSearchBar.showsCancelButton = YES;
    for (UIView *view in [[self.homeSearchBar.subviews lastObject] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancelButton = (UIButton *)view;
            cancelButton.enabled = YES;
            [cancelButton setTintColor:[UIColor whiteColor]];
            [cancelButton setTitle:@"取消"  forState:UIControlStateNormal];
            [cancelButton addTarget:self action:@selector(cancelSearchAction) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
}

#pragma mark -UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([searchBar.text isEqualToString:@""]) {
        [self cancelSearchAction];
        return;
    }
    
    JWBottomCotentModel * model = [[JWBottomCotentModel alloc]initWithDic:@{@"title":[NSString stringWithFormat:@"搜索：%@",searchBar.text],@"icon":@"",@"type":@"",@"apiurl":[NSString stringWithFormat:@"http://www.quweiwu.com/api.php?action=newslist&curl=bhxy2&keywords=%@&pagesize=20&p=",searchBar.text]}];
    JWListViewController * listVC = [[JWListViewController alloc]initWithModel:model withBack:YES];
    [self cancelSearchAction];
    
    [self.navigationController pushViewController:listVC animated:YES];
    
}

- (NSMutableArray *)getImageArr:(JWBannerModel *)model{
    NSMutableArray * arr = [[NSMutableArray alloc]initWithCapacity:0];
    __weak typeof(arr)myArr = arr;
    [model.banners enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JWBannerContentModel * bannerModel = (JWBannerContentModel *)obj;
        [myArr addObject:bannerModel.thumb];
    }];
    
    return arr;
}

#pragma mark - ButtonAction
- (void)sendMessage{
    if ([self.homeSearchBar.text isEqualToString:@""])return;
    
    self.homeSearchBar.text = @"";
    [self.homeSearchBar resignFirstResponder];
}

- (void)cancelSearchAction{
    self.homeSearchBar.text = @"";
    [self.homeSearchBar resignFirstResponder];
    self.homeSearchBar.showsCancelButton = NO;
}

- (void)bannerButtonAction{
    JWBannerContentModel * bannerModel = self.showTableView.bannerModel.banners[self.bannerScrolerView.currentBannerCount];
    JWWebDetailViewController * webVC = [[JWWebDetailViewController alloc]initWithURL:bannerModel.myGoto];
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 140.f;
    }
    return 40.f;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        self.bannerModel = self.showTableView.bannerModel;
        NSMutableArray * imageArr = [self getImageArr:self.bannerModel];
        if (imageArr.count <= 0) {
            return nil;
        }
        self.bannerScrolerView = [[JWImageScrollView alloc]initWithFrame:CGRectMake(0.f, 0.f, [UIScreen mainScreen].bounds.size.width, 140.f) withImagesArray:imageArr];
        self.bannerScrolerView.delegate = self;
        [self.bannerScrolerView.currentView addTarget:self action:@selector(bannerButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        return self.bannerScrolerView;
    }
    JWHomeTableHeadeView * headerView = [[[NSBundle mainBundle]loadNibNamed:@"JWHomeTableHeadeView" owner:nil options:nil]lastObject];
    
    headerView.homeHeaderLabel.text = self.showTableView.homeModel.nameArr[section - 1];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.f;
}

#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section <= 0) {
        return;
    }
    JWListModel * model = self.showTableView.homeModel.list[indexPath.section - 1];
    JWWebDetailViewController * webVC = [[JWWebDetailViewController alloc]initWithModel:model.list[indexPath.row]];
    
    [self.navigationController pushViewController:webVC animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return (self.showTableView.homeModel.nameArr.count + 1);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    JWListModel * model = self.showTableView.homeModel.list[section - 1];
    return model.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWListTableViewCell * listCell = [tableView dequeueReusableCellWithIdentifier:@"JWListTableViewCell"];
    JWListModel * model = self.showTableView.homeModel.list[indexPath.section - 1];
    listCell.model = model.list[indexPath.row];
    return listCell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.bannerScrolerView.contentOffset.x >= self.bannerScrolerView.frame.size.width * 2) {
        [self.bannerScrolerView rightShift];
    } else if (self.bannerScrolerView.contentOffset.x <= 0.f){
        [self.bannerScrolerView leftShift];
    }
    
    
}

- (void)bannerTimerAction{
    [self.bannerScrolerView rightShift];
    
}

@end
