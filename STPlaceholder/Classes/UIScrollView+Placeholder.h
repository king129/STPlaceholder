//
//  UIScrollView+Placeholder.h
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPlaceholderBaseView.h"

@interface UIScrollView (Placeholder)

@property (nonatomic,strong)STPlaceholderBaseView *st_holderView ;

@end

@interface UITableView (Placeholder)
@end

@interface UICollectionView (Placeholder)
@end
