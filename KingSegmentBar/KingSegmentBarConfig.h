//
//  KingSegmentBarConfig.h
//  KingSegmentBar
//
//  Created by J on 2017/6/24.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KingSegmentBarConfig : NSObject
+ (instancetype)defaultConfig;
#pragma mark readonly
#pragma mark vc

/** 是否需要回弹 */
@property (nonatomic, assign,readonly) BOOL bounces;
/** content背景颜色 */
@property (nonatomic, strong,readonly) UIColor *contentBGColor;


#pragma mark bar
@property(nonatomic,assign,readonly)CGFloat barHeight;
/** bar背景颜色 */
@property (nonatomic, strong,readonly) UIColor *barBGColor;
/** item正常颜色 */
@property (nonatomic, strong,readonly) UIColor *itemNormalColor;
/** item选中颜色 */
@property (nonatomic, strong,readonly) UIColor *itemSelectColor;
/** item字体 */
@property (nonatomic, strong,readonly) UIFont *itemFont;
/** 指示器颜色*/
@property (nonatomic, strong,readonly) UIColor *indicatorColor;
/** 指示器高度*/
@property (nonatomic, assign,readonly) CGFloat indicatorHeight;
/** 额外宽度*/
@property (nonatomic, assign,readonly) CGFloat indicatorExtraW;
/** 是否展示指示器*/
@property (nonatomic, assign,readonly) BOOL showIndicator;


#pragma mark set
#pragma mark vc

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentContentBackColor)(UIColor *color);

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentContentBounces)(BOOL bounces);


#pragma mark bar


@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarHeight)(CGFloat height);

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarBackColor)(UIColor *color);

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarItemNormalColor)(UIColor *color);

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarItemSelectColor)(UIColor *color);

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarItemFont)(UIFont *itemFont);

@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarIndicatorColor)(UIColor *color);
@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarIndicatorHeight)(CGFloat height);
@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarIndicatorExtraW)(CGFloat ExtraWidth);
@property(nonatomic,copy)KingSegmentBarConfig *(^SegmentBarShowIndicator)(BOOL showIndicator);


@end
