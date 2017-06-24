//
//  KingSegmentBar.h
//  KingSegmentBar
//
//  Created by J on 2017/6/24.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KingSegmentBarConfig.h"
@class KingSegmentBar;
@protocol KingSegmentBarDelegate<NSObject>

/**
 代理方法, 告诉外界, 内部的点击数据
 
 @param segmentBar segmentBar
 @param toIndex    选中的索引(从0开始)
 @param fromIndex  上一个索引
 */
- (void)KingSegmentBar: (KingSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;

@end
@interface KingSegmentBar : UIView
/**
 快速创建一个选项卡控件
 
 @param frame frame
 
 @return 选项卡控件
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;
/** 代理 */
@property (nonatomic, weak) id<KingSegmentBarDelegate> delegate;
/** 数据源 */
@property (nonatomic, strong) NSArray <NSString *>*items;
/** 当前选中的索引, 双向设置 */
@property (nonatomic, assign) NSInteger selectIndex;

- (void)updateWithConfig: (void(^)(KingSegmentBarConfig *config))configBlock;


@end
