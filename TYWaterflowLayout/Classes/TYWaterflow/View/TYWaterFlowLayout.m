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
 保存每一个item的attribute
 */
@property (nonatomic, strong) NSMutableArray *itemAttributes;

@end

@implementation TYWaterFlowLayout

#pragma mark - 懒加载属性

- (NSMutableDictionary *)colMaxY {
    if (nil == _colMaxY) {
        _colMaxY = [NSMutableDictionary dictionary];
    }
    return _colMaxY;
}

- (NSMutableArray *)itemAttributes {
    if (nil == _itemAttributes) {
        _itemAttributes = [NSMutableArray array];
    }
    return _itemAttributes;
}

#pragma mark - 布局
#pragma mark prepareLayout

- (void)prepareLayout {
    
}

@end
