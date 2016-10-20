//
//  WYScrollView.h
//  下拉放大
//
//  Created by lijunfeng on 2016/10/20.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 遵循该代理就可以监控到网络滚动视图的index*/

@protocol WYScrollViewNetDelegate <NSObject>

@optional

/** 点中网络滚动视图后触发*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index;

@end

/** 遵循该代理就可以监控到本地滚动视图的index*/

@protocol WYScrollViewLocalDelegate <NSObject>

@optional

/** 点中本地滚动视图后触发*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index;

@end

@interface WYScrollView : UIView

/** 选中网络图片的索引*/
@property (nonatomic, strong) id <WYScrollViewNetDelegate> netDelagate;

/** 选中本地图片的索引*/
@property (nonatomic, strong) id <WYScrollViewLocalDelegate> localDelagate;

/** 占位图*/
@property (nonatomic, strong) UIImage *placeholderImage;

/** 滚动延时*/
@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;

/**
 *  本地图片
 *
 *  @param frame      位置
 *  @param imageArray 加载本地图片
 *
 */
- (instancetype) initWithFrame:(CGRect)frame WithLocalImages:(NSArray *)imageArray;

/**
 *  加载网络图片
 *
 *  @param frame      位置大小
 *  @param imageArray 名字
 *
 */
- (instancetype) initWithFrame:(CGRect)frame WithNetImages:(NSArray *)imageArray;

@end
