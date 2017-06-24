//
//  KingSegmentBarVC.h
//  KingSegmentBar
//
//  Created by J on 2017/6/24.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KingSegmentBar.h"
@interface KingSegmentBarVC : UIViewController

@property (nonatomic,weak) KingSegmentBar *segmentBar;

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;

- (void)updateWithConfig: (void(^)(KingSegmentBarConfig *config))configBlock;



@end
