//
//  KingSegmentBarConfig.m
//  KingSegmentBar
//
//  Created by J on 2017/6/24.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingSegmentBarConfig.h"

@implementation KingSegmentBarConfig
+ (instancetype)defaultConfig
{
    KingSegmentBarConfig *config = [[KingSegmentBarConfig alloc] init];
    config.SegmentBarHeight(44).SegmentBarBackColor([UIColor clearColor]).SegmentBarItemNormalColor([UIColor redColor]).SegmentBarItemSelectColor([UIColor greenColor]).SegmentBarItemFont([UIFont systemFontOfSize:13]).SegmentBarIndicatorColor([UIColor yellowColor]).SegmentBarIndicatorHeight(2).SegmentBarIndicatorExtraW(10).SegmentBarShowIndicator(YES).SegmentContentBounces(NO).SegmentContentBackColor([UIColor clearColor]);
    return config;

}
#pragma mark set
-(void)setBounces:(BOOL)bounces
{
    _bounces=bounces;
}
-(void)setContentBGColor:(UIColor *)contentBGColor
{
    _contentBGColor=contentBGColor;
}
-(void)setBarHeight:(CGFloat)barHeight
{
    _barHeight=barHeight;
}
-(void)setBarBGColor:(UIColor *)barBGColor
{
    _barBGColor=barBGColor;
}
-(void)setItemNormalColor:(UIColor *)itemNormalColor
{
    _itemNormalColor=itemNormalColor;
}
-(void)setItemSelectColor:(UIColor *)itemSelectColor
{
    _itemSelectColor=itemSelectColor;
}
-(void)setItemFont:(UIFont *)itemFont
{
    _itemFont=itemFont;
}
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor=indicatorColor;
}
-(void)setIndicatorHeight:(CGFloat)indicatorHeight
{
    _indicatorHeight=indicatorHeight;
}
-(void)setIndicatorExtraW:(CGFloat)indicatorExtraW
{
    _indicatorExtraW=indicatorExtraW;
}
-(void)setShowIndicator:(BOOL )showIndicator
{
    _showIndicator=showIndicator;
}

-(KingSegmentBarConfig *(^)(BOOL ))SegmentContentBounces
{
    return ^(BOOL bounces){
        self.bounces=bounces;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(UIColor *))SegmentContentBackColor
{
    return ^(UIColor *color){
        self.contentBGColor=color;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(CGFloat))SegmentBarHeight
{
    return ^(CGFloat height){
        self.barHeight=height;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(UIColor *))SegmentBarBackColor
{
    return ^(UIColor *color){
        self.barBGColor=color;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(UIColor *))SegmentBarItemNormalColor
{
    return ^(UIColor *color){
        self.itemNormalColor=color;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(UIColor *))SegmentBarItemSelectColor
{
    return ^(UIColor *color){
        self.itemSelectColor=color;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(UIFont *))SegmentBarItemFont
{
    return ^(UIFont *font){
        self.itemFont=font;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(UIColor *))SegmentBarIndicatorColor
{
    return ^(UIColor *color){
        self.indicatorColor=color;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(CGFloat))SegmentBarIndicatorHeight
{
    return ^(CGFloat height){
        self.indicatorHeight=height;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(CGFloat))SegmentBarIndicatorExtraW
{
    return ^(CGFloat width){
        self.indicatorExtraW=width;
        return self;
    };
}
-(KingSegmentBarConfig *(^)(BOOL))SegmentBarShowIndicator
{
    return ^(BOOL show){
        self.showIndicator=show;
        return self;
    };
}
@end
