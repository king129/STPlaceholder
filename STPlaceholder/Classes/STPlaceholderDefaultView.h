//
//  THPlaceholderDefaultView.h
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import "STPlaceholderBaseView.h"

@interface STPlaceholderDefaultView : STPlaceholderBaseView

/**
 图标
 */
@property (nonatomic,strong)UIImageView *icon;
/**
 标题
 */
@property (nonatomic,strong)UILabel *titleLabel;
/**
 详细说明
 */
@property (nonatomic,strong)UILabel *detailsLabel;

+ (instancetype)defaultInstance ;

@end
