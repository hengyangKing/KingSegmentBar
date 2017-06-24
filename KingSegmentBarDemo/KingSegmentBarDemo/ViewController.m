//
//  ViewController.m
//  KingSegmentBarDemo
//
//  Created by J on 2017/6/24.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "KingSegmentBarVC.h"
@interface ViewController ()
@property(nonatomic,weak)KingSegmentBarVC *segmentBar;

@end

@implementation ViewController

-(KingSegmentBarVC *)segmentBar
{
    if (!_segmentBar) {
        KingSegmentBarVC *bar=[[KingSegmentBarVC alloc]init];
        [self addChildViewController:bar];
        _segmentBar=bar;
    }
    return _segmentBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self setUpDataSource];

}
-(void)setUpUI
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor grayColor]];
//    self.segmentBar.segmentBar.frame=CGRectMake(0, 0, 300, 40);
//    self.navigationItem.titleView=self.segmentBar.segmentBar;
    
    self.segmentBar .view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.segmentBar.view];
}
-(void)setUpDataSource
{
    UIViewController *vc1=[[UIViewController alloc]init];
    vc1.view.backgroundColor=[UIColor purpleColor];
    
    UIViewController *vc2=[[UIViewController alloc]init];
    vc2.view.backgroundColor=[UIColor orangeColor];

    UIViewController *vc3=[[UIViewController alloc]init];
    vc3.view.backgroundColor=[UIColor blackColor];
    
    [self.segmentBar setUpWithItems:@[@"title1title1title1title1title1title1",@"title2title2title2title2title2title2",@"title3title3title3title3title3title3"] childVCs:@[vc1,vc2,vc3]];
    
    [self.segmentBar updateWithConfig:^(KingSegmentBarConfig *config) {
        config.SegmentBarBackColor([UIColor orangeColor]);
    }];
}





@end
