
//
//  TYShopsModel.m
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYShopsModel.h"

@implementation TYShopsModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    TYShopsModel *model = [[TYShopsModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
