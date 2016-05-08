//
//  JWWebDetailViewController.m
//  MostVisitors
//
//  Created by scjy on 16/5/3.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWWebDetailViewController.h"


@interface JWWebDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webDetailView;

@property (nonatomic,strong)JWListContentModel * listModel;

@end

@implementation JWWebDetailViewController

- (instancetype)initWithModel:(JWListContentModel*)model
{
    self = [super init];
    if (self) {
        self.listModel = model;
        self.title = @"详情";
        self.loadURL = @"";
    }
    return self;
}

- (instancetype)initWithURL:(NSString *)loadURL
{
    self = [super init];
    if (self) {
        self.listModel = [[JWListContentModel alloc]init];
        self.title = @"详情";
        self.loadURL = loadURL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"back" withSelectImage:@"back" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self.loadURL isEqualToString:@""]) {
        self.loadURL = [NSString stringWithFormat:@"%@/%@?action=newsshow&id=%@&format=html",JWBasicURL,JWURLPath,self.listModel.ID];
    }
    
    NSURL * requestURL = [NSURL URLWithString:[self.loadURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:requestURL];
    [self.webDetailView loadRequest:request];
    
}




@end
