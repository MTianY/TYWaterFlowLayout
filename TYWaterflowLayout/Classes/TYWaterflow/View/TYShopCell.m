//
//  TYShopCell.m
//  TYWaterflowLayout
//
//  Created by 马天野 on 2017/4/21.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYShopCell.h"
#import "TYShopsModel.h"
#import <UIImageView+WebCache.h>

@interface TYShopCell ()

@property (weak, nonatomic) IBOutlet UIImageView *shopIcon;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLabel;

@end

@implementation TYShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setModel:(TYShopsModel *)model {
    _model = model;
    [self.shopIcon sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    self.shopPriceLabel.text = model.price;
}

@end
