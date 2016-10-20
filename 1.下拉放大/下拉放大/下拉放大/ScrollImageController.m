//
//  ScrollImageController.m
//  下拉放大
//
//  Created by lijunfeng on 2016/10/20.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import "ScrollImageController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "WYScrollView.h"

@interface ScrollImageController ()<WYScrollViewLocalDelegate,WYScrollViewNetDelegate>

/** 网络图片数组*/
@property(nonatomic,strong)NSArray *NetImageArray;

/** 本地图片数组*/
@property(nonatomic,strong)NSArray *localImageArray;

@end

@implementation ScrollImageController

-(NSArray *)NetImageArray
{
    if(!_NetImageArray)
    {
        _NetImageArray = @[@"http://ws.xzhushou.cn/focusimg/201508201549023.jpg",@"http://ws.xzhushou.cn/focusimg/52.jpg",@"http://ws.xzhushou.cn/focusimg/51.jpg",@"http://ws.xzhushou.cn/focusimg/50.jpg"];
    }
    return _NetImageArray;
}

-(NSArray *)localImageArray
{
    if(!_localImageArray)
    {
        _localImageArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    }
    return _localImageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    /** 创建网络滚动视图*/
    [self createNetScrollView];
    
    /** 创建本地滚动视图*/
//    [self createLocalScrollView];
}

-(void)createNetScrollView
{
    /** 设置网络scrollView的Frame及所需图片*/
    WYScrollView *WYNetScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) WithNetImages:self.NetImageArray];
    
    /** 设置滚动延时*/
    WYNetScrollView.AutoScrollDelay = 3;
    
    /** 设置占位图*/
    WYNetScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    
    
    /** 获取网络图片的index*/
    WYNetScrollView.netDelagate = self;
    
    /** 添加到当前View上*/
    [self.view addSubview:WYNetScrollView];
    
}

-(void)createLocalScrollView
{
    /** 设置本地scrollView的Frame及所需图片*/
    WYScrollView *WYLocalScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 200) WithLocalImages:self.localImageArray];
    
    /** 设置滚动延时*/
    WYLocalScrollView.AutoScrollDelay = 2;
    
    /** 获取本地图片的index*/
    WYLocalScrollView.localDelagate = self;
    
    /** 添加到当前View上*/
    [self.view addSubview:WYLocalScrollView];
}

/** 获取网络图片的index*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index
{
    NSLog(@"点中网络图片的下标是:%ld",(long)index);
}

/** 获取本地图片的index*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index
{
    NSLog(@"点中本地图片的下标是:%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
