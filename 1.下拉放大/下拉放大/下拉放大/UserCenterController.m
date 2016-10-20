//
//  UserCenterController.m
//  下拉放大
//
//  Created by lijunfeng on 2016/10/19.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import "UserCenterController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "UIView+Extension.h"

#define kHeaderViewH 200
NSString *const cellID = @"reuseIdentifier";

@interface UserCenterController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation UserCenterController{
    UIImageView *_headerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.fd_prefersNavigationBarHidden = YES;

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self addHeaderView];
}

- (void)addHeaderView{
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kHeaderViewH)];
    _headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_headerView];
    _headerView.image = [UIImage imageNamed:@"boy.jpg"];
    
    _headerView.contentMode = UIViewContentModeScaleAspectFill;
    _headerView.clipsToBounds = YES;
    
    self.tableView.contentInset = UIEdgeInsetsMake(kHeaderViewH, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kHeaderViewH, 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%@行",@(indexPath.row).stringValue];

    return cell;
}

/// 状态条改为白色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset = scrollView.contentOffset.y+scrollView.contentInset.top;
    
    NSLog(@"%f,%f,%f",scrollView.contentInset.top,scrollView.contentOffset.y,offset);
    
    if (offset <= 0) { // 下拉
        _headerView.y = 0;
    }
    else{ // 上划
        
    }
    
    _headerView.height = kHeaderViewH-offset;
}

@end
