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
#import "UIColor+Common.h"

#define kHeaderViewH 200
NSString *const cellID = @"reuseIdentifier";

@interface UserCenterController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation UserCenterController{
    UIView *_headerView;
    UIImageView *_headerImageView;
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
    self.tableView.contentInset = UIEdgeInsetsMake(kHeaderViewH, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kHeaderViewH, 0, 0, 0);
    
    [self addHeaderView];
}

- (void)addHeaderView{
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kHeaderViewH)];
    _headerView.backgroundColor = [UIColor colorWithHexString:@"0xF8F8F8"];
    [self.view addSubview:_headerView];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    [_headerView addSubview:_headerImageView];
    _headerImageView.image = [UIImage imageNamed:@"boy.jpg"];
    _headerImageView.backgroundColor = [UIColor redColor];
    
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImageView.clipsToBounds = YES;
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
    
    if (offset <= 0) { // 下拉
        _headerView.y = 0;
        // 让headerView的高度始终等于偏移量
        _headerView.height = kHeaderViewH-offset;
        _headerImageView.height = _headerView.height;
        
    }
    else{ // 往上移动
        // 往上移动的时候headerView的高度不变
        _headerView.height = kHeaderViewH;
        _headerImageView.height = _headerView.height;

        // 只改变headerView的y值
        
        // 如果要headerView只保留64高度，则_headerView最多滑出kHeaderViewH-64
        CGFloat min = kHeaderViewH-64;
        _headerView.y = -MIN(min, offset);
        
        // 设置透明度
        CGFloat progress = 1-(offset/min);
        _headerImageView.alpha = progress;
        NSLog(@"%f",progress);
    }
}


@end
