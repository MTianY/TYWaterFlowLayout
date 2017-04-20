//
//  TYWaterFlowLayout.h
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYWaterFlowLayout;
@protocol TYWaterFlowLayoutDelegate <NSObject>

@required
// 计算 item 高度的代理方法
- (CGFloat)waterFlowLayout:(TYWaterFlowLayout *)waterFlowLayout itemWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath;

@end

@interface TYWaterFlowLayout : UICollectionViewLayout

/** 总列数 */
@property (nonatomic, assign) NSInteger colTotalCount;

/** 内边距 */
@property (nonatomic, assign) UIEdgeInsets sectionInsets;

/** 列间距 */
@property (nonatomic, assign) NSInteger colSpace;

/** 行间距 */
@property (nonatomic, assign) NSInteger rowSpace;

/** 代理属性 */
@property (nonatomic, weak) id<TYWaterFlowLayoutDelegate> delegate;

/** 设置边距 */
- (void)setupColSpace:(NSInteger)colSpace rowSpace:(NSInteger)rowSpace andSectionInset:(UIEdgeInsets)sectionInset;

// 由列数创建布局
- (instancetype)initWithColCount:(NSInteger)colCount;
+ (instancetype)waterFlowWithColCount:(NSInteger)colCount;

@end
