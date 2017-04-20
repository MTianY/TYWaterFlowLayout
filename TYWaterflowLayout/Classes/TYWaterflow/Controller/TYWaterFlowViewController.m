//
//  TYWaterFlowViewController.m
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYWaterFlowViewController.h"
#import "TYWaterFlowLayout.h"

@interface TYWaterFlowViewController ()

@end

@implementation TYWaterFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

#pragma mark - 添加UICollectionView

- (void)setupCollectionView {
    
    TYWaterFlowLayout *flowLayout = [[TYWaterFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    
}

@end
