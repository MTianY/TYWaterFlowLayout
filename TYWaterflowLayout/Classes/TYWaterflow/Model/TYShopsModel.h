//
//  TYShopsModel.h
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/20.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TYShopsModel : NSObject

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
