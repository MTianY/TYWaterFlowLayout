//
//  TYWaterFlowViewController.m
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYWaterFlowViewController.h"
#import "TYWaterFlowLayout.h"
#import "TYShopsModel.h"
#import "TYShopCell.h"

static NSString *const collectionViewCellID = @"collectionViewCellID";

@interface TYWaterFlowViewController () <UICollectionViewDataSource,TYWaterFlowLayoutDelegate>

@property (nonatomic, strong) NSArray *shops;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TYWaterFlowViewController

#pragma mark - 懒加载属性

- (NSArray *)shops {
    if (nil == _shops) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *shopArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempM = [NSMutableArray array];
        for (NSDictionary *dict in shopArray) {
            TYShopsModel *model = [TYShopsModel modelWithDict:dict];
            [tempM addObject:model];
        }
        _shops = tempM;
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

#pragma mark - 添加UICollectionView

- (void)setupCollectionView {
    
    TYWaterFlowLayout *flowLayout = [TYWaterFlowLayout waterFlowWithColCount:2];
    [flowLayout setupColSpace:10 rowSpace:10 andSectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    flowLayout.delegate = self;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TYShopCell class]) bundle:nil] forCellWithReuseIdentifier:collectionViewCellID];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TYShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellID forIndexPath:indexPath];
//    if (nil == cell) {
//        cell = [[TYShopCell alloc] init];
//    }
    cell.model = self.shops[indexPath.row];
    return cell;
}

#pragma mark - TYWaterFlowLayoutDelegate

- (CGFloat)waterFlowLayout:(TYWaterFlowLayout *)waterFlowLayout itemWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    TYShopsModel *model = self.shops[indexPath.row];
    CGFloat itemH = model.h / model.w  * itemWidth;
    return itemH;
}

@end
