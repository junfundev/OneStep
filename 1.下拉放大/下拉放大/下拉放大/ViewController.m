//
//  ViewController.m
//  下拉放大
//
//  Created by lijunfeng on 2016/10/19.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import "ViewController.h"
#import "UserCenterController.h"
#import "ScrollImageController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下拉放大Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"轮播图" style:UIBarButtonItemStylePlain target:self action:@selector(scroll)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下拉放大" style:UIBarButtonItemStylePlain target:self action:@selector(dropDwon)];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)scroll{
    ScrollImageController *user = [[ScrollImageController alloc] init];
    [self.navigationController pushViewController:user animated:YES];
}

- (void)dropDwon{
    UserCenterController *user = [[UserCenterController alloc] init];
    [self.navigationController pushViewController:user animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

