//
//  TYWaterFlowLayout.m
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYWaterFlowLayout.h"

@interface TYWaterFlowLayout ()

/**
 保存每一列最大的 Y 值
 */
@property (nonatomic, strong) NSMutableDictionary *colMaxY;

/**
 保存每一个 item 的 attribute
 */
@property (nonatomic, strong) NSMutableArray *itemAttributesM;

@end

@implementation TYWaterFlowLayout

#pragma mark - 懒加载属性

- (NSMutableDictionary *)colMaxY {
    if (nil == _colMaxY) {
        _colMaxY = [NSMutableDictionary dictionary];
    }
    return _colMaxY;
}

- (NSMutableArray *)itemAttributesM {
    if (nil == _itemAttributesM) {
        _itemAttributesM = [NSMutableArray array];
    }
    return _itemAttributesM;
}

#pragma mark - 构造方法

// 默认 2 列
- (instancetype)init {
    if (self = [super init]) {
        self.colTotalCount = 2;
    }
    return self;
}

// 根据列创建布局
- (instancetype)initWithColCount:(NSInteger)colCount {
    if (self = [super init]) {
        self.colTotalCount = colCount;
    }
    return self;
}

+ (instancetype)waterFlowWithColCount:(NSInteger)colCount {
    return [[self alloc] initWithColCount:colCount];
}

#pragma mark - 设置间距
- (void)setupColSpace:(NSInteger)colSpace rowSpace:(NSInteger)rowSpace andSectionInset:(UIEdgeInsets)sectionInset {
    self.colSpace = colSpace;
    self.rowSpace = rowSpace;
    self.sectionInsets = sectionInset;
}

#pragma mark - 布局
#pragma mark 准备操作

- (void)prepareLayout {
    [super prepareLayout];
    
    // 初始化字典
    for (int i = 0; i < self.colTotalCount; i++) {
        self.colMaxY[@(i)] = @(self.sectionInsets.top);
    }
    
    // 获取 item 的个数
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    // 为每一个 item 创建一个 Attributes 并存入数组
    [self.itemAttributesM removeAllObjects];
    for (int i = 0; i < itemCount; i++) {
        UICollectionViewLayoutAttributes *itemAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.itemAttributesM addObject:itemAttribute];
    }
}

#pragma mark 计算collectionView的contentSize

- (CGSize)collectionViewContentSize {
    
    __block NSNumber *maxIndex = @0;
    
    // 遍历字典,取出最长的那一列
    [self.colMaxY enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSNumber *obj, BOOL *stop) {
        if ([self.colMaxY[maxIndex] floatValue] < obj.floatValue) {
            maxIndex = key;
        }
    }];
    
    // contentSize
    return CGSizeMake(0, [self.colMaxY[maxIndex] floatValue] + self.sectionInsets.bottom);
    
}

#pragma mark 设置 item 的 attributes

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 根据 indexPath 获取 item 的 attribute
    UICollectionViewLayoutAttributes *layoutAttribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 计算 item 的尺寸
    
    // item 宽度
    CGFloat itemW = (self.collectionView.bounds.size.width - self.sectionInsets.left - self.sectionInsets.right - self.colSpace * (self.colTotalCount - 1)) / self.colTotalCount;
    
    // item 高度
    CGFloat itemH = 0;
    if ([self.delegate respondsToSelector:@selector(waterFlowLayout:itemWidth:atIndexPath:)]) {
        itemH = [self.delegate waterFlowLayout:self itemWidth:itemW atIndexPath:indexPath];
    }
    
    // 找出最短的那一列
    __block NSNumber *minIndex = @0;
    [self.colMaxY enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSNumber *obj, BOOL *stop) {
        if ([self.colMaxY[minIndex] floatValue] > obj.floatValue) {
            minIndex = key;
        }
    }];
    
    // item X值
    CGFloat itemX = self.sectionInsets.left + (self.colSpace + itemW) * minIndex.integerValue;
    
    // item Y值
    CGFloat itemY = [self.colMaxY[minIndex] floatValue] + self.rowSpace;
    
    layoutAttribute.frame = CGRectMake(itemX, itemY, itemW, itemH);
    
    // 更新字典
    self.colMaxY[minIndex] = @(CGRectGetMaxY(layoutAttribute.frame));
    
    return layoutAttribute;
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.itemAttributesM;
}

@end
