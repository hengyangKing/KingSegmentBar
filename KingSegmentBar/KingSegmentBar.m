//
//  KingSegmentBar.m
//  KingSegmentBar
//
//  Created by J on 2017/6/24.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingSegmentBar.h"
#import "UIView+KingLayoutFrame.h"
#define kMinMargin 30

@interface KingSegmentBar()
{
    // 记录最后一次点击的按钮
    UIButton *_lastBtn;
}
/** 内容承载视图 */
@property (nonatomic, weak) UIScrollView *contentView;

/** 添加的按钮数据 */
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;

/** 指示器 */
@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic, strong) KingSegmentBarConfig *config;

@end
@implementation KingSegmentBar

+ (instancetype)segmentBarWithFrame: (CGRect)frame {
    KingSegmentBar *segmentBar = [[KingSegmentBar alloc] initWithFrame:frame];
    
    // 添加内容承载视图
    return segmentBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.config.barBGColor;
    }
    return self;
}
- (void)updateWithConfig: (void(^)(KingSegmentBarConfig *config))configBlock {

    if (configBlock) {
        configBlock(self.config);
    }
    
    if (self.config) {
        // 按照当前的 self.config 进行刷新
        self.backgroundColor = self.config.barBGColor;
        
        for (UIButton *btn in self.itemBtns) {
            [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
            [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
            btn.titleLabel.font = self.config.itemFont;
        }
        
        // 指示器
        self.indicatorView.backgroundColor = self.config.indicatorColor;
        self.indicatorView.hidden=!self.config.showIndicator;
        
        [self setNeedsLayout];
        [self layoutIfNeeded];   
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    // 数据过滤
    if (self.itemBtns.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
}
- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    
    // 删除之前添加过多额组件
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    
    
    // 根据所有的选项数据源， 创建Button, 添加到内容视图
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = self.itemBtns.count?self.itemBtns.count:0;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
        [btn setTitle:item forState:UIControlStateNormal];
        
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    
    // 手动刷新布局
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
}
#pragma mark - 私有方法
- (void)btnClick: (UIButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(KingSegmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate KingSegmentBar:self didSelectIndex:btn.tag fromIndex:_lastBtn.tag];
    }
    
    _selectIndex = btn.tag;
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width + self.config.indicatorExtraW * 2;
        self.indicatorView.centerX = btn.centerX;
    }];
    
    
    // 1. 县滚动到btn的位置
    
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;
    
    if (scrollX < 0) {
        scrollX = 0;
    }
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
    
}
#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    
    // 计算margin
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        totalBtnWidth += btn.width;
    }
    
    CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    
    
    CGFloat lastX = caculateMargin;
    for (UIButton *btn in self.itemBtns) {
        // w, h
        [btn sizeToFit];
        // y 0
        // x, y,
        btn.y = 0;
        
        btn.height=self.height-self.config.indicatorHeight;
        
        btn.x = lastX;
        
        lastX += btn.width + caculateMargin;
        
    }
    
    self.contentView.contentSize = CGSizeMake(lastX, 0);
    
    if (self.itemBtns.count == 0) {
        return;
    }
    UIButton *btn = self.itemBtns[self.selectIndex];
    self.indicatorView.width = btn.width + self.config.indicatorExtraW * 2;
    self.indicatorView.centerX = btn.centerX;
    self.indicatorView.height = self.config.indicatorHeight;
    self.indicatorView.y = self.height - self.indicatorView.height;
}
#pragma mark - 懒加载

- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}
- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = self.config.indicatorHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = self.config.indicatorColor;
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.backgroundColor=[UIColor clearColor];

        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}
-(KingSegmentBarConfig *)config
{
    if (!_config) {
        _config=[KingSegmentBarConfig defaultConfig];
    }
    return _config;
}
@end
