//
//  TYHomeViewController.m
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYHomeViewController.h"
#import "TYWaterFlowViewController.h"

@interface TYHomeViewController ()

@end

@implementation TYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景色
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    // 添加导航栏右侧按钮
    [self setupNavRightItem];
}

#pragma mark - 添加导航栏右侧按钮

- (void)setupNavRightItem {
    UIButton *rightNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightNavBtn setTitle:@"瀑布流" forState:UIControlStateNormal];
    [rightNavBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightNavBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [rightNavBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightNavBtn sizeToFit];
    UIView *containerView = [[UIView alloc] initWithFrame:rightNavBtn.bounds];
    [containerView addSubview:rightNavBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containerView];
}

// 监听右侧按钮点击事件
- (void)rightBtnClick {
    TYWaterFlowViewController *waterflowVc = [[TYWaterFlowViewController alloc] init];
    waterflowVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:waterflowVc animated:YES];
}

@end
